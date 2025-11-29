local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local condition = Condition(CONDITION_MANASHIELD)
	-- condition:setParameter(CONDITION_PARAM_TICKS, 180000) -- 180 sec
	condition:setParameter(CONDITION_PARAM_TICKS, 10000) -- 180 sec
	creature:addCondition(condition)
	return combat:execute(creature, var)
end

spell:name("Magic Shield")
spell:words("utamo vita")
spell:group("support")
spell:vocation("druid;true", "elder druid;true", "sorcerer;true", "master sorcerer;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_MAGIC_SHIELD)
spell:id(44)
spell:cooldown(14 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(14)
spell:mana(50)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()

local ManaShield = CreatureEvent("ClassicManaShield")

function ManaShield.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if not creature or not creature:isPlayer() then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	-- Si Magic Shield NO está activo → daño normal
	if not creature:hasCondition(CONDITION_MANASHIELD) then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	-- Evitar que heals curen mana
	if primaryDamage <= 0 then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	local mana = creature:getMana()

	if mana >= primaryDamage then
		creature:addMana(-primaryDamage)
		primaryDamage = 0
	else
		local remaining = primaryDamage - mana
		creature:addMana(-mana)
		primaryDamage = remaining
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

ManaShield:register()
