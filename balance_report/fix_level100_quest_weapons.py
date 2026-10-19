#!/usr/bin/env python3
"""Frozen Hell: fix the five level-100 quest weapons by item ID.

Changes only data/items/items.xml, preserving its original Latin-1 bytes,
line endings and unrelated items. Idempotent; without --apply performs dry-run.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parent.parent
XML_PATH = ROOT / "data" / "items" / "items.xml"
IDS = (3341, 3287, 3288, 3319, 3309)


def exactly_once(text: str, old: str, new: str, item_id: int) -> str:
    count = text.count(old)
    if count != 1:
        raise ValueError(f"ID {item_id}: expected one {old!r}; found {count}")
    return text.replace(old, new, 1)


def transform(item_id: int, block: str, nl: str) -> str:
    if item_id == 3341:
        # Wand damage is read from fromdamage/todamage, NOT item attack.
        if 'value="moveevent;weapon"' in block and 'key="fromdamage"' in block:
            return block
        block = exactly_once(block, '\t\t<attribute key="attack" value="50"/>' + nl, "", item_id)
        block = exactly_once(block, 'key="script" value="moveevent"', 'key="script" value="moveevent;weapon"', item_id)
        block = exactly_once(
            block,
            '\t\t\t<attribute key="slot" value="hand"/>',
            nl.join([
                '\t\t\t<attribute key="level" value="100"/>',
                '\t\t\t<attribute key="slot" value="hand"/>',
                '\t\t\t<attribute key="weaponType" value="wand"/>',
                '\t\t\t<attribute key="wandtype" value="energy"/>',
                '\t\t\t<attribute key="fromdamage" value="40"/>',
                '\t\t\t<attribute key="todamage" value="60"/>',
            ]),
            item_id,
        )
    elif item_id == 3287:
        # Moveevent limits who can equip the star; weapon registers ranged attacks.
        if 'value="moveevent;weapon"' in block and block.count('key="weaponType" value="distance"') >= 2:
            return block
        block = exactly_once(block, 'key="script" value="moveevent"', 'key="script" value="moveevent;weapon"', item_id)
        block = exactly_once(
            block,
            '\t\t\t<attribute key="slot" value="hand"/>',
            '\t\t\t<attribute key="slot" value="hand"/>' + nl +
            '\t\t\t<attribute key="weaponType" value="distance"/>',
            item_id,
        )
    else:
        # Prevent dealing damage before level 100 (rather than half damage).
        if 'key="unproperly" value="true"' in block:
            block = exactly_once(
                block, 'key="unproperly" value="true"',
                'key="unproperly" value="false"', item_id
            )
        elif 'key="unproperly" value="false"' not in block:
            raise ValueError(f"ID {item_id}: missing wield restriction")
        if item_id == 3319 and 'key="slot" value="hand"' not in block:
            block = exactly_once(
                block,
                '\t\t\t<attribute key="weaponType" value="axe"/>',
                '\t\t\t<attribute key="weaponType" value="axe"/>' + nl +
                '\t\t\t<attribute key="slot" value="hand"/>',
                item_id,
            )
    return block


def update(xml: str) -> tuple[str, list[int]]:
    if not xml.startswith('<?xml version="1.0" encoding="ISO-8859-1"?>'):
        raise ValueError("Unexpected items.xml encoding/header; refusing edit")
    newline = "\r\n" if "\r\n" in xml[:2000] else "\n"
    changed = []
    for item_id in IDS:
        pattern = re.compile(r'<item\s+id="' + str(item_id) + r'"(?=\s|>)[\s\S]*?</item>')
        matches = list(pattern.finditer(xml))
        if len(matches) != 1:
            raise ValueError(f"ID {item_id}: expected one XML item; found {len(matches)}")
        match = matches[0]
        old = match.group(0)
        new = transform(item_id, old, newline)
        if new != old:
            xml = xml[:match.start()] + new + xml[match.end():]
            changed.append(item_id)
    return xml, changed


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true", help="Write verified changes to items.xml")
    args = parser.parse_args()
    original = XML_PATH.read_bytes()
    text = original.decode("latin-1")
    updated, ids_changed = update(text)
    new = updated.encode("latin-1")
    print(f"Quest weapons reviewed: {', '.join(map(str, IDS))}")
    print(f"Items changed: {ids_changed}")
    if not ids_changed:
        print("Already up to date; nothing to write.")
        return 0
    if not args.apply:
        print("Dry-run only. Supply --apply to write items.xml.")
        return 0
    # Atomic replace, only after *all five* records passed validation.
    import os
    import tempfile
    fd, temp = tempfile.mkstemp(prefix=".items-quest-", dir=XML_PATH.parent)
    try:
        with os.fdopen(fd, "wb") as f:
            f.write(new)
        os.replace(temp, XML_PATH)
    finally:
        if os.path.exists(temp):
            os.remove(temp)
    print("items.xml updated successfully.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
