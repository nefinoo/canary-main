#!/usr/bin/env python3
"""Frozen Hell phase 5: level 850 rare equipment and 850-1000 monster balance.

Dry-run by default; use --apply only in the balance branch.
Item records are matched by ID, never by display name alone.
Stage 5 now accepts phase-14 final mana bonuses (350/450), so the workflow
can be rerun without reverting the latest approved progression.
File encodings and original newlines remain unchanged.
"""
from __future__ import annotations

import argparse
import os
from pathlib import Path
import re
import tempfile

ROOT = Path(__file__).resolve().parent.parent
XML = ROOT / "data" / "items" / "items.xml"

ITEM_EDITS = {
    3399: ("elven mail", (
        ('<attribute key="maxhitpoints" value="100"/>', '<attribute key="maxhitpoints" value="600"/>'),
        ('<attribute key="level" value="650"/>', '<attribute key="level" value="850"/>'),
    )),
    8095: ("ranger legs", (
        ('<attribute key="maxhitpoints" value="50"/>', '<attribute key="maxhitpoints" value="350"/>'),
        ('<attribute key="maxmanapoints" value="50"/>', '<attribute key="maxmanapoints" value="350"/>'),
        ('<attribute key="level" value="650"/>', '<attribute key="level" value="850"/>'),
    )),
    3408: ("bonelord helmet", (
        ('<attribute key="maxmanapoints" value="100"/>', '<attribute key="maxmanapoints" value="450"/>'),
        ('<attribute key="level" value="650"/>', '<attribute key="level" value="850"/>'),
    )),
}

MONSTER_EDITS = {
    "data-canary/monster/Custom/Demons/hell soldier.lua": (
        ("monster.experience = 24500000", "monster.experience = 26000000"),
        ("monster.health = 17500", "monster.health = 18500"),
        ("monster.maxHealth = 17500", "monster.maxHealth = 18500"),
        ("interval = 3000, chance = 50, type = COMBAT_FIREDAMAGE",
         "interval = 3000, chance = 45, type = COMBAT_FIREDAMAGE"),
        ("{id = 3399, chance = 200}", "{id = 3399, chance = 350}"),
        ("{id = 8095, chance = 180}", "{id = 8095, chance = 150}"),
        ("{id = 3408, chance = 180}", "{id = 3408, chance = 120}"),
    ),
    "data-canary/monster/Custom/Undead Humanoids/undead mage.lua": (
        ("monster.experience = 25000000", "monster.experience = 28000000"),
        ("monster.health = 15500", "monster.health = 17000"),
        ("monster.maxHealth = 15500", "monster.maxHealth = 17000"),
        ("interval = 3000, chance = 60, type = COMBAT_DEATHDAMAGE",
         "interval = 3000, chance = 50, type = COMBAT_DEATHDAMAGE"),
        ("interval = 5000, chance = 35, type = COMBAT_MANADRAIN",
         "interval = 5000, chance = 25, type = COMBAT_MANADRAIN"),
        ("{id = 3399, chance = 180}", "{id = 3399, chance = 120}"),
        ("{id = 8095, chance = 180}", "{id = 8095, chance = 220}"),
        ("{id = 3408, chance = 220}", "{id = 3408, chance = 350}"),
    ),
}


def exact_or_done(source: str, old: str, new: str, context: str) -> str:
    count_old = source.count(old)
    count_new = source.count(new)
    if count_old == 1 and count_new == 0:
        return source.replace(old, new, 1)
    if count_old == 0 and count_new == 1:
        return source
    raise ValueError(
        f"{context}: unexpected occurrence counts for {old!r}: "
        f"old={count_old}, new={count_new}"
    )


def patch_xml(source: str) -> str:
    if not source.startswith('<?xml version="1.0" encoding="ISO-8859-1"?>'):
        raise ValueError("Unexpected items.xml encoding/header")
    for item_id, (name, changes) in ITEM_EDITS.items():
        pattern = re.compile(r'<item\s+id="' + str(item_id) + r'"(?=\s|>)[\s\S]*?</item>')
        matches = list(pattern.finditer(source))
        if len(matches) != 1:
            raise ValueError(f"Item ID {item_id}: expected one entry, found {len(matches)}")
        match = matches[0]
        block = match.group(0)
        if f'name="{name}"' not in block[:180]:
            raise ValueError(f"Item ID {item_id}: unexpected item name")
        if "<!-- FROZEN_HELL_ELVEN_SET_PHASE4 -->" not in block:
            raise ValueError(f"Item ID {item_id}: phase 4 augments missing")
        for old, new in changes:
            block = exact_or_done(block, old, new, f"items.xml ID {item_id}")
        source = source[:match.start()] + block + source[match.end():]
    return source


def patch_monster(source: str, path: str) -> str:
    for old, new in MONSTER_EDITS[path]:
        source = exact_or_done(source, old, new, path)
    return source


def atomic_replace(path: Path, payload: bytes) -> None:
    fd, tmp = tempfile.mkstemp(prefix=".fh-stage5-", dir=path.parent)
    try:
        with os.fdopen(fd, "wb") as out:
            out.write(payload)
        os.chmod(tmp, path.stat().st_mode)
        os.replace(tmp, path)
    finally:
        if os.path.exists(tmp):
            os.remove(tmp)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    pending = {}

    before_xml = XML.read_bytes()
    updated_xml = patch_xml(before_xml.decode("latin-1")).encode("latin-1")
    if patch_xml(updated_xml.decode("latin-1")).encode("latin-1") != updated_xml:
        raise ValueError("XML transformation is not idempotent")
    if updated_xml != before_xml:
        pending[XML] = updated_xml

    for relative in MONSTER_EDITS:
        path = ROOT / relative
        before = path.read_bytes()
        decoded = before.decode("utf-8")
        updated = patch_monster(decoded, relative)
        if patch_monster(updated, relative) != updated:
            raise ValueError(f"Monster transformation is not idempotent: {relative}")
        payload = updated.encode("utf-8")
        if payload != before:
            pending[path] = payload

    print("Stage 5: rare IDs 3399/8095/3408 checked; monster files checked: 2")
    print("Pending files:", len(pending))
    for path in pending:
        print(" ", path.relative_to(ROOT))
    if not args.apply:
        print("DRY RUN: nothing changed. Add --apply to modify.")
        return
    for path, payload in pending.items():
        atomic_replace(path, payload)
    print(f"APPLIED: {len(pending)} files; unchanged files were preserved.")


if __name__ == "__main__":
    main()
