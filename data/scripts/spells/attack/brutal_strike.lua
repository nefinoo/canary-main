local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

-- Frozen Hell V2: damage grows with level AND the equipped weapon (skill * attack).
-- This makes future loot and weapon upgrades directly affect time-to-kill.
function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local gear = math.max(0, skill) * math.max(0, attack)
    local minimum = (level * 0.13 + gear * 0.067 + 28) * 1.00
    local maximum = (level * 0.20 + gear * 0.093 + 46) * 1.00
    return -minimum, -maximum
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(61)
spell:name("Brutal Strike")
spell:words("exori ico")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_BRUTAL_STRIKE)
spell:level(16)
spell:mana(50)
spell:isPremium(false)
spell:range(1)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(5000)
spell:groupCooldown(2000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
