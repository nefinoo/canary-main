local combat = Combat()
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -0.7, -30, -1.8, 00)

local deadlywand = Weapon(WEAPON_WAND)

function deadlywand.onUseWeapon(player, variant)
    return combat:execute(player, variant)
end

deadlywand:id(895)
deadlywand:level(1000)
deadlywand:mana(250)
deadlywand:damage(750, 1024)
deadlywand:range(4)
-- deadlywand:magicLevel(5)
deadlywand:element(COMBAT_DEATHDAMAGE)
deadlywand:shootType(CONST_ANI_SUDDENDEATH)
deadlywand:register()
