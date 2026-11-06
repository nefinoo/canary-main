#!/usr/bin/env python3
"""Read-only guards for Frozen Hell V2 Knight foundation. Run from repo root."""
from pathlib import Path
import re
from v2_knight_ttk import SPELLS, HEALS, simulate

ROOT = Path(__file__).resolve().parent.parent
ATTACK_FILES = {
    "exori": "berserk.lua",
    "exori gran": "fierce_berserk.lua",
    "exori min": "front_sweep.lua",
    "exori mas": "groundshaker.lua",
    "exori ico": "brutal_strike.lua",
    "exori gran ico": "annihilation.lua",
}
HEAL_FILES = {
    "exura ico": "wound_cleansing.lua",
    "exura med ico": "fair_wound_cleansing.lua",
    "exura gran ico": "intense_wound_cleansing.lua",
}


def read(path):
    return (ROOT / path).read_text(encoding="utf-8-sig")


def require(text, substring, path):
    assert substring in text, f"{path}: missing {substring}"


for name, filename in ATTACK_FILES.items():
    path = "data/scripts/spells/attack/" + filename
    src = read(path)
    level, cd, mana, *_ = SPELLS[name]
    require(src, f'spell:words("{name}")', path)
    require(src, f"spell:mana({mana})", path)
    require(src, f"spell:cooldown({int(cd * 1000)})", path)
    require(src, "spell:groupCooldown(2000)", path)
    require(src, 'spell:vocation("knight;true", "elite knight;true")', path)
    require(src, "local gear = math.max(0, skill) * math.max(0, attack)", path)

for name, filename in HEAL_FILES.items():
    path = "data/scripts/spells/healing/" + filename
    src = read(path)
    level, cd, mana, *_ = HEALS[name]
    require(src, f'spell:words("{name}")', path)
    require(src, f"spell:mana({mana})", path)
    require(src, f"spell:cooldown({int(cd * 1000)})", path)
    require(src, "spell:groupCooldown(1000)", path)
    require(src, 'spell:vocation("knight;true", "elite knight;true")', path)

xml = read("data/XML/vocations.xml")
for voc_id in (4, 8):
    pattern = r'<vocation id="' + str(voc_id) + r'"[^>]*>\s*<formula meleeDamage="1.10"'
    assert re.search(pattern, xml), f"Knight vocation {voc_id}: melee damage multiplier"
cpp = read("src/creatures/players/player.cpp")
assert "if (vocation->getBaseId() == 4)" not in cpp, "Unexpected Knight Fist-speed override"
require(cpp, "getSkillLevel(SKILL_FIST)", "Player::getAttackSpeed")
require(cpp, "TOGGLE_ATTACK_SPEED_ONFIST", "Player::getAttackSpeed")
config = read("config.lua")
require(config, "toggleAttackSpeedOnFist = true", "Fist burst item")

potions = read("data/scripts/actions/items/potions.lua")
for item_id, lo, hi in (
    (239, 440, 560), (7643, 670, 830), (23375, 900, 1100),
    (51246, 1800, 2100), (50965, 2500, 3000),
    (51702, 4600, 5400), (53144, 6500, 7500),
    (50384, 10500, 11500),
):
    match = re.search(r"(?m)^\s*\[" + str(item_id) + r"\]\s*=\s*\{(.*)\},?\s*$", potions)
    assert match, f"Missing health potion {item_id}"
    row = match.group(1)
    assert re.search(r"health\s*=\s*\{\s*" + str(lo) + r"\s*,\s*" + str(hi) + r"\s*\}", row), item_id
    require(row, "VOCATION.BASE_ID.KNIGHT", str(item_id))
row = next(line for line in potions.splitlines() if "[50967] =" in line)
require(row, "VOCATION.BASE_ID.PALADIN", "existing Paladin potion")
assert "VOCATION.BASE_ID.KNIGHT" not in row, "Paladin potion mistakenly assigned to Knight"
require(row, "health = { 1020, 1320 }", "Paladin potion health unchanged")
require(row, "mana = { 550, 650 }", "Paladin potion mana unchanged")

food = read("data-canary/scripts/Customs/Superfood.lua")
for src, filename in ((potions, "potions.lua"), (food, "Superfood.lua")):
    require(src, "local KNIGHT_SUPPLY_STORAGE = 935110", filename)
    require(src, "local KNIGHT_SUPPLY_DELAY = 2", filename)
    require(src, "player:getStorageValue(KNIGHT_SUPPLY_STORAGE) > os.time()", filename)
    require(src, "player:setStorageValue(KNIGHT_SUPPLY_STORAGE, os.time() + KNIGHT_SUPPLY_DELAY)", filename)
malak = read("data-canary/npc/Malak.lua")
require(malak, '{ itemName = "extreme spirit potion", clientId = 50965, buy = 938 }', "Malak")
require(malak, '{ itemName = "extreme health potion", clientId = 50967, buy = 1179 }', "Malak")
require(malak, "STORAGE_RUNE_UNLOCK = 60000", "Malak quest-gated potions")

entry = {"level": 1000, "skill": 95, "attack": 110, "ml": 8, "hp_gear": 0, "mana_gear": 0, "fist": 10, "fist_bonus": 0, "fist_buff_seconds": 0}
start = simulate(entry, seconds=40)
assert start["alive"] and start["damage"] > 0 and start["spells"] > 0
assert start["hp_used"] == 0, "No damage taken, health potions should not be used"
assert start["seconds"] == 40
boosted_entry = dict(entry, fist_bonus=100, fist_buff_seconds=10)
boosted = simulate(boosted_entry, seconds=40)
assert boosted["damage"] > start["damage"], "Fist burst must increase base attacks temporarily"
print("PASS Knight V2: six attacks, three heals, Fist burst retained, potion IDs/prices, supply and 40-second model")
print(f"Model entry level 1000 / skill 95 / weapon 110: {start['damage']:,.0f} nominal damage/40 sec (no monster defenses).")
print("UNTESTED: Lua/Canary runtime, C++ compilation, cooldown behavior, actual combat and potion availability.")
