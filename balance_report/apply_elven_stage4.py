#!/usr/bin/env python3
"""Frozen Hell phase 4: level-gated Elven rare set and pre-650 loot cleanup.

Dry-run by default. With --apply, edits data/items/items.xml (Latin-1)
and existing custom monster Lua files. The script is idempotent and retains
file encodings/newlines. Quest/Boss/Arena/Custom folders are excluded from
the monster loot sweep.
"""
from __future__ import annotations

import argparse
import os
from pathlib import Path
import re
import tempfile

ROOT = Path(__file__).resolve().parent.parent
XML = ROOT / "data" / "items" / "items.xml"
CUSTOM = ROOT / "data-canary" / "monster" / "Custom"
MARK = "<!-- FROZEN_HELL_ELVEN_SET_PHASE4 -->"
# Monster drop chances have base 100000, not percentages.
# Before level 650 these extremely strong pieces are no longer dropped.
FIRST_SET_MONSTER_EXPERIENCE = 15_000_000
QUEST_DIRS = {"Bosses", "Arena", "Custom"}
ITEMS = {
    3399: ("elven mail", (
        ("fierce berserk", "increased damage", 12),
        ("berserk", "increased damage", 12),
    )),
    8095: ("ranger legs", (
        ("fierce berserk", "increased damage", 6),
        ("berserk", "increased damage", 6),
    )),
    3408: ("bonelord helmet", (
        ("Deadly Core", "base", 10),
        ("Deadly Tornado", "base", 10),
        ("fierce berserk", "increased damage", 3),
        ("berserk", "increased damage", 3),
    )),
}


def patch_items(text: str) -> tuple[str, list[int]]:
    if not text.startswith('<?xml version="1.0" encoding="ISO-8859-1"?>'):
        raise ValueError("Unexpected items.xml header")
    newline = "\r\n" if "\r\n" in text[:4000] else "\n"
    changed = []
    for item_id, (expected_name, augments) in ITEMS.items():
        regex = re.compile(
            r'<item\s+id="' + str(item_id) + r'"(?=\s|>)[\s\S]*?</item>'
        )
        found = list(regex.finditer(text))
        if len(found) != 1:
            raise ValueError(f"ID {item_id}: {len(found)} item blocks found")
        item = found[0]
        block = item.group(0)
        if re.search(r'\bname="' + re.escape(expected_name) + r'"', block[:250]) is None:
            raise ValueError(f"ID {item_id}: name mismatch")
        if MARK in block:
            if '<attribute key="level" value="650"/>' not in block:
                raise ValueError(f"ID {item_id}: marker present, level 650 missing")
            continue
        if block.count('<attribute key="level" value="100"/>') != 1:
            raise ValueError(f"ID {item_id}: expected level 100 exactly once")
        block = block.replace(
            '<attribute key="level" value="100"/>',
            '<attribute key="level" value="650"/>',
            1,
        )
        script = re.search(
            r'(?m)^([ \t]*)<attribute key="script" value="moveevent"',
            block,
        )
        if script is None:
            raise ValueError(f"ID {item_id}: equipment moveevent missing")
        indent = script.group(1)
        nested, leaf = indent + "\t", indent + "\t\t"
        output = [
            indent + MARK,
            indent + '<attribute key="augments" value="1">',
        ]
        for spell, kind, amount in augments:
            output.extend([
                nested + f'<attribute key="{spell}" value="{kind}">',
                leaf + f'<attribute key="value" value="{amount}"/>',
                nested + "</attribute>",
            ])
        output.append(indent + "</attribute>")
        replacement = newline.join(output) + newline
        # Match only the outer closing tag at exactly the starting indentation.
        old_aug = re.search(
            r'(?m)^([ \t]*)<attribute key="augments" value="1">[ \t]*\r?\n'
            r'[\s\S]*?^\1</attribute>[ \t]*\r?\n',
            block,
        )
        if old_aug:
            block = block[:old_aug.start()] + replacement + block[old_aug.end():]
        else:
            script = re.search(
                r'(?m)^([ \t]*)<attribute key="script" value="moveevent"',
                block,
            )
            if script is None:
                raise ValueError(f"ID {item_id}: missing script insertion point")
            block = block[:script.start()] + replacement + block[script.start():]
        text = text[:item.start()] + block + text[item.end():]
        changed.append(item_id)
    return text, changed


LOOT_RE = re.compile(
    r'(?m)^[ \t]*\{[ \t]*id[ \t]*=[ \t]*(?:3399|8095|3408)[ \t]*,'
    r'[^\r\n]*\}[ \t]*,[ \t]*(?:--[^\r\n]*)?\r?\n'
)


def patch_early_loot(text: str, file: Path) -> tuple[str, int]:
    if file.relative_to(CUSTOM).parts[0] in QUEST_DIRS:
        return text, 0
    # Respect real boss/quest monsters wherever they are located.
    if re.search(r'\bboss\s*=\s*true\b', text):
        return text, 0
    xp = re.search(r'(?m)^[ \t]*monster\.experience\s*=\s*(\d+)', text)
    if xp is None or int(xp.group(1)) >= FIRST_SET_MONSTER_EXPERIENCE:
        return text, 0
    return LOOT_RE.subn("", text)


def encode_lua(data: bytes) -> tuple[str, str]:
    try:
        return data.decode("utf-8"), "utf-8"
    except UnicodeDecodeError:
        return data.decode("latin-1"), "latin-1"


def atomic_write(path: Path, payload: bytes) -> None:
    fd, tmp = tempfile.mkstemp(prefix=".fh-stage4-", dir=path.parent)
    try:
        with os.fdopen(fd, "wb") as f:
            f.write(payload)
        os.chmod(tmp, path.stat().st_mode)
        os.replace(tmp, path)
    finally:
        if os.path.exists(tmp):
            os.unlink(tmp)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    before = XML.read_bytes()
    after, ids = patch_items(before.decode("latin-1"))
    second, again = patch_items(after)
    if second != after or again:
        raise ValueError("XML patch is not idempotent")
    pending = {}
    if after.encode("latin-1") != before:
        pending[XML] = after.encode("latin-1")
    removed_total = 0
    changed_files = []
    for file in sorted(CUSTOM.rglob("*.lua")):
        raw = file.read_bytes()
        text, encoding = encode_lua(raw)
        updated, count = patch_early_loot(text, file)
        check, n2 = patch_early_loot(updated, file)
        if updated != check or n2:
            raise ValueError(f"Loot patch is not idempotent: {file}")
        if count:
            new_raw = updated.encode(encoding)
            if new_raw == raw:
                raise ValueError(f"Loot diff missing: {file}")
            pending[file] = new_raw
            removed_total += count
            changed_files.append((str(file.relative_to(ROOT)), count))
    print("Elven set IDs checked:", sorted(ITEMS))
    print("XML items with new augments/level:", ids)
    print("Pre-650 loot lines removed:", removed_total)
    print("Files with early rare drops removed:", len(changed_files))
    for path, count in changed_files:
        print(f"  {path}: {count} drops")
    if not args.apply:
        print("DRY RUN: no repository files were changed")
        return
    for file, data in pending.items():
        atomic_write(file, data)
    print(f"APPLIED: {len(pending)} files updated")


if __name__ == "__main__":
    main()
