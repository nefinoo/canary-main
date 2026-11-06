local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, 568)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

-- Frozen Hell V2: Knight recovery is predictable and grows with level.
-- Supplies remain relevant because healing spells consume mana and have cooldowns.
function onGetFormulaValues(player, level, magicLevel)
    local minimum = level * 1.7 + magicLevel * 20 + 200
    local maximum = level * 2.3 + magicLevel * 30 + 350
    return minimum, maximum
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Intense Wound Cleansing")
spell:words("exura gran ico")
spell:group("healing")
spell:vocation("knight;true", "elite knight;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_INTENSE_WOUND_CLEANSING)
spell:id(158)
spell:cooldown(45000) -- 45 sec emergency heal
spell:groupCooldown(1000)
spell:level(80)
spell:mana(220)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
