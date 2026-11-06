local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, 347)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

-- Frozen Hell V2: Knight recovery is predictable and grows with level.
-- Supplies remain relevant because healing spells consume mana and have cooldowns.
function onGetFormulaValues(player, level, magicLevel)
    local minimum = level * 0.14 + magicLevel * 4 + 20
    local maximum = level * 0.21 + magicLevel * 6.5 + 35
    return minimum, maximum
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Wound Cleansing")
spell:words("exura ico")
spell:group("healing")
spell:vocation("knight;true", "elite knight;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_WOUND_CLEANSING)
spell:id(123)
spell:cooldown(1500)
spell:groupCooldown(1000)
spell:level(8)
spell:mana(25)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:register()
