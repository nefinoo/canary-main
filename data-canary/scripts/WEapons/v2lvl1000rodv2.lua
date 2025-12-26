local combat = Combat()
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1, -30, -0.85, 0)

local deadlywand = Weapon(WEAPON_WAND)

function deadlywand.onUseWeapon(player, variant)
    return combat:execute(player, variant)
end

deadlywand:id(51075)
deadlywand:level(1500)
deadlywand:mana(250)
deadlywand:damage(750, 1024)
deadlywand:range(4)
-- deadlywand:magicLevel(5)
deadlywand:element(COMBAT_DEATHDAMAGE)
deadlywand:shootType(CONST_ANI_POISON)
deadlywand:register()
