#!/usr/bin/env python3
"""Static checks for Frozen Hell phase 7; does not simulate Canary combat."""
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
def src(path):
    return (ROOT / path).read_text(encoding="utf-8-sig")

for path in ("data/scripts/actions/items/potions.lua", "data-canary/scripts/Customs/Superfood.lua"):
    c = src(path)
    assert "local consumableExhaustSubId = 620096" in c, path
    assert "consumableExhaust:setParameter(CONDITION_PARAM_TICKS, 2000)" in c, path
    assert c.count("player:getCondition(CONDITION_EXHAUST_HEAL, CONDITIONID_COMBAT, consumableExhaustSubId)") == 1
    assert c.count("player:addCondition(consumableExhaust)") == 1

expect = [(35000,85000000,4500,6000),(40000,125000000,5000,6500),
          (50000,175000000,7000,9000),(65000,225000000,9000,11000),
          (105000,285000000,11000,13000)]
names = ["constrictor","hydromancer","mantassin","pincher","predator"]
for name, (hp, exp, trout, perch) in zip(names, expect):
    c = src(f"data-canary/monster/Custom/Quaras/quara {name}.lua")
    for key, value in (("health",hp),("maxHealth",hp),("experience",exp)):
        assert f"monster.{key} = {value}" in c
    assert f'{{name = "rainbow trout", chance = {trout}}}' in c
    assert f'{{name = "green perch", chance = {perch}}}' in c

assert "minDamage = 1200, maxDamage = 1800" in src("data-canary/monster/Custom/Quaras/quara predator.lua")
print("PASS: Phase 7 static data checks.")
