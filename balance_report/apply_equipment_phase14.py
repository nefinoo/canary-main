#!/usr/bin/env python3
"""Frozen Hell phase 14: remove unused Deadly spell augments, level equipment and quest weapons.

Run: python3 balance_report/apply_equipment_phase14.py --apply
Dry run without --apply. Applies after stages 4, 5 and 10.
"""
from __future__ import annotations
import argparse
import os
import re
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
XML = ROOT / "data/items/items.xml"
ITEM = re.compile(r'<item\s+id="(?P<id>\d+)"(?=\s|>)[\s\S]*?</item>')
DEADLY = re.compile(
    r'(?m)^([ \t]*)<attribute key="Deadly[^"]*" value="[^"]+">[ \t]*\r?\n'
    r'(?:[ \t]*<attribute key="value" value="[^"]+"/>[ \t]*\r?\n)+'
    r'\1</attribute>[ \t]*(?:\r?\n|$)', re.IGNORECASE
)
ACTIVE_DEADLY = re.compile(r'(?m)^[ \t]*<attribute key="Deadly[^"]+" value="[^"]+">', re.IGNORECASE)
EMPTY_AUGMENTS = re.compile(
    r'(?m)^([ \t]*)<attribute key="augments" value="1">[ \t]*\r?\n'
    r'\1</attribute>[ \t]*(?:\r?\n|$)'
)
GEAR = {
    3387: ("demon helmet", {}),
    3388: ("demon armor", {}),
    3389: ("demon legs", {}),
    3399: ("elven mail", {"armor": (35, 135)}),
    8095: ("ranger legs", {"armor": (27, 115), "maxmanapoints": (250, 350)}),
    3408: ("bonelord helmet", {"armor": (25, 90), "maxmanapoints": (350, 450)}),
    37609: ("green demon helmet", {}),
    37608: ("green demon armor", {}),
    37607: ("green demon legs", {}),
}
QUEST_WEAPONS = {
    7368: "deadly star",
    3303: "deadly axe",
    895: "deadly wand",
    7415: "deadly basher",
    7390: "deadly blade",
}

def replace_attribute(block: str, item_id: int, key: str, old: int, new: int) -> str:
    before = f'<attribute key="{key}" value="{old}"/>'
    after = f'<attribute key="{key}" value="{new}"/>'
    if block.count(before) == 1 and block.count(after) == 0:
        return block.replace(before, after, 1)
    if block.count(before) == 0 and block.count(after) == 1:
        return block
    raise ValueError(f"ID {item_id}: expected a single {key} {old} or {new}")

def gate_weapon(block: str, item_id: int) -> str:
    opening = re.search(
        r'(?m)^([ \t]*)<attribute key="script" value="moveevent(?:;weapon)?">[ \t]*\r?\n', block
    )
    if not opening:
        raise ValueError(f"Quest weapon {item_id}: missing moveevent script")
    end = block.find("</attribute>", opening.end())
    if end < 0:
        raise ValueError(f"Quest weapon {item_id}: invalid script body")
    body = block[opening.end():end]
    lv = re.findall(r'<attribute key="level" value="(\d+)"/>', body)
    if len(lv) > 1:
        raise ValueError(f"Quest weapon {item_id}: duplicate levels")
    if lv:
        if lv[0] not in ("60", "1000"):
            raise ValueError(f"Quest weapon {item_id}: unexpected current level {lv[0]}")
        body = body.replace(f'<attribute key="level" value="{lv[0]}"/>',
                            '<attribute key="level" value="1000"/>', 1)
    else:
        newline = "\r\n" if "\r\n" in block else "\n"
        body = opening.group(1) + '\t<attribute key="level" value="1000"/>' + newline + body
    body = body.replace('<attribute key="unproperly" value="true"/>',
                        '<attribute key="unproperly" value="false"/>')
    return block[:opening.end()] + body + block[end:]

def patch(xml: str) -> tuple[str, int, int]:
    if not xml.startswith('<?xml version="1.0" encoding="ISO-8859-1"?>'):
        raise ValueError("Unexpected items.xml header/encoding")
    visited = {}
    count_removed = 0
    def one(match: re.Match[str]) -> str:
        nonlocal count_removed
        item_id = int(match.group("id"))
        block = match.group()
        if item_id in GEAR or item_id in QUEST_WEAPONS:
            if item_id in visited:
                raise ValueError(f"Duplicate important ID {item_id}")
            visited[item_id] = 1
            expected = (GEAR[item_id][0] if item_id in GEAR else QUEST_WEAPONS[item_id])
            if f'name="{expected}"' not in block[:250]:
                raise ValueError(f"ID {item_id}: expected name {expected}")
        if item_id in GEAR:
            for key, (old, new) in GEAR[item_id][1].items():
                block = replace_attribute(block, item_id, key, old, new)
        if item_id in QUEST_WEAPONS:
            block = gate_weapon(block, item_id)

        before = len(ACTIVE_DEADLY.findall(block))
        block, removed = DEADLY.subn("", block)
        if len(ACTIVE_DEADLY.findall(block)) != 0 or removed != before:
            raise ValueError(f"ID {item_id}: not all {before} Deadly augments safely removed ({removed})")
        count_removed += removed
        block = EMPTY_AUGMENTS.sub("", block)
        return block

    result = ITEM.sub(one, xml)
    needed = set(GEAR) | set(QUEST_WEAPONS)
    if set(visited) != needed:
        raise ValueError(f"Expected item IDs absent: {sorted(needed - set(visited))}")
    if ACTIVE_DEADLY.search(result):
        raise ValueError("Deadly augment remains in items.xml")
    return result, count_removed, len(visited)

def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    raw = XML.read_bytes()
    original = raw.decode("latin-1")
    updated, removed, checked = patch(original)
    twice, removed_again, _ = patch(updated)
    if updated != twice or removed_again != 0:
        raise ValueError("Phase 14 not idempotent")
    print(f"PASS: checked {checked} item IDs; removed {removed} active Deadly augments")
    if not args.apply:
        print("DRY RUN. Use --apply to update data/items/items.xml.")
        return
    if updated == original:
        print("Already up to date.")
        return
    handle, temp = tempfile.mkstemp(prefix=".fh-phase14-", dir=XML.parent)
    try:
        with os.fdopen(handle, "wb") as file:
            file.write(updated.encode("latin-1"))
        os.chmod(temp, XML.stat().st_mode)
        os.replace(temp, XML)
    finally:
        if os.path.exists(temp):
            os.unlink(temp)
    print("APPLIED: progressive armor, no active Deadly spell augments, and level 1000 weapon requirements.")

if __name__ == "__main__":
    main()
