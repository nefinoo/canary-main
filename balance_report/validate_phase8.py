#!/usr/bin/env python3
"""Frozen Hell phase 8: read-only checks for level-850 income balancing.

Does NOT simulate combat, loot distribution, or server deployment.
"""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
RARE = (3399, 8095, 3408)
CHECKS = [
    ("data-canary/monster/Custom/Demons/hell soldier.lua", 18500, 26000000, 30000,
     {3399: 350, 8095: 150, 3408: 120}),
    ("data-canary/monster/Custom/Undead Humanoids/undead mage.lua", 17000, 28000000, 35000,
     {3399: 120, 8095: 220, 3408: 350}),
]
for relative, hp, experience, coin_chance, rares in CHECKS:
    source = (ROOT / relative).read_text(encoding="utf-8-sig")
    assert f"monster.health = {hp}" in source, relative
    assert f"monster.maxHealth = {hp}" in source, relative
    assert f"monster.experience = {experience}" in source, relative
    coin = rf'(?m)^\s*\{{name = "crystal coin", chance = {coin_chance}, maxCount = 1\}},'
    assert len(re.findall(coin, source)) == 1, relative
    assert source.count('name = "platinum coin"') == 2, relative
    for item_id, chance in rares.items():
        pattern = rf'\{{id = {item_id}, chance = {chance}\}}'
        assert len(re.findall(pattern, source)) == 1, (relative, item_id)
print("PASS: both level-850 monsters have phase-8 income and retain phase-5 HP/EXP/rare equipment.")
