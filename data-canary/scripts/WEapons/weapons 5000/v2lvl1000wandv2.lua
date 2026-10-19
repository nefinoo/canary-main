local combat = Combat()
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -0.85, -21500, -1.05, -23000)

local deadlywand = Weapon(WEAPON_WAND)

function deadlywand.onUseWeapon(player, variant)
    return combat:execute(player, variant)
end

deadlywand:id(51081)
deadlywand:level(5000)
deadlywand:mana(250)
deadlywand:damage(850, 1224)
deadlywand:range(4)
-- deadlywand:magicLevel(5)
deadlywand:element(COMBAT_DEATHDAMAGE)
deadlywand:shootType(CONST_ANI_ENERGY)
deadlywand:register()
