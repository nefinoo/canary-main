local combat = Combat()
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ANI_DEATH)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ME_ENERGYAREA)

combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.95, -10000, -3.1, -15000)

local starwand = Weapon(WEAPON_WAND)

function starwand.onUseWeapon(player, variant)
    return combat:execute(player, variant)
end

starwand:id(52375)
starwand:level(15000)
starwand:mana(1000)
starwand:damage(2500, 3000)
starwand:range(4)
-- starwand:magicLevel(5)
starwand:element(COMBAT_HOLYDAMAGE)
starwand:shootType(10)
starwand:register()
