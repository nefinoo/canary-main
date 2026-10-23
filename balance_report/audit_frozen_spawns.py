#!/usr/bin/env python3
"""Frozen Hell: read-only spawn/monster-registration cross-check.

Run from repository root:
    python balance_report/audit_frozen_spawns.py

This detects static Game.createMonsterType("name") registrations in data-canary/monster.
It cannot certify runtime registration, indirect registrations, or spawns in other map files.
"""
from collections import Counter
from pathlib import Path
import re
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parent.parent
MONSTER_DIR = ROOT / "data-canary/monster"
SPAWNS = ROOT / "data-canary/world/frozen-monster.xml"

FOCUS = (
    "deathpincer",
    "undead mage",
    "undead dragon",
    "arch angel",
    "dementor",
    "little puppy",
    "orshabaal",
    "hellraiser",
    "frozenhell guard",
    "venom",
)

def normalized(name):
    return " ".join(name.casefold().split())

def load_registrations():
    results = {}
    pattern = re.compile(
        r'Game\s*\.\s*createMonsterType\s*\(\s*["\x27]([^"\x27]+)["\x27]\s*\)',
        re.IGNORECASE,
    )
    if not MONSTER_DIR.is_dir():
        raise SystemExit(f"Missing directory: {MONSTER_DIR}")
    for path in MONSTER_DIR.rglob("*.lua"):
        text = path.read_text(encoding="utf-8-sig", errors="replace")
        for match in pattern.finditer(text):
            results.setdefault(normalized(match.group(1)), []).append(
                str(path.relative_to(ROOT))
            )
    return results

def load_spawn_counts():
    if not SPAWNS.is_file():
        raise SystemExit(f"Missing map spawn file: {SPAWNS}")
    tree = ET.parse(SPAWNS)
    counts = Counter()
    for element in tree.iter():
        if element.tag == "monster" and element.get("name"):
            counts[normalized(element.attrib["name"])] += 1
    return counts

registered = load_registrations()
spawn_counts = load_spawn_counts()

print("FROZEN HELL | STATIC MONSTER REGISTRATION AUDIT")
print(f"Map: {SPAWNS.relative_to(ROOT)}")
print(f"Static registrations: {len(registered)} unique names")
print(f"Unique spawn names: {len(spawn_counts)}\n")
print("MONSTER | SPAWNS | STATUS | FILE")
for name in FOCUS:
    count = spawn_counts.get(name, 0)
    paths = registered.get(name, [])
    status = "FOUND" if paths else "MISSING"
    print(f"{name:18} | {count:5} | {status:7} | {paths[0] if paths else '-'}")

all_unresolved = [
    (name, count) for name, count in spawn_counts.items()
    if name not in registered
]
all_unresolved.sort(key=lambda row: (-row[1], row[0]))
print("\nUNRESOLVED SPAWN NAMES (TOP 30)")
for name, count in all_unresolved[:30]:
    print(f"{count:5} x  {name}")

print(f"\nTotal unresolved names in this map: {len(all_unresolved)}")
print("CAUTION: MISSING is a static-audit finding, not proof the type fails at runtime.")
print("Check startup logs and alternate/dynamic monster loading before creating new Lua files.")

# Undead Mage is registered as 'undead mage' in
# data-canary/monster/Custom/Necromancers/necromancer.lua.
# Always compare Game.createMonsterType names, not file basenames.
