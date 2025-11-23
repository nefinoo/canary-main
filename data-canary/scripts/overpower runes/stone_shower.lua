local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STONES)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -2.7, -50, -3.2, 0)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

-- function onGetFormulaValues(player, level, maglevel)
	-- local min = (level * 2.5) + (maglevel * 8.82) * 4
	-- local max = (level * 3.25) + (maglevel * 25.1) * 7
	-- return -min, -max
-- end

-- combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(300)
rune:group("attack")
rune:name("overpower stone shower rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_STONE_SHOWER_RUNE)
rune:runeId(52633)
rune:allowFarUse(true)
rune:charges(4)
rune:level(2000)
rune:magicLevel(6)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:isBlocking(false) -- True = Solid / False = Creature
rune:register()
