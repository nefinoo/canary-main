local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

-- Frozen Hell V2: damage grows with level AND the equipped weapon (skill * attack).
-- This makes future loot and weapon upgrades directly affect time-to-kill.
function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local gear = math.max(0, skill) * math.max(0, attack)
    local minimum = (level * 0.11 + gear * 0.048 + 20) * 0.70
    local maximum = (level * 0.17 + gear * 0.074 + 32) * 0.70
    return -minimum, -maximum
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(106)
spell:name("Groundshaker")
spell:words("exori mas")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_GROUNDSHAKER)
spell:level(33)
spell:mana(90)
spell:isPremium(true)
spell:needWeapon(true)
spell:cooldown(8000)
spell:groupCooldown(2000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
