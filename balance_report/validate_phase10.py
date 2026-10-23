#!/usr/bin/env python3
"""Read-only phase-10 checks: Deathpincer identity, safe loot and lvl1000 gear."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
BOSS = ROOT / "data-canary/monster/Custom/Insects/ancient scarab.lua"
XML = ROOT / "data/items/items.xml"
monster = BOSS.read_text(encoding="utf-8-sig")
xml = XML.read_bytes().decode("latin-1")

assert 'Game.createMonsterType("deathpincer")' in monster
assert 'monster.name = "deathpincer"' in monster
assert "rewardBoss = true" in monster
assert "monster.health = 135000" in monster and "monster.maxHealth = 135000" in monster
assert "monster.experience = 300000000" in monster
assert "interval = 2000, chance = 70, type = COMBAT_PHYSICALDAMAGE" in monster
assert "speed = {min = -450, max = -450}, duration = 6000" in monster
assert "{ id = 51670, chance = 25000, maxCount = 5}" in monster
for invalid in (51671, 51672, 51673):
    assert not re.search(r"\bid\s*=\s*" + str(invalid) + r"\b", monster), invalid

# Unique boss reward loot, not duplicate or normal drops.
for item_id in (37609, 37608, 37607, 37610, 6390):
    line = r'\{\s*id\s*=\s*' + str(item_id) + r', chance = 10000, unique = true\}'
    assert len(re.findall(line, monster)) == 1, item_id

bonus = {
    37609: ("green demon helmet", 250, 250),
    37608: ("green demon armor", 650, 100),
    37607: ("green demon legs", 400, 350),
    37610: ("green demon slippers", 150, 200),
}
for item_id, (name, hp, mana) in bonus.items():
    matches = re.findall(r'<item\s+id="' + str(item_id) +
                         r'"[^>]*>[\s\S]*?</item>', xml)
    assert len(matches) == 1, item_id
    block = matches[0]
    assert 'name="' + name + '"' in block[:160]
    assert '<attribute key="level" value="1000"/>' in block
    assert f'<attribute key="maxhitpoints" value="{hp}"/>' in block, item_id
    assert f'<attribute key="maxmanapoints" value="{mana}"/>' in block, item_id

shield = re.search(r'<item\s+id="6390"[^>]*>[\s\S]*?</item>', xml)
assert shield and '<attribute key="level" value="1000"/>' in shield.group()
assert 'name="nightmare shield"' in shield.group()[:160]

# No exclusive 5000-level voc gear becomes an active boss drop.
for forbidden in (51230, 51226, 51070, 51081):
    assert not re.search(r'(?m)^\s*\{\s*id\s*=\s*' + str(forbidden) + r'\b', monster)
print("PASS phase 10: Deathpincer, lvl1000 universal gear, reward IDs and boss-only loot.")
