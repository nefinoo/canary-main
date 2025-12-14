local combat = Combat()
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -0.45, -30, -0.75, 0)

local amberstaff = Weapon(WEAPON_WAND)

function amberstaff.onUseWeapon(player, variant)
    return combat:execute(player, variant)
end

amberstaff:id(7426)
amberstaff:level(500)
amberstaff:mana(150)
amberstaff:damage(500, 766)
amberstaff:range(4)
-- amberstaff:magicLevel(5)
amberstaff:element(COMBAT_DEATHDAMAGE)
amberstaff:shootType(CONST_ANI_SUDDENDEATH)
amberstaff:register()
