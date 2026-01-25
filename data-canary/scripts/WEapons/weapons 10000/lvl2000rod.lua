local combat = Combat()
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -0.85, -44000, -1.05, -47000)

local starwand = Weapon(WEAPON_WAND)

function starwand.onUseWeapon(player, variant)
    return combat:execute(player, variant)
end

starwand:id(51853)
starwand:level(10000)
starwand:mana(500)
starwand:damage(1500, 1893)
starwand:range(4)
-- starwand:magicLevel(5)
starwand:element(COMBAT_HOLYDAMAGE)
starwand:shootType(10)
starwand:register()
