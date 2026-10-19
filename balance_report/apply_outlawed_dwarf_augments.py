#!/usr/bin/env python3
"""Frozen Hell phase 3: add spell augments to Outlawed Dwarf progression gear.

Edits data/items/items.xml by item ID; ISO-8859-1 safe, idempotent.
Dry-run unless --apply is specified.
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
MARK = "<!-- FROZEN_HELL_OUTLAWED_DWARFS_AUGMENTS_V1 -->"
EQUIPMENT = (
    (3366, "magic plate armor", (
        ("berserk", "increased damage", 7),
        ("fierce berserk", "increased damage", 7),
    )),
    (3420, "demon shield", (("fierce berserk", "increased damage", 6),)),
    (3414, "mastermind shield", (("berserk", "increased damage", 6),)),
    (3364, "golden legs", (("fierce berserk", "increased damage", 5),)),
)


def patch(text: str) -> tuple[str, list[int]]:
    if not text.startswith('<?xml version="1.0" encoding="ISO-8859-1"?>'):
        raise ValueError("items.xml header/encoding unexpected")
    newline = "\r\n" if "\r\n" in text[:2000] else "\n"
    changed = []
    for item_id, expected_name, augments in EQUIPMENT:
        regex = re.compile(r'<item\s+id="' + str(item_id) + r'"(?=\s|>)[\s\S]*?</item>')
        matches = list(regex.finditer(text))
        if len(matches) != 1:
            raise ValueError(f"ID {item_id}: expected exactly one item, got {len(matches)}")
        m = matches[0]
        block = m.group(0)
        if re.search(r'\bname="' + re.escape(expected_name) + r'"', block[:240]) is None:
            raise ValueError(f"ID {item_id}: unexpected item name")
        if MARK in block:
            if block.count('<attribute key="augments"') != 1:
                raise ValueError(f"ID {item_id}: marker found, malformed augment block")
            continue
        if '<attribute key="augments"' in block:
            raise ValueError(f"ID {item_id}: different augments exist; no overwrite")
        script = re.search(r'(?m)^([ \t]*)<attribute key="script"\s+value="', block)
        if script is None:
            raise ValueError(f"ID {item_id}: missing equip script attribute")
        indent = script.group(1)
        nested = indent + "\t"
        leaf = nested + "\t"
        lines = [indent + MARK, indent + '<attribute key="augments" value="1">']
        for spell, kind, value in augments:
            lines += [
                nested + f'<attribute key="{spell}" value="{kind}">',
                leaf + f'<attribute key="value" value="{value}"/>',
                nested + "</attribute>",
            ]
        lines.append(indent + "</attribute>")
        insertion = newline.join(lines) + newline
        block = block[:script.start()] + insertion + block[script.start():]
        text = text[:m.start()] + block + text[m.end():]
        changed.append(item_id)
    return text, changed


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()

    raw = XML.read_bytes()
    updated, changed = patch(raw.decode("latin-1"))
    twice, changed_twice = patch(updated)
    if twice != updated or changed_twice:
        raise ValueError("Idempotency validation failed")
    print(f"Checked {len(EQUIPMENT)} equipment IDs; updated: {changed}")
    if not args.apply or not changed:
        print("Dry run or already up-to-date. No file changed.")
        return 0

    output = updated.encode("latin-1")
    fd, temporary = tempfile.mkstemp(prefix=".fh-dwarfs-", dir=XML.parent)
    try:
        with os.fdopen(fd, "wb") as file:
            file.write(output)
        os.chmod(temporary, XML.stat().st_mode)
        os.replace(temporary, XML)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)
    print("Saved approved Outlawed Dwarf augments to items.xml.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
