local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -3.2, -5000, -3.7, -5000)

-- function onGetFormulaValues(player, level, maglevel)
	-- local min = (level * 2.5) + (maglevel * 40.605) * 18
	-- local max = (level * 3.25) + (maglevel * 70.395) * 23
	-- return -min, -max
-- end

-- combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(301)
rune:group("attack")
rune:name("overpower sudden death rune")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_SUDDENDEATH_RUNE)
rune:runeId(51432)
rune:allowFarUse(true)
rune:charges(3)
rune:level(2500)
rune:magicLevel(7)
rune:cooldown(2 * 1000)
rune:groupCooldown(2 * 1000)
rune:needTarget(true)
rune:isBlocking(true) -- True = Solid / False = Creature
rune:register()
