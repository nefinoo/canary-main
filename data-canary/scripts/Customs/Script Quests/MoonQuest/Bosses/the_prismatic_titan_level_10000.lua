-- =========================================================
-- THE PRISMATIC TITAN
-- Cuarto boss de la quest de Zephyr
-- Nivel recomendado: 10000
-- Canary RevScript
-- =========================================================

local BOSS_NAME = "The Prismatic Titan"

local config = {
	phasePercentages = {
		{ percent = 100, phase = "fire" },
		{ percent = 70, phase = "ice" },
		{ percent = 40, phase = "energy" },
		{ percent = 15, phase = "death" },
	},

	phaseHeal = 20000000,

	specialCooldown = 12,
	specialWarningTime = 1800,
	specialRadius = 6,

	damage = {
		fire = { min = 90000, max = 145000, type = COMBAT_FIREDAMAGE, effect = CONST_ME_FIREAREA },
		ice = { min = 95000, max = 150000, type = COMBAT_ICEDAMAGE, effect = CONST_ME_ICEAREA },
		energy = { min = 100000, max = 160000, type = COMBAT_ENERGYDAMAGE, effect = CONST_ME_ENERGYAREA },
		death = { min = 110000, max = 175000, type = COMBAT_DEATHDAMAGE, effect = CONST_ME_MORTAREA },
	},
}

local bossState = {}

-- =========================================================
-- FUNCIONES AUXILIARES
-- =========================================================

local function isPrismaticTitan(creature)
	return creature
		and creature:isMonster()
		and creature:getName():lower() == BOSS_NAME:lower()
end

local function getState(boss)
	local id = boss:getId()

	if not bossState[id] then
		bossState[id] = {
			currentPhase = "fire",
			nextSpecial = os.time() + config.specialCooldown,
		}
	end

	return bossState[id]
end

local function getNearbyPlayers(position, radius)
	local spectators = Game.getSpectators(
		position,
		false,
		true,
		radius,
		radius,
		radius,
		radius
	)

	local players = {}

	for _, spectator in ipairs(spectators) do
		local player = spectator:getPlayer()

		if player then
			players[#players + 1] = player
		end
	end

	return players
end

local function getPhaseByHealth(boss)
	local hpPercent = (boss:getHealth() / boss:getMaxHealth()) * 100

	for _, data in ipairs(config.phasePercentages) do
		if hpPercent >= data.percent then
			return data.phase
		end
	end

	return "death"
end

local function getPhaseColor(phase)
	if phase == "fire" then
		return 94
	elseif phase == "ice" then
		return 89
	elseif phase == "energy" then
		return 95
	end

	return 108
end

local function getPhaseEffect(phase)
	if phase == "fire" then
		return CONST_ME_FIREAREA
	elseif phase == "ice" then
		return CONST_ME_ICEAREA
	elseif phase == "energy" then
		return CONST_ME_ENERGYAREA
	end

	return CONST_ME_MORTAREA
end

local function getPhaseMessage(phase)
	if phase == "fire" then
		return "THE FLAMES WILL CONSUME YOU!"
	elseif phase == "ice" then
		return "FREEZE BENEATH THE PRISM!"
	elseif phase == "energy" then
		return "ARCANE CURRENT OVERLOAD!"
	end

	return "THE FINAL SPECTRUM IS DEATH!"
end

local function changePhase(boss, newPhase)
	local state = getState(boss)

	if state.currentPhase == newPhase then
		return
	end

	state.currentPhase = newPhase

	boss:say(getPhaseMessage(newPhase), TALKTYPE_MONSTER_YELL)
	boss:getPosition():sendMagicEffect(getPhaseEffect(newPhase))
	boss:addHealth(config.phaseHeal)

	local light = boss:getLight()
	if light then
		boss:setLight(9, getPhaseColor(newPhase))
	end
end

-- =========================================================
-- ATAQUE ESPECIAL POR FASE
-- =========================================================

local function executePhaseSpecial(bossId, phase)
	local boss = Monster(bossId)

	if not boss or boss:isRemoved() or not isPrismaticTitan(boss) then
		return
	end

	local state = getState(boss)

	if state.currentPhase ~= phase then
		return
	end

	local damageData = config.damage[phase]
	local position = boss:getPosition()

	boss:say("PRISMATIC COLLAPSE!", TALKTYPE_MONSTER_YELL)
	position:sendMagicEffect(damageData.effect)

	for _, player in ipairs(getNearbyPlayers(position, config.specialRadius)) do
		if player and not player:isRemoved() then
			doTargetCombatHealth(
				boss,
				player,
				damageData.type,
				-damageData.min,
				-damageData.max,
				damageData.effect
			)
		end
	end
end

local function preparePhaseSpecial(boss)
	local state = getState(boss)
	local phase = state.currentPhase
	local position = boss:getPosition()

	boss:say(
		"THE PRISM IS DESTABILIZING!",
		TALKTYPE_MONSTER_YELL
	)

	position:sendMagicEffect(CONST_ME_YELLOW_RINGS)

	for _, player in ipairs(getNearbyPlayers(position, config.specialRadius)) do
		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"The Prismatic Titan is charging a " .. phase .. " collapse. Move away!"
		)

		player:getPosition():sendMagicEffect(CONST_ME_YELLOW_RINGS)
	end

	addEvent(
		executePhaseSpecial,
		config.specialWarningTime,
		boss:getId(),
		phase
	)
end

-- =========================================================
-- THINK
-- =========================================================

local titanThink = CreatureEvent("PrismaticTitanThink")

function titanThink.onThink(creature, interval)
	local boss = creature:getMonster()

	if not boss or not isPrismaticTitan(boss) then
		return true
	end

	local state = getState(boss)
	local expectedPhase = getPhaseByHealth(boss)

	if expectedPhase ~= state.currentPhase then
		changePhase(boss, expectedPhase)
	end

	local now = os.time()

	if now >= state.nextSpecial then
		state.nextSpecial = now + config.specialCooldown
		preparePhaseSpecial(boss)
	end

	return true
end

titanThink:register()

-- =========================================================
-- RESISTENCIAS DINÁMICAS POR FASE
-- =========================================================

local titanHealth = CreatureEvent("PrismaticTitanHealth")

function titanHealth.onHealthChange(
	creature,
	attacker,
	primaryDamage,
	primaryType,
	secondaryDamage,
	secondaryType,
	origin
)
	local boss = creature:getMonster()

	if not boss or not isPrismaticTitan(boss) then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	local phase = getState(boss).currentPhase

	local function adjustDamage(damage, damageType)
		if damage >= 0 then
			return damage
		end

		-- Inmune al elemento actual
		if phase == "fire" and damageType == COMBAT_FIREDAMAGE then
			return 0
		elseif phase == "ice" and damageType == COMBAT_ICEDAMAGE then
			return 0
		elseif phase == "energy" and damageType == COMBAT_ENERGYDAMAGE then
			return 0
		elseif phase == "death" and damageType == COMBAT_DEATHDAMAGE then
			return 0
		end

		-- Elemento opuesto hace daño adicional
		if phase == "fire" and damageType == COMBAT_ICEDAMAGE then
			return math.floor(damage * 1.25)
		elseif phase == "ice" and damageType == COMBAT_FIREDAMAGE then
			return math.floor(damage * 1.25)
		elseif phase == "energy" and damageType == COMBAT_EARTHDAMAGE then
			return math.floor(damage * 1.25)
		elseif phase == "death" and damageType == COMBAT_HOLYDAMAGE then
			return math.floor(damage * 1.30)
		end

		return damage
	end

	primaryDamage = adjustDamage(primaryDamage, primaryType)
	secondaryDamage = adjustDamage(secondaryDamage, secondaryType)

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

titanHealth:register()

-- =========================================================
-- MUERTE
-- =========================================================

local titanDeath = CreatureEvent("PrismaticTitanDeath")

function titanDeath.onDeath(
	creature,
	corpse,
	killer,
	mostDamageKiller,
	unjustified,
	mostDamageUnjustified
)
	bossState[creature:getId()] = nil
	creature:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)

	return true
end

titanDeath:register()

-- =========================================================
-- DEFINICIÓN DEL BOSS
-- =========================================================

local monsterType = Game.createMonsterType(BOSS_NAME)
local monster = {}

monster.description = "the prismatic titan"
monster.experience = 460000000

monster.outfit = {
	lookType = 12,
	lookHead = 94,
	lookBody = 89,
	lookLegs = 95,
	lookFeet = 108,
	lookAddons = 3,
	lookMount = 0,
}

monster.health = 800000000
monster.maxHealth = 800000000
monster.race = "energy"
monster.corpse = 5995
monster.speed = 255
monster.manaCost = 0

monster.changeTarget = {
	interval = 3000,
	chance = 30,
}

monster.strategiesTarget = {
	nearest = 40,
	health = 20,
	damage = 30,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	targetDistance = 2,
	staticAttackChance = 80,
	isBoss = true,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 9,
	color = 94,
}

monster.attacks = {
	{
		name = "melee",
		interval = 2000,
		chance = 100,
		minDamage = -50000,
		maxDamage = -95000,
	},
	{
		name = "combat",
		interval = 2500,
		chance = 30,
		type = COMBAT_FIREDAMAGE,
		minDamage = -70000,
		maxDamage = -120000,
		range = 7,
		shootEffect = CONST_ANI_FIRE,
		effect = CONST_ME_FIREAREA,
		target = true,
	},
	{
		name = "combat",
		interval = 3200,
		chance = 28,
		type = COMBAT_ICEDAMAGE,
		minDamage = -70000,
		maxDamage = -120000,
		range = 7,
		shootEffect = CONST_ANI_ICE,
		effect = CONST_ME_ICEATTACK,
		target = true,
	},
	{
		name = "combat",
		interval = 4000,
		chance = 25,
		type = COMBAT_ENERGYDAMAGE,
		minDamage = -75000,
		maxDamage = -125000,
		radius = 3,
		effect = CONST_ME_ENERGYAREA,
		target = false,
	},
	{
		name = "combat",
		interval = 5000,
		chance = 22,
		type = COMBAT_DEATHDAMAGE,
		minDamage = -80000,
		maxDamage = -130000,
		length = 6,
		spread = 2,
		effect = CONST_ME_MORTAREA,
		target = false,
	},
}

monster.defenses = {
	defense = 240,
	armor = 285,
	mitigation = 4.00,

	{
		name = "combat",
		type = COMBAT_HEALING,
		interval = 6000,
		chance = 17,
		minDamage = 3500000,
		maxDamage = 6000000,
		effect = CONST_ME_MAGIC_BLUE,
	},
}

monster.elements = {
	{
		type = COMBAT_PHYSICALDAMAGE,
		percent = 15,
	},
	{
		type = COMBAT_ENERGYDAMAGE,
		percent = 20,
	},
	{
		type = COMBAT_FIREDAMAGE,
		percent = 20,
	},
	{
		type = COMBAT_ICEDAMAGE,
		percent = 20,
	},
	{
		type = COMBAT_EARTHDAMAGE,
		percent = 20,
	},
	{
		type = COMBAT_HOLYDAMAGE,
		percent = 10,
	},
	{
		type = COMBAT_DEATHDAMAGE,
		percent = 25,
	},
}

monster.immunities = {
	{
		type = "paralyze",
		condition = true,
	},
	{
		type = "outfit",
		condition = true,
	},
	{
		type = "invisible",
		condition = true,
	},
	{
		type = "drunk",
		condition = true,
	},
}

monster.voices = {
	interval = 5000,
	chance = 15,
	{
		text = "THE PRISM REFRACTS YOUR POWER!",
		yell = true,
	},
	{
		text = "ADAPT, OR BE DESTROYED!",
		yell = true,
	},
	{
		text = "EVERY ELEMENT SERVES ME!",
		yell = true,
	},
	{
		text = "THE SPECTRUM IS ENDLESS!",
		yell = true,
	},
}

monster.loot = {
	{
		id = 2148,
		chance = 100000,
		maxCount = 100,
	},
	{
		id = 2152,
		chance = 85000,
		maxCount = 25,
	},
}

monster.events = {
	"PrismaticTitanThink",
	"PrismaticTitanHealth",
	"PrismaticTitanDeath",
	"BossGauntletDeath",
}

monsterType:register(monster)
