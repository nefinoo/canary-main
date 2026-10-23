#!/usr/bin/env python3
"""Frozen Hell phase 13: read-only guards for level-1800 Undead Dragon.

Execute from repository root: python3 balance_report/validate_phase13.py
This does not replace an in-game test of damage/mitigation.
"""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
DRAGON = ROOT / "data-canary/monster/Custom/Skeletons/undead dragon.lua"
MAGE = ROOT / "data-canary/monster/Custom/Undead Humanoids/undead mage.lua"
BOSS = ROOT / "data-canary/monster/Custom/Insects/ancient scarab.lua"

dragon = DRAGON.read_text(encoding="utf-8-sig")
mage = MAGE.read_text(encoding="utf-8-sig") if MAGE.is_file() else None
boss = BOSS.read_text(encoding="utf-8-sig")

def require_stat(source, key, value):
    assert re.search(r"(?m)^monster\." + re.escape(key) + r"\s*=\s*" + str(value) + r"\s*$", source), (key, value)

assert 'Game.createMonsterType("undead dragon")' in dragon
assert "Nivel recomendado: 1800" in dragon
for key, value in (("health", 105000), ("maxHealth", 105000), ("experience", 188000000), ("speed", 320)):
    require_stat(dragon, key, value)

attacks = re.search(r"monster\.attacks\s*=\s*\{([\s\S]*?)\n\}", dragon)
assert attacks, "Undead Dragon attack block missing"
lines = [line for line in attacks.group(1).splitlines() if re.search(r"\{name\s*=", line)]
assert len(lines) == 4, f"Expected 4 controlled attacks, got {len(lines)}"
dps = 0.0
for line in lines:
    interval = int(re.search(r"\binterval\s*=\s*(\d+)", line).group(1))
    chance = int(re.search(r"\bchance\s*=\s*(\d+)", line).group(1))
    minimum = int(re.search(r"\bminDamage\s*=\s*(-?\d+)", line).group(1))
    maximum = int(re.search(r"\bmaxDamage\s*=\s*(-?\d+)", line).group(1))
    assert interval >= 1500 and 0 < chance <= 100
    assert minimum < 0 and maximum < 0
    assert abs(maximum) >= abs(minimum)
    dps += (abs(minimum) + abs(maximum)) / 2 * (chance / 100) * (1000 / interval)
assert 1950 <= dps <= 2100, f"Unexpected theoretical raw DPS: {dps:.1f}"

for damage_type in ("COMBAT_EARTHDAMAGE", "COMBAT_FIREDAMAGE", "COMBAT_DEATHDAMAGE"):
    match = re.search(r"\{type\s*=\s*" + damage_type + r"\s*,\s*percent\s*=\s*(-?\d+)\}", dragon)
    assert match and int(match.group(1)) < 100, damage_type

loot = re.search(r"monster\.loot\s*=\s*\{([\s\S]*?)\n\}", dragon)
assert loot, "Undead Dragon loot block missing"
loot = "\n".join(line.split("--")[0] for line in loot.group(1).splitlines())
for quest_item_id in (3287, 3288, 3309, 3319, 3341):
    assert not re.search(r"\bid\s*=\s*" + str(quest_item_id) + r"\b", loot), quest_item_id
for quest_name in ("magic sword", "throwing star"):
    assert not re.search(r'\bname\s*=\s*"' + re.escape(quest_name) + r'"', loot)
assert len(re.findall(r'\bname\s*=\s*"demonic essence"', loot)) == 1

# Keep the prior 850 zone and the 1000 transition boss untouched.
if mage is not None:
    assert 'Game.createMonsterType("undead mage")' in mage
    require_stat(mage, "health", 17000)
    require_stat(mage, "experience", 28000000)
else:
    print("NOTICE: Undead Mage source absent from branch; cannot validate this stage here.")
assert 'Game.createMonsterType("deathpincer")' in boss
require_stat(boss, "health", 135000)
require_stat(boss, "experience", 300000000)

print(f"PASS phase 13: Undead Dragon 1800, theoretical raw {dps:.1f} DPS, protected quest loot and earlier stages.")
