#!/usr/bin/env python3
"""Frozen Hell: install the approved Knight equipment augments by item ID.

Operates on data/items/items.xml only, preserving ISO-8859-1, line endings and
all unrelated items. --apply writes atomically; without it this is a dry run.
"""
from __future__ import annotations

import argparse
import os
from pathlib import Path
import re
import sys
import tempfile

ROOT = Path(__file__).resolve().parent.parent
XML = ROOT / "data" / "items" / "items.xml"
MARK = "<!-- FROZEN_HELL_KNIGHT_AUGMENTS_V1 -->"

# (item ID, expected name, [(spell name, augment type, numeric value), ...])
EQUIPMENT = (
    (3370, "knight armor", (("berserk", "increased damage", 5),)),
    (3371, "knight legs", (("fierce berserk", "increased damage", 4),)),
    (3392, "royal helmet", (("berserk", "cooldown", 500),)),
    (3416, "dragon shield", (("fierce berserk", "increased damage", 5),)),
    (3386, "dragon scale mail", (
        ("berserk", "increased damage", 5),
        ("fierce berserk", "increased damage", 5),
    )),
    (3360, "golden armor", (
        ("fierce berserk", "increased damage", 8),
        ("fierce berserk", "critical extra damage", 5),
        ("fierce berserk", "mana leech", 3),
    )),
)


def patch(text: str) -> tuple[str, list[int]]:
    if not text.startswith('<?xml version="1.0" encoding="ISO-8859-1"?>'):
        raise ValueError("items.xml has an unexpected encoding/header")

    newline = "\r\n" if "\r\n" in text[:2000] else "\n"
    changed: list[int] = []
    for item_id, expected_name, augments in EQUIPMENT:
        pattern = re.compile(
            r'<item\s+id="' + str(item_id) + r'"(?=\s|>)[\s\S]*?</item>'
        )
        matches = list(pattern.finditer(text))
        if len(matches) != 1:
            raise ValueError(f"ID {item_id}: expected 1 item, got {len(matches)}")

        match = matches[0]
        block = match.group(0)
        if re.search(r'\bname="' + re.escape(expected_name) + r'"', block[:250]) is None:
            raise ValueError(f"ID {item_id}: name mismatch (expected {expected_name})")

        if MARK in block:
            if block.count('<attribute key="augments"') != 1:
                raise ValueError(f"ID {item_id}: marker exists but augment block invalid")
            continue

        if '<attribute key="augments"' in block:
            raise ValueError(f"ID {item_id}: augments already defined; refusing overwrite")

        script = re.search(
            r'(?m)^([ \t]*)<attribute key="script"\s+value="', block
        )
        if script is None:
            raise ValueError(f"ID {item_id}: missing script attribute")

        indent = script.group(1)
        nested = indent + "\t"
        leaf = nested + "\t"
        lines = [
            indent + MARK,
            indent + '<attribute key="augments" value="1">',
        ]
        for spell, kind, value in augments:
            lines.extend((
                nested + f'<attribute key="{spell}" value="{kind}">',
                leaf + f'<attribute key="value" value="{value}"/>',
                nested + "</attribute>",
            ))
        lines.append(indent + "</attribute>")
        insertion = newline.join(lines) + newline

        block = block[:script.start()] + insertion + block[script.start():]
        text = text[:match.start()] + block + text[match.end():]
        changed.append(item_id)

    return text, changed


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()

    original = XML.read_bytes()
    text = original.decode("latin-1")
    updated, changed = patch(text)
    # The second application MUST change nothing, proving idempotency.
    twice, changed_again = patch(updated)
    if twice != updated or changed_again:
        raise ValueError("idempotency check failed")
    print(f"Checked {len(EQUIPMENT)} equipment records; modified: {changed}")

    if not changed:
        print("Already up to date.")
        return 0
    if not args.apply:
        print("Dry run. Pass --apply to save the changes.")
        return 0

    output = updated.encode("latin-1")
    fd, tmp = tempfile.mkstemp(prefix=".items-augments-", dir=XML.parent)
    try:
        with os.fdopen(fd, "wb") as handle:
            handle.write(output)
        os.chmod(tmp, XML.stat().st_mode)
        os.replace(tmp, XML)
    finally:
        if os.path.exists(tmp):
            os.unlink(tmp)
    print("Saved data/items/items.xml with approved Knight augments.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
