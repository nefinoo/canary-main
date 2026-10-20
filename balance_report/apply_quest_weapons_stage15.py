#!/usr/bin/env python3
"""Frozen Hell phase 15: weapon damage balance for the five level-1000 quest weapons.

Only touches data/items/items.xml by exact item ID. Latin-1, newline-preserving,
fail-fast, idempotent. Dry-run by default; --apply writes atomically.
Run AFTER phase14 in the balance workflow.
"""
from __future__ import annotations

import argparse
import os
import re
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
XML = ROOT / "data/items/items.xml"
ITEMS = {
    7368: ("deadly star", 250, 100),
    3303: ("deadly axe", 52, 110),
    895: ("deadly wand", None, None),
    7415: ("deadly basher", 44, 110),
    7390: ("deadly blade", 47, 110),
}

def put_once(block: str, old: str, new: str, item_id: int) -> str:
    if block.count(old) == 1 and block.count(new) == 0:
        return block.replace(old, new, 1)
    if block.count(old) == 0 and block.count(new) == 1:
        return block
    raise ValueError(f"ID {item_id}: expected exactly one old or new value ({old}, {new})")

def patch_block(item_id: int, block: str, newline: str) -> str:
    name, original_attack, target_attack = ITEMS[item_id]
    if f'name="{name}"' not in block[:250]:
        raise ValueError(f"Item ID {item_id} has unexpected name")
    if block.count('<attribute key="level" value="1000"/>') != 1:
        raise ValueError(f"ID {item_id}: missing or duplicate level 1000 gate")
    if item_id == 895:
        block = put_once(
            block, 'key="script" value="moveevent;weapon"',
            'key="script" value="moveevent;weapon"', item_id
        ) if 'key="script" value="moveevent;weapon"' not in block else block
        if block.count('key="script" value="moveevent;weapon"') != 1:
            raise ValueError("Wand is not registered as a weapon")
        if block.count('<attribute key="weaponType" value="wand"/>') < 1:
            raise ValueError("Wand weaponType missing")
        anchor = '\t\t\t<attribute key="weaponType" value="wand"/>' + newline
        insert = ''.join(
            '\t\t\t<attribute key="' + k + '" value="' + v + '"/>' + newline
            for k, v in (("wandtype", "energy"), ("fromdamage", "250"), ("todamage", "350"))
        )
        if block.count(anchor) != 1:
            raise ValueError("Wand nested weaponType is not unique")
        if 'key="fromdamage"' not in block and 'key="todamage"' not in block:
            block = block.replace(anchor, anchor + insert, 1)
        else:
            if block.count(insert) != 1:
                raise ValueError("Wand damage attributes differ from phase 15")
        if block.count('key="wandtype" value="energy"') != 1:
            raise ValueError("Expected exactly one energy wandtype")
        return block
    if original_attack is None:
        raise ValueError(f"Unknown attack config for {item_id}")
    block = put_once(
        block, f'<attribute key="attack" value="{original_attack}"/>',
        f'<attribute key="attack" value="{target_attack}"/>', item_id
    )
    if item_id == 7368:
        block = put_once(
            block, 'key="script" value="moveevent"',
            'key="script" value="moveevent;weapon"', item_id
        )
        if '<attribute key="weaponType" value="distance"/>' not in block:
            raise ValueError("Deadly star has no registered distance weapon type")
        if '<attribute key="hitchance" value="100"/>' not in block:
            raise ValueError("Deadly star accuracy changed; reassess its balance")
    else:
        if block.count('key="script" value="moveevent;weapon"') != 1:
            raise ValueError(f"ID {item_id}: unregistered melee weapon")
    return block

def patch(xml: str) -> tuple[str, list[int]]:
    if not xml.startswith('<?xml version="1.0" encoding="ISO-8859-1"?>'):
        raise ValueError("Unexpected items.xml encoding")
    newline = '\r\n' if '\r\n' in xml[:10000] else '\n'
    changed = []
    for item_id in ITEMS:
        rx = re.compile(r'<item\s+id="' + str(item_id) + r'"(?=\s|>)[\s\S]*?</item>')
        found = list(rx.finditer(xml))
        if len(found) != 1:
            raise ValueError(f"Item ID {item_id}: expected one entry, found {len(found)}")
        hit = found[0]
        old = hit.group()
        new = patch_block(item_id, old, newline)
        if new != old:
            xml = xml[:hit.start()] + new + xml[hit.end():]
            changed.append(item_id)
    return xml, changed

def main() -> None:
    p = argparse.ArgumentParser()
    p.add_argument("--apply", action="store_true")
    args = p.parse_args()
    raw = XML.read_bytes()
    old = raw.decode("latin-1")
    new, changed = patch(old)
    twice, again = patch(new)
    if again or twice != new:
        raise ValueError("Phase 15 is not idempotent")
    print(f"Phase 15: verified five lvl1000 quest weapons; changes: {changed}")
    if not args.apply:
        print("DRY RUN; --apply saves the result")
        return
    if not changed:
        print("Already applied")
        return
    fd, temp = tempfile.mkstemp(prefix=".fh-weapons15-", dir=XML.parent)
    try:
        with os.fdopen(fd, "wb") as fp:
            fp.write(new.encode("latin-1"))
        os.chmod(temp, XML.stat().st_mode)
        os.replace(temp, XML)
    finally:
        if os.path.exists(temp):
            os.unlink(temp)
    print("APPLIED phase 15")

if __name__ == "__main__":
    main()
