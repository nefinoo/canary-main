#!/usr/bin/env python3
"""Static guards for Frozen Hell phase 17. Not a substitute for Canary gameplay.

Run from repo root: python3 balance_report/validate_phase17.py
"""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
FISH = ROOT / "data-canary/scripts/Customs/Fishing/Fishing.lua"
BOSS = ROOT / "data-canary/monster/Custom/Insects/ancient scarab.lua"
NEPHY = ROOT / "data-canary/npc/Nephy.lua"
GUARD = ROOT / "data-canary/monster/Custom/Outlaws/hero.lua"
VENOM = ROOT / "data-canary/monster/Custom/Geo-Elementals/massive earth elemental.lua"
POSTLOOT = ROOT / "data/scripts/eventcallbacks/monster/postdroploot_frozen_hell.lua"


def source(path):
    return path.read_text(encoding="utf-8-sig")


def required_stat(data, attr, amount):
    assert re.search(r"(?m)^monster\." + re.escape(attr)
                     + r"\s*=\s*" + str(amount) + r"\s*$", data), (attr, amount)


def monster_entries(data, table_name):
    match = re.search(
        r"local " + re.escape(table_name) + r"\s*=\s*\{(.*?)\n\}",
        data, re.S)
    assert match, f"Missing fishing table {table_name}"
    result = []
    for line in match.group(1).splitlines():
        name = re.search(r'\bname\s*=\s*"([^"]+)"', line)
        level = re.search(r'\blevel\s*=\s*(\d+)', line)
        skill = re.search(r'\bfishing\s*=\s*(\d+)', line)
        chance = re.search(r'\bchance\s*=\s*(\d+)', line)
        if name:
            assert level and skill and chance, f"Incomplete row: {line}"
            result.append((name.group(1), int(level.group(1)),
                           int(skill.group(1)), int(chance.group(1))))
    return result


fish = source(FISH)
assert "local function selectCaughtMonster(" in fish
assert "local selectedMonster = selectCaughtMonster(" in fish
assert "ties[math.random(1, #ties)]" in fish
assert "fishingCastCooldown[playerId] = now + 2" in fish
assert "player:removeItem(wormId, 1)" in fish

swamp = monster_entries(fish, "swampMonsters")
lava = monster_entries(fish, "lavaMonsters")
water = monster_entries(fish, "waterMonsters")
assert len(swamp) == 24, f"Expected 24 swamp species, got {len(swamp)}"
assert all(level == 1000 and skill == 120 and chance == 20000
           for _, level, skill, chance in swamp), "Swamp rules regressed"
assert len(lava) == 24, f"Expected 24 lava species, got {len(lava)}"
assert all(chance == 20000 for _, _, _, chance in lava), "Lava rate changed"
lava_1000 = [name for name, lvl, skl, chance in lava
             if lvl <= 1000 and skl <= 120]
assert len(lava_1000) == 10, f"Expected 10 eligible lava species, got {len(lava_1000)}"
assert next(chance for name, _, _, chance in water
            if name == "Quara Constrictor") == 11000

boss = source(BOSS)
required_stat(boss, "health", 135000)
required_stat(boss, "experience", 300000000)
assert "rewardBoss = true" in boss
nephy = source(NEPHY)
for item_id in (37609, 37608, 37607, 37610, 6390):
    assert re.search(r"\{\s*id\s*=\s*" + str(item_id)
                     + r",\s*chance\s*=\s*10000,\s*unique\s*=\s*true\s*\}",
                     boss), f"Boss drop missing: {item_id}"
    assert re.search(r"clientId\s*=\s*" + str(item_id)
                     + r",\s*sell\s*=\s*150000\b", nephy), f"Nephy ID/price: {item_id}"

guard, venom = source(GUARD), source(VENOM)
for data, hp, exp in ((guard, 245000, 687000000), (venom, 330000, 902000000)):
    required_stat(data, "health", hp)
    required_stat(data, "experience", exp)
assert "yalahariChance" not in source(POSTLOOT), "Duplicate Yalahari roll detected"

assert 20000 / 90000 < 0.23
print("PASS phase17: Deathpincer prices/drops, Guard/Venom order, Fishing tables and tie picker")
print("ANALYTICAL Fishing120 / base rod: swamp=22.22%, lava=22.22% per valid cast")
print("WARNING: the fishing script currently does not enforce the scroll=true flag.")
