-- =========================================================
-- ZEPHYR, THE PERFECT CREATION
-- Sexto y último boss de la quest de Zephyr
-- Nivel recomendado: 10000+
-- Canary RevScript
-- =========================================================

local BOSS_NAME = "Zephyr the Perfect Creation"
local SENTINEL_NAME = "Zephyr Arcane Sentinel"
local CRYSTAL_NAME = "Zephyr Ward Crystal"
local TRUE_REFLECTION_NAME = "Zephyr True Reflection"
local FALSE_REFLECTION_NAME = "Zephyr False Reflection"

local config = {
	-- Fases
	sentinelPhase = 80,
	crystalPhase = 60,
	elementalPhase = 40,
	mirrorPhase = 20,

	sentinelsPerPhase = 4,
	crystalsPerPhase = 4,
	falseReflections = 3,

	-- Daño recibido mientras existan mecánicas activas
	damageWithSentinels = 35,
	damageWithCrystals = 20,
	damageWithReflections = 15,

	-- Ventana de vulnerabilidad al matar el reflejo verdadero
	vulnerabilityDuration = 6000,
	vulnerabilityMultiplier = 1.60,

	-- Onda final periódica
	ultimateCooldown = 16,
	ultimateWarningTime = 2200,
	ultimateRadius = 6,
	ultimateMinDamage = 115000,
	ultimateMaxDamage = 190000,
	pushDistance = 2,

	-- Rotación elemental debajo de 40%
	elementalRotationCooldown = 14,

	-- Curación al entrar en fase
	phaseHeal = 25000000,

	spawnRadius = 5,
	maxSpawnAttempts = 35,
}

local bossState = {}

-- =========================================================
-- FUNCIONES GENERALES
-- =========================================================

local function isMonsterNamed(creature, name)
	return creature
		and creature:isMonster()
		and creature:getName():lower() == name:lower()
end

local function isFinalBoss(creature)
	return isMonsterNamed(creature, BOSS_NAME)
end

local function getState(boss)
	local id = boss:getId()

	if not bossState[id] then
		bossState[id] = {
			sentinelTriggered = false,
			crystalTriggered = false,
			elementalTriggered = false,
			mirrorTriggered = false,
			currentElement = "fire",
			nextElementRotation = os.time() + config.elementalRotationCooldown,
			nextUltimate = os.time() + config.ultimateCooldown,
			vulnerableUntil = 0,
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

local function canSpawnAt(position)
	local tile = Tile(position)

	if not tile then
		return false
	end

	if tile:hasFlag(TILESTATE_BLOCKSOLID) then
		return false
	end

	if tile:getTopCreature() then
		return false
	end

	return true
end

local function findSpawnPosition(center)
	for _ = 1, config.maxSpawnAttempts do
		local x = math.random(-config.spawnRadius, config.spawnRadius)
		local y = math.random(-config.spawnRadius, config.spawnRadius)

		if x ~= 0 or y ~= 0 then
			local position = Position(center.x + x, center.y + y, center.z)

			if canSpawnAt(position) then
				return position
			end
		end
	end

	return nil
end

local function getLivingSummonsByName(boss, name)
	local list = {}

	for _, summon in ipairs(boss:getSummons()) do
		if summon
			and not summon:isRemoved()
			and summon:getHealth() > 0
			and isMonsterNamed(summon, name)
		then
			list[#list + 1] = summon
		end
	end

	return list
end

local function hasLivingSummonsByName(boss, name)
	return #getLivingSummonsByName(boss, name) > 0
end

local function hasLivingReflections(boss)
	return hasLivingSummonsByName(boss, TRUE_REFLECTION_NAME)
		or hasLivingSummonsByName(boss, FALSE_REFLECTION_NAME)
end

local function removeSummonsByName(boss, names)
	for _, summon in ipairs(boss:getSummons()) do
		if summon and not summon:isRemoved() then
			for _, name in ipairs(names) do
				if isMonsterNamed(summon, name) then
					summon:remove()
					break
				end
			end
		end
	end
end

local function createSummon(boss, name)
	local position = findSpawnPosition(boss:getPosition())

	if not position then
		return nil
	end

	local summon = Game.createMonster(name, position, true, true)

	if summon then
		summon:setMaster(boss)
		position:sendMagicEffect(CONST_ME_TELEPORT)
	end

	return summon
end

-- =========================================================
-- FASE 1: SENTINELS
-- =========================================================

local function summonSentinels(boss)
	boss:say(
		"MY GUARDIANS, BREAK THEIR FORMATION!",
		TALKTYPE_MONSTER_YELL
	)

	for _ = 1, config.sentinelsPerPhase do
		createSummon(boss, SENTINEL_NAME)
	end

	boss:addHealth(config.phaseHeal)
end

-- =========================================================
-- FASE 2: CRISTALES
-- =========================================================

local function summonCrystals(boss)
	boss:say(
		"THE PERFECT BARRIER SHALL NOT FALL!",
		TALKTYPE_MONSTER_YELL
	)

	for _ = 1, config.crystalsPerPhase do
		createSummon(boss, CRYSTAL_NAME)
	end

	boss:addHealth(config.phaseHeal)
end

-- =========================================================
-- FASE 3: ROTACIÓN ELEMENTAL
-- =========================================================

local elementOrder = { "fire", "ice", "energy", "death" }

local function getNextElement(current)
	for index, element in ipairs(elementOrder) do
		if element == current then
			return elementOrder[(index % #elementOrder) + 1]
		end
	end

	return "fire"
end

local function getElementEffect(element)
	if element == "fire" then
		return CONST_ME_FIREAREA
	elseif element == "ice" then
		return CONST_ME_ICEAREA
	elseif element == "energy" then
		return CONST_ME_ENERGYAREA
	end

	return CONST_ME_MORTAREA
end

local function rotateElement(boss)
	local state = getState(boss)
	state.currentElement = getNextElement(state.currentElement)

	boss:say(
		"PERFECT ADAPTATION: " .. state.currentElement:upper() .. "!",
		TALKTYPE_MONSTER_YELL
	)

	boss:getPosition():sendMagicEffect(
		getElementEffect(state.currentElement)
	)
end

-- =========================================================
-- FASE 4: REFLEJOS
-- =========================================================

local function summonReflections(boss)
	removeSummonsByName(
		boss,
		{ TRUE_REFLECTION_NAME, FALSE_REFLECTION_NAME }
	)

	boss:say(
		"FACE PERFECTION IN EVERY REFLECTION!",
		TALKTYPE_MONSTER_YELL
	)

	createSummon(boss, TRUE_REFLECTION_NAME)

	for _ = 1, config.falseReflections do
		createSummon(boss, FALSE_REFLECTION_NAME)
	end
end

-- =========================================================
-- ONDA FINAL
-- =========================================================

local function getDirectionAway(bossPosition, playerPosition)
	local dx = playerPosition.x - bossPosition.x
	local dy = playerPosition.y - bossPosition.y

	if math.abs(dx) > math.abs(dy) then
		return dx > 0 and DIRECTION_EAST or DIRECTION_WEST
	end

	return dy > 0 and DIRECTION_SOUTH or DIRECTION_NORTH
end

local function positionInDirection(position, direction)
	if direction == DIRECTION_NORTH then
		return Position(position.x, position.y - 1, position.z)
	elseif direction == DIRECTION_EAST then
		return Position(position.x + 1, position.y, position.z)
	elseif direction == DIRECTION_SOUTH then
		return Position(position.x, position.y + 1, position.z)
	end

	return Position(position.x - 1, position.y, position.z)
end

local function pushPlayer(player, bossPosition)
	local direction = getDirectionAway(
		bossPosition,
		player:getPosition()
	)

	local current = player:getPosition()
	local destination = current

	for _ = 1, config.pushDistance do
		local nextPosition = positionInDirection(destination, direction)

		if not canSpawnAt(nextPosition) then
			break
		end

		destination = nextPosition
	end

	if destination.x ~= current.x or destination.y ~= current.y then
		player:teleportTo(destination, true)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
	end
end

local function executePerfectCollapse(bossId)
	local boss = Monster(bossId)

	if not boss or boss:isRemoved() or not isFinalBoss(boss) then
		return
	end

	local position = boss:getPosition()

	boss:say(
		"PERFECT COLLAPSE!",
		TALKTYPE_MONSTER_YELL
	)

	position:sendMagicEffect(CONST_ME_BIGCLOUDS)

	for _, player in ipairs(
		getNearbyPlayers(position, config.ultimateRadius)
	) do
		if player and not player:isRemoved() then
			doTargetCombatHealth(
				boss,
				player,
				COMBAT_ENERGYDAMAGE,
				-config.ultimateMinDamage,
				-config.ultimateMaxDamage,
				CONST_ME_ENERGYHIT
			)

			pushPlayer(player, position)
		end
	end
end

local function preparePerfectCollapse(boss)
	boss:say(
		"THE CREATION CORE IS OVERLOADING!",
		TALKTYPE_MONSTER_YELL
	)

	local position = boss:getPosition()
	position:sendMagicEffect(CONST_ME_YELLOW_RINGS)

	for _, player in ipairs(
		getNearbyPlayers(position, config.ultimateRadius)
	) do
		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"Zephyr is charging Perfect Collapse. Move away!"
		)

		player:getPosition():sendMagicEffect(
			CONST_ME_YELLOW_RINGS
		)
	end

	addEvent(
		executePerfectCollapse,
		config.ultimateWarningTime,
		boss:getId()
	)
end

-- =========================================================
-- THINK DEL BOSS
-- =========================================================

local finalThink = CreatureEvent("ZephyrPerfectThink")

function finalThink.onThink(creature, interval)
	local boss = creature:getMonster()

	if not boss or not isFinalBoss(boss) then
		return true
	end

	local state = getState(boss)
	local hpPercent = (boss:getHealth() / boss:getMaxHealth()) * 100
	local now = os.time()

	if hpPercent <= config.sentinelPhase
	and not state.sentinelTriggered
	then
		state.sentinelTriggered = true
		summonSentinels(boss)
	end

	if hpPercent <= config.crystalPhase
	and not state.crystalTriggered
	then
		state.crystalTriggered = true
		summonCrystals(boss)
	end

	if hpPercent <= config.elementalPhase
	and not state.elementalTriggered
	then
		state.elementalTriggered = true
		state.currentElement = "fire"
		state.nextElementRotation = now + config.elementalRotationCooldown

		boss:say(
			"PERFECT ADAPTATION ENGAGED!",
			TALKTYPE_MONSTER_YELL
		)

		boss:addHealth(config.phaseHeal)
	end

	if state.elementalTriggered
	and now >= state.nextElementRotation
	then
		state.nextElementRotation = now
			+ config.elementalRotationCooldown

		rotateElement(boss)
	end

	if hpPercent <= config.mirrorPhase
	and not state.mirrorTriggered
	then
		state.mirrorTriggered = true
		summonReflections(boss)
		boss:addHealth(config.phaseHeal)
	end

	if state.mirrorTriggered
	and not hasLivingReflections(boss)
	and now >= state.vulnerableUntil
	then
		summonReflections(boss)
	end

	if now >= state.nextUltimate then
		state.nextUltimate = now + config.ultimateCooldown
		preparePerfectCollapse(boss)
	end

	return true
end

finalThink:register()

-- =========================================================
-- CONTROL DE DAÑO Y RESISTENCIAS DINÁMICAS
-- =========================================================

local finalHealth = CreatureEvent("ZephyrPerfectHealth")

function finalHealth.onHealthChange(
	creature,
	attacker,
	primaryDamage,
	primaryType,
	secondaryDamage,
	secondaryType,
	origin
)
	local boss = creature:getMonster()

	if not boss or not isFinalBoss(boss) then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	local state = getState(boss)
	local now = os.time()

	local function applyMechanics(damage, damageType)
		if damage >= 0 then
			return damage
		end

		-- Escudos de fases
		if hasLivingSummonsByName(boss, SENTINEL_NAME) then
			damage = math.ceil(
				damage * config.damageWithSentinels / 100
			)
		end

		if hasLivingSummonsByName(boss, CRYSTAL_NAME) then
			damage = math.ceil(
				damage * config.damageWithCrystals / 100
			)
		end

		if hasLivingReflections(boss) then
			damage = math.ceil(
				damage * config.damageWithReflections / 100
			)
		end

		-- Ventana de vulnerabilidad
		if now < state.vulnerableUntil then
			damage = math.floor(
				damage * config.vulnerabilityMultiplier
			)
		end

		-- Adaptación elemental
		if state.elementalTriggered then
			local element = state.currentElement

			if element == "fire"
			and damageType == COMBAT_FIREDAMAGE
			then
				return 0
			elseif element == "ice"
			and damageType == COMBAT_ICEDAMAGE
			then
				return 0
			elseif element == "energy"
			and damageType == COMBAT_ENERGYDAMAGE
			then
				return 0
			elseif element == "death"
			and damageType == COMBAT_DEATHDAMAGE
			then
				return 0
			end

			if element == "fire"
			and damageType == COMBAT_ICEDAMAGE
			then
				damage = math.floor(damage * 1.25)
			elseif element == "ice"
			and damageType == COMBAT_FIREDAMAGE
			then
				damage = math.floor(damage * 1.25)
			elseif element == "energy"
			and damageType == COMBAT_EARTHDAMAGE
			then
				damage = math.floor(damage * 1.25)
			elseif element == "death"
			and damageType == COMBAT_HOLYDAMAGE
			then
				damage = math.floor(damage * 1.30)
			end
		end

		return damage
	end

	primaryDamage = applyMechanics(primaryDamage, primaryType)
	secondaryDamage = applyMechanics(secondaryDamage, secondaryType)

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

finalHealth:register()

-- =========================================================
-- MUERTE DEL REFLEJO VERDADERO
-- =========================================================

local trueReflectionDeath = CreatureEvent(
	"ZephyrTrueReflectionDeath"
)

function trueReflectionDeath.onDeath(
	creature,
	corpse,
	killer,
	mostDamageKiller,
	unjustified,
	mostDamageUnjustified
)
	local master = creature:getMaster()

	if master and isFinalBoss(master) then
		local state = getState(master)

		state.vulnerableUntil = os.time()
			+ math.ceil(config.vulnerabilityDuration / 1000)

		removeSummonsByName(
			master,
			{ FALSE_REFLECTION_NAME }
		)

		master:say(
			"THE TRUE REFLECTION... BROKEN!",
			TALKTYPE_MONSTER_YELL
		)

		master:getPosition():sendMagicEffect(
			CONST_ME_HOLYDAMAGE
		)
	end

	return true
end

trueReflectionDeath:register()

-- =========================================================
-- MUERTE DE REFLEJO FALSO
-- =========================================================

local falseReflectionDeath = CreatureEvent(
	"ZephyrFalseReflectionDeath"
)

function falseReflectionDeath.onDeath(
	creature,
	corpse,
	killer,
	mostDamageKiller,
	unjustified,
	mostDamageUnjustified
)
	local position = creature:getPosition()
	position:sendMagicEffect(CONST_ME_HOLYAREA)

	for _, player in ipairs(getNearbyPlayers(position, 3)) do
		doTargetCombatHealth(
			creature,
			player,
			COMBAT_HOLYDAMAGE,
			-90000,
			-155000,
			CONST_ME_HOLYDAMAGE
		)
	end

	return true
end

falseReflectionDeath:register()

-- =========================================================
-- MUERTE DEL BOSS
-- =========================================================

local finalDeath = CreatureEvent("ZephyrPerfectDeath")

function finalDeath.onDeath(
	creature,
	corpse,
	killer,
	mostDamageKiller,
	unjustified,
	mostDamageUnjustified
)
	for _, summon in ipairs(creature:getSummons()) do
		if summon and not summon:isRemoved() then
			summon:remove()
		end
	end

	bossState[creature:getId()] = nil

	creature:say(
		"IMPOSSIBLE... I WAS... PERFECT...",
		TALKTYPE_MONSTER_YELL
	)

	creature:getPosition():sendMagicEffect(
		CONST_ME_HOLYDAMAGE
	)

	return true
end

finalDeath:register()

-- =========================================================
-- SUMMON: ARCANE SENTINEL
-- =========================================================

local sentinelType = Game.createMonsterType(SENTINEL_NAME)
local sentinel = {}

sentinel.description = "a zephyr arcane sentinel"
sentinel.experience = 0

sentinel.outfit = {
	lookType = 130,
	lookHead = 95,
	lookBody = 88,
	lookLegs = 88,
	lookFeet = 88,
	lookAddons = 3,
}

sentinel.health = 5500000
sentinel.maxHealth = 5500000
sentinel.race = "blood"
sentinel.corpse = 5995
sentinel.speed = 320

sentinel.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	targetDistance = 1,
	staticAttackChance = 90,
	isBoss = false,
	isBlockable = true,
}

sentinel.attacks = {
	{
		name = "melee",
		interval = 2000,
		chance = 100,
		minDamage = -35000,
		maxDamage = -75000,
	},
	{
		name = "combat",
		interval = 3500,
		chance = 25,
		type = COMBAT_ENERGYDAMAGE,
		minDamage = -45000,
		maxDamage = -85000,
		range = 7,
		shootEffect = CONST_ANI_ENERGY,
		effect = CONST_ME_ENERGYHIT,
		target = true,
	},
}

sentinel.defenses = {
	defense = 130,
	armor = 170,
	mitigation = 3.00,
}

sentinel.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 35 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 25 },
}

sentinel.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
}

sentinel.loot = {}
sentinelType:register(sentinel)

-- =========================================================
-- SUMMON: WARD CRYSTAL
-- =========================================================

local crystalType = Game.createMonsterType(CRYSTAL_NAME)
local crystal = {}

crystal.description = "a zephyr ward crystal"
crystal.experience = 0

crystal.outfit = {
	lookTypeEx = 15269,
}

crystal.health = 7000000
crystal.maxHealth = 7000000
crystal.race = "energy"
crystal.corpse = 0
crystal.speed = 0

crystal.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	targetDistance = 0,
	staticAttackChance = 100,
	isBoss = false,
	isBlockable = true,
}

crystal.attacks = {}

crystal.defenses = {
	defense = 170,
	armor = 220,
	mitigation = 3.50,
}

crystal.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 55 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_ICEDAMAGE, percent = -20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 25 },
	{ type = COMBAT_HOLYDAMAGE, percent = -20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

crystal.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
}

crystal.loot = {}
crystalType:register(crystal)

-- =========================================================
-- SUMMONS: REFLEJOS
-- =========================================================

local function buildReflection(name, isTrue)
	local reflectionType = Game.createMonsterType(name)
	local reflection = {}

	reflection.description = "a reflection of zephyr"
	reflection.experience = 0

	reflection.outfit = {
		lookType = 130,
		lookHead = 114,
		lookBody = 114,
		lookLegs = 114,
		lookFeet = 114,
		lookAddons = 3,
	}

	reflection.health = isTrue and 9000000 or 4000000
	reflection.maxHealth = reflection.health
	reflection.race = "blood"
	reflection.corpse = 5995
	reflection.speed = 300

	reflection.flags = {
		summonable = false,
		attackable = true,
		hostile = true,
		convinceable = false,
		illusionable = false,
		canPushItems = true,
		canPushCreatures = true,
		targetDistance = 4,
		staticAttackChance = 85,
		isBoss = false,
		isBlockable = true,
	}

	reflection.attacks = {
		{
			name = "combat",
			interval = 3000,
			chance = 30,
			type = COMBAT_DEATHDAMAGE,
			minDamage = -50000,
			maxDamage = -95000,
			range = 7,
			shootEffect = CONST_ANI_SUDDENDEATH,
			effect = CONST_ME_MORTAREA,
			target = true,
		},
	}

	reflection.defenses = {
		defense = 140,
		armor = 180,
		mitigation = 3.00,
	}

	reflection.elements = {
		{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
		{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
		{ type = COMBAT_FIREDAMAGE, percent = 20 },
		{ type = COMBAT_ICEDAMAGE, percent = 15 },
		{ type = COMBAT_EARTHDAMAGE, percent = 20 },
		{ type = COMBAT_HOLYDAMAGE, percent = -15 },
		{ type = COMBAT_DEATHDAMAGE, percent = 40 },
	}

	reflection.immunities = {
		{ type = "paralyze", condition = true },
		{ type = "outfit", condition = true },
		{ type = "invisible", condition = true },
	}

	reflection.loot = {}

	if isTrue then
		reflection.events = {
			"ZephyrTrueReflectionDeath",
		}
	else
		reflection.events = {
			"ZephyrFalseReflectionDeath",
		}
	end

	reflectionType:register(reflection)
end

buildReflection(TRUE_REFLECTION_NAME, true)
buildReflection(FALSE_REFLECTION_NAME, false)

-- =========================================================
-- DEFINICIÓN DE ZEPHYR
-- =========================================================

local monsterType = Game.createMonsterType(BOSS_NAME)
local monster = {}

monster.description = "zephyr, the perfect creation"
monster.experience = 900000000

monster.outfit = {
	lookType = 130,
	lookHead = 114,
	lookBody = 95,
	lookLegs = 88,
	lookFeet = 108,
	lookAddons = 3,
}

monster.health = 1500000000
monster.maxHealth = 1500000000
monster.race = "blood"
monster.corpse = 5995
monster.speed = 285
monster.manaCost = 0

monster.changeTarget = {
	interval = 2800,
	chance = 35,
}

monster.strategiesTarget = {
	nearest = 35,
	health = 20,
	damage = 35,
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
	targetDistance = 3,
	staticAttackChance = 85,
	isBoss = true,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 10,
	color = 114,
}

monster.attacks = {
	{
		name = "melee",
		interval = 2000,
		chance = 100,
		minDamage = -70000,
		maxDamage = -130000,
	},
	{
		name = "combat",
		interval = 2500,
		chance = 32,
		type = COMBAT_ENERGYDAMAGE,
		minDamage = -95000,
		maxDamage = -160000,
		range = 7,
		shootEffect = CONST_ANI_ENERGY,
		effect = CONST_ME_ENERGYHIT,
		target = true,
	},
	{
		name = "combat",
		interval = 3300,
		chance = 28,
		type = COMBAT_DEATHDAMAGE,
		minDamage = -100000,
		maxDamage = -170000,
		range = 7,
		shootEffect = CONST_ANI_SUDDENDEATH,
		effect = CONST_ME_MORTAREA,
		target = true,
	},
	{
		name = "combat",
		interval = 4200,
		chance = 25,
		type = COMBAT_FIREDAMAGE,
		minDamage = -105000,
		maxDamage = -175000,
		radius = 4,
		effect = CONST_ME_FIREAREA,
		target = false,
	},
	{
		name = "combat",
		interval = 5200,
		chance = 22,
		type = COMBAT_ICEDAMAGE,
		minDamage = -110000,
		maxDamage = -180000,
		length = 7,
		spread = 2,
		effect = CONST_ME_ICEAREA,
		target = false,
	},
}

monster.defenses = {
	defense = 285,
	armor = 350,
	mitigation = 4.75,

	{
		name = "combat",
		type = COMBAT_HEALING,
		interval = 6000,
		chance = 18,
		minDamage = 6000000,
		maxDamage = 10000000,
		effect = CONST_ME_MAGIC_BLUE,
	},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 25 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "drunk", condition = true },
	{ type = "energy", condition = true },
	{ type = "fire", condition = true },
	{ type = "poison", condition = true },
}

monster.voices = {
	interval = 5000,
	chance = 16,
	{
		text = "I AM THE END OF YOUR ASCENSION!",
		yell = true,
	},
	{
		text = "EVERY FAILURE MADE ME PERFECT!",
		yell = true,
	},
	{
		text = "THE SANCTUARY BELONGS TO ME!",
		yell = true,
	},
	{
		text = "YOU WERE NEVER MEANT TO SURVIVE!",
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
		chance = 100000,
		maxCount = 50,
	},
}

monster.events = {
	"ZephyrPerfectThink",
	"ZephyrPerfectHealth",
	"ZephyrPerfectDeath",
	"BossGauntletDeath",
}

monsterType:register(monster)
