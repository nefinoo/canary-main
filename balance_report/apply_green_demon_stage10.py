#!/usr/bin/env python3
"""Phase 10: level-1000 Green Demon gear. XML is ISO-8859-1 and must stay so.
Dry run by default; --apply writes safely. Idempotent with earlier stages.
"""
from __future__ import annotations
import argparse
import os
from pathlib import Path
import re
import tempfile

ROOT = Path(__file__).resolve().parent.parent
XML = ROOT / "data/items/items.xml"
MARK = "<!-- FROZEN_HELL_GREEN_DEMON_PHASE10 -->"
# ID: (expected name, HP, Mana). Four universal clothing pieces;
# the Nightmare Shield ID6390 keeps its existing defensive properties.
GEAR = {
    37609: ("green demon helmet", 250, 250),
    37608: ("green demon armor", 650, 100),
    37607: ("green demon legs", 400, 350),
    37610: ("green demon slippers", 150, 200),
}

def patch(source: str) -> tuple[str, list[int]]:
    changed = []
    newline = "\r\n" if "\r\n" in source[:5000] else "\n"
    for item_id, (name, hp, mana) in GEAR.items():
        rx = re.compile(r'<item\s+id="' + str(item_id) + r'"(?=\s|>)[\s\S]*?</item>')
        matches = list(rx.finditer(source))
        if len(matches) != 1:
            raise ValueError(f"item ID {item_id}: expected exactly 1 entry, got {len(matches)}")
        match = matches[0]
        block = match.group()
        if f'name="{name}"' not in block[:160]:
            raise ValueError(f"item ID {item_id}: name mismatch")
        if '<attribute key="level" value="1000"/>' not in block:
            raise ValueError(f"item ID {item_id}: level 1000 requirement missing")
        if MARK in block:
            for key, value in (("maxhitpoints", hp), ("maxmanapoints", mana)):
                if block.count(f'<attribute key="{key}" value="{value}"/>') != 1:
                    raise ValueError(f"item ID {item_id}: invalid existing {key}")
            continue
        if re.search(r'<attribute key="max(?:hitpoints|manapoints)"', block):
            raise ValueError(f"item ID {item_id}: custom HP/mana already defined")
        anchor = re.search(r'(?m)^([ \t]*)<attribute key="primarytype"', block)
        if not anchor:
            raise ValueError(f"item ID {item_id}: cannot locate attribute insertion")
        indent = anchor.group(1)
        insert = newline.join((
            indent + MARK,
            indent + f'<attribute key="maxhitpoints" value="{hp}"/>',
            indent + f'<attribute key="maxmanapoints" value="{mana}"/>',
            "",
        ))
        block = block[:anchor.start()] + insert + block[anchor.start():]
        source = source[:match.start()] + block + source[match.end():]
        changed.append(item_id)
    return source, changed

def main() -> None:
    cli = argparse.ArgumentParser()
    cli.add_argument("--apply", action="store_true")
    args = cli.parse_args()
    old = XML.read_bytes()
    xml = old.decode("latin-1")
    result, changed = patch(xml)
    second, again = patch(result)
    if second != result or again:
        raise ValueError("Idempotency check failed")
    print(f"Validated four lvl1000 Green Demon items; changed: {changed}")
    if not args.apply or result == xml:
        print("DRY RUN" if not args.apply else "Already up to date")
        return
    fd, tmp = tempfile.mkstemp(prefix=".green-demon-", dir=XML.parent)
    try:
        with os.fdopen(fd, "wb") as handle:
            handle.write(result.encode("latin-1"))
        os.chmod(tmp, XML.stat().st_mode)
        os.replace(tmp, XML)
    finally:
        if os.path.exists(tmp):
            os.remove(tmp)

if __name__ == "__main__":
    main()
