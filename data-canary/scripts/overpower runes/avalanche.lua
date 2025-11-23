local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.7, -50, -3.2, 0)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

-- function onGetFormulaValues(player, level, maglevel)
	-- local min = (level * 2.5) + (maglevel * 9.2) * 5
	-- local max = (level * 3.25) + (maglevel * 26.1) * 8
	-- return -min, -max
-- end

-- combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(303)
rune:group("attack")
rune:name("overpower avalanche rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_AVALANCHE_RUNE)
rune:runeId(52634)
rune:allowFarUse(true)
rune:charges(4)
rune:level(2000)
rune:magicLevel(6)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:isBlocking(false) -- True = Solid / False = Creature
rune:register()
