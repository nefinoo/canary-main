local combat = Combat()
combat:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -0.1, -30, -0.4, 0)

local arcanestaffs = Weapon(WEAPON_WAND)

function arcanestaffs.onUseWeapon(player, variant)
    return combat:execute(player, variant)
end

arcanestaffs:id(3341)
arcanestaffs:level(100)
-- arcanestaffs:magicLevel(5)
arcanestaffs:mana(50)
arcanestaffs:damage(250, 286)
arcanestaffs:element(COMBAT_DEATHDAMAGE)
arcanestaffs:range(4)
arcanestaffs:shootType(CONST_ANI_SUDDENDEATH)
arcanestaffs:register()
