local berserk = Condition(CONDITION_ATTRIBUTES)
berserk:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
berserk:setParameter(CONDITION_PARAM_SUBID, JeanPierreMelee)
berserk:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
berserk:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
berserk:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local mastermind = Condition(CONDITION_ATTRIBUTES)
mastermind:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
mastermind:setParameter(CONDITION_PARAM_SUBID, JeanPierreMagicLevel)
mastermind:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
mastermind:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local bullseye = Condition(CONDITION_ATTRIBUTES)
bullseye:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
bullseye:setParameter(CONDITION_PARAM_SUBID, JeanPierreDistance)
bullseye:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
bullseye:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
bullseye:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local antidote = Combat()
antidote:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
antidote:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
antidote:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)
antidote:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
antidote:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

local exhaust = Condition(CONDITION_EXHAUST_HEAL)
exhaust:setParameter(CONDITION_PARAM_TICKS, (configManager.getNumber(configKeys.EX_ACTIONS_DELAY_INTERVAL) - 1000))

local function magicshield(player)
	local condition = Condition(CONDITION_MANASHIELD)
	condition:setParameter(CONDITION_PARAM_TICKS, 60000)
	condition:setParameter(CONDITION_PARAM_MANASHIELD, math.min(player:getMaxMana(), 300 + 7.6 * player:getLevel() + 7 * player:getMagicLevel()))
	exhaust:setParameter(CONDITION_PARAM_TICKS, 500)
	player:addCondition(condition)
end

local potions = {
	[236] = { health = { 250, 350 }, vocations = { VOCATION.BASE_ID.PALADIN, VOCATION.BASE_ID.KNIGHT }, level = 50, flask = 283, description = "Only knights and paladins of level 50 or above may drink this fluid." },
	[237] = { mana = { 115, 185 }, level = 50, flask = 283, description = "Only players of level 50 or above may drink this fluid." },
	[238] = { mana = { 150, 250 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID, VOCATION.BASE_ID.PALADIN }, level = 80, flask = 284, description = "Only sorcerers, druids and paladins of level 80 or above may drink this fluid." },
	[239] = { health = { 425, 575 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 80, flask = 284, description = "Only knights of level 80 or above may drink this fluid." },
	[266] = { health = { 125, 175 }, flask = 285 },
	[268] = { mana = { 75, 125 }, flask = 285 },
	[6558] = { transform = { id = { 236, 237 } }, effect = CONST_ME_DRAWBLOOD },
	[7439] = { vocations = { VOCATION.BASE_ID.KNIGHT }, condition = berserk, effect = CONST_ME_MAGIC_RED, description = "Only knights may drink this potion.", text = "You feel stronger.", achievement = "Berserker" },
	[7440] = { vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, condition = mastermind, effect = CONST_ME_MAGIC_BLUE, description = "Only sorcerers and druids may drink this potion.", text = "You feel smarter.", achievement = "Mastermind" },
	[7443] = { vocations = { VOCATION.BASE_ID.PALADIN }, condition = bullseye, effect = CONST_ME_MAGIC_GREEN, description = "Only paladins may drink this potion.", text = "You feel more accurate.", achievement = "Sharpshooter" },
	[7642] = { health = { 250, 350 }, mana = { 100, 200 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 80, flask = 284, description = "Only paladins of level 80 or above may drink this fluid." },
	[7643] = { health = { 650, 850 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 130, flask = 284, description = "Only knights of level 130 or above may drink this fluid." },
	[7644] = { combat = antidote, flask = 285 },
	[7876] = { health = { 60, 90 }, flask = 285 },
	[23373] = { mana = { 425, 575 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 130, flask = 284, description = "Only druids and sorcerers of level 130 or above may drink this fluid." },
	[23374] = { health = { 420, 580 }, mana = { 250, 350 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 130, flask = 284, description = "Only paladins of level 130 or above may drink this fluid." },
	[23375] = { health = { 875, 1125 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 200, flask = 284, description = "Only knights of level 200 or above may drink this fluid." },
	[35563] = { vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 14, func = magicshield, effect = CONST_ME_ENERGYAREA, description = "Only sorcerers and druids of level 14 or above may drink this potion." },
	--------------------------------------level 500---------------------------------------------------------------------
	[51247] = { mana = { 725, 875 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 500, flask = 284, description = "Only druids and sorcerers of level 500 or above may drink this fluid." },
	[51138] = { health = { 720, 880 }, mana = { 450, 550 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 500, flask = 284, description = "Only paladins of level 500 or above may drink this fluid." },
	[51246] = { health = { 1875, 2025 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 500, flask = 284, description = "Only knights of level 500 or above may drink this fluid." },
	--------------------------------------level 1000---------------------------------------------------------------------
	[50966] = { mana = { 1025, 1275 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 1000, flask = 284, description = "Only druids and sorcerers of level 1000 or above may drink this fluid." },
	[50965] = { health = { 1020, 1320 }, mana = { 550, 650 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 1000, flask = 284, description = "Only paladins of level 1000 or above may drink this fluid." },
	[50967] = { health = { 2575, 2925 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 1000, flask = 284, description = "Only knights of level 1000 or above may drink this fluid." },
	--------------------------------------level 2500--------------------------------------------------------------------
	[51704] = { mana = { 2025, 2375 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 2500, flask = 284, description = "Only druids and sorcerers of level 2500 or above may drink this fluid." },
	[51701] = { health = { 2020, 2350 }, mana = { 1050, 1150 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 2500, flask = 284, description = "Only paladins of level 2500 or above may drink this fluid." },
	[51702] = { health = { 4875, 5125 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 2500, flask = 284, description = "Only knights of level 2500 or above may drink this fluid." },
	-------------------------------------level 5000----------------------------------------------------------------------
	[53143] = { mana = { 3425, 3575 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 5000, flask = 284, description = "Only druids and sorcerers of level 5000 or above may drink this fluid." },
	[53142] = { health = { 3420, 3600 }, mana = { 1550, 1670 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 5000, flask = 284, description = "Only paladins of level 5000 or above may drink this fluid." },
	[53144] = { health = { 6875, 7125 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 5000, flask = 284, description = "Only knights of level 5000 or above may drink this fluid." },
	-------------------------------------level 10000----------------------------------------------------------------------
	[50382] = { mana = { 5425, 5575 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 10000, flask = 284, description = "Only druids and sorcerers of level 10000 or above may drink this fluid." },
	[50383] = { health = { 5420, 5680 }, mana = { 2500, 2850 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 10000, flask = 284, description = "Only paladins of level 10000 or above may drink this fluid." },
	[50384] = { health = { 10875, 11125 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 10000, flask = 284, description = "Only knights of level 10000 or above may drink this fluid." },
}

-- Shared 1.5-second recovery for HP/mana potions and Super Food (Knight combat balance).
local consumableExhaustSubId = 620096
local consumableExhaust = Condition(CONDITION_EXHAUST_HEAL, CONDITIONID_COMBAT, consumableExhaustSubId)
consumableExhaust:setParameter(CONDITION_PARAM_TICKS, 1500)

local flaskPotion = Action()

function flaskPotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target or type(target) == "userdata" and not target:isPlayer() then
		return false
	end

	local potion = potions[item:getId()]
	if not player:getGroup():getAccess() and (potion.level and player:getLevel() < potion.level or potion.vocations and not table.contains(potion.vocations, player:getVocation():getBaseId())) then
		player:say(potion.description, MESSAGE_POTION)
		return true
	end

	if potion.health or potion.mana or potion.combat then
		if player:getCondition(CONDITION_EXHAUST_HEAL, CONDITIONID_COMBAT, consumableExhaustSubId) then
			player:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
			return true
		end
		if potion.health then
			doTargetCombatHealth(player, target, COMBAT_HEALING, potion.health[1], potion.health[2], CONST_ME_MAGIC_BLUE)
		end

		if potion.mana then
			doTargetCombatMana(0, target, potion.mana[1], potion.mana[2], CONST_ME_MAGIC_BLUE)
		end

		if potion.combat then
			potion.combat:execute(target, Variant(target:getId()))
		end

		if not potion.effect and target:getPosition() ~= nil then
			target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end

		player:addAchievementProgress("Potion Addict", 100000)
		target:say("Aaaah...", MESSAGE_POTION)
		player:addCondition(consumableExhaust)

		local deactivatedFlasks = player:getStorageValue(45010)

		if deactivatedFlasks ~= 1 then
			if fromPosition.x == CONTAINER_POSITION then
				player:addItem(potion.flask, 1)
			else
				Game.createItem(potion.flask, 1, fromPosition)
			end
		end
	end

	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ITEM_USE_POTION, player:isInGhostMode() and nil or player)

	if potion.func then
		potion.func(player)
		player:say("Aaaah...", MESSAGE_POTION)
		player:getPosition():sendMagicEffect(potion.effect)

		if potion.achievement then
			player:addAchievementProgress(potion.achievement, 100)
		end
	end

	if potion.condition then
		player:addCondition(potion.condition)
		player:say(potion.text, MESSAGE_POTION)
		player:getPosition():sendMagicEffect(potion.effect)
	end

	if potion.transform then
		if item:getCount() >= 1 then
			item:remove(1)
			player:addItem(potion.transform.id[math.random(#potion.transform.id)], 1)
			item:getPosition():sendMagicEffect(potion.effect)
			player:addAchievementProgress("Demonic Barkeeper", 250)
			return true
		end
	end

	if not configManager.getBoolean(configKeys.REMOVE_POTION_CHARGES) then
		return true
	end

	player:updateSupplyTracker(item)
	item:remove(1)
	return true
end

for index, value in pairs(potions) do
	flaskPotion:id(index)
end

flaskPotion:register()
