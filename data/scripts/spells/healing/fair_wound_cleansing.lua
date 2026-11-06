local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

-- Frozen Hell V2: Knight recovery is predictable and grows with level.
-- Supplies remain relevant because healing spells consume mana and have cooldowns.
function onGetFormulaValues(player, level, magicLevel)
    local minimum = level * 0.32 + magicLevel * 7 + 55
    local maximum = level * 0.46 + magicLevel * 10 + 85
    return minimum, maximum
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:group("healing")
spell:id(239)
spell:name("Fair Wound Cleansing")
spell:words("exura med ico")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FAIR_WOUND_CLEANSING)
spell:level(300)
spell:mana(70)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(2000)
spell:groupCooldown(1000)
spell:isAggressive(false)
spell:vocation("knight;true", "elite knight;true")

spell:register()