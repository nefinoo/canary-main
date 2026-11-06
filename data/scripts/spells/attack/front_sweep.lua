local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_WAVE6, AREADIAGONAL_WAVE6))

-- Frozen Hell V2: damage grows with level AND the equipped weapon (skill * attack).
-- This makes future loot and weapon upgrades directly affect time-to-kill.
function onGetFormulaValues(player, skill, attack, factor)
    local level = player:getLevel()
    local gear = math.max(0, skill) * math.max(0, attack)
    local minimum = (level * 0.11 + gear * 0.048 + 20) * 0.82
    local maximum = (level * 0.17 + gear * 0.074 + 32) * 0.82
    return -minimum, -maximum
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(59)
spell:name("Front Sweep")
spell:words("exori min")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FRONT_SWEEP)
spell:level(70)
spell:mana(60)
spell:isPremium(true)
spell:needDirection(true)
spell:needWeapon(true)
spell:cooldown(7000)
spell:groupCooldown(2000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
