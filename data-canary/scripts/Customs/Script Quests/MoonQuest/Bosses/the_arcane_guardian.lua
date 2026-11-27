-- =========================================================
-- THE ARCANE GUARDIAN
-- Primer boss de la quest de Zephyr
-- Balanceado para jugadores nivel 10000 y grupos de hasta 21 jugadores
-- Canary RevScript
-- =========================================================

local BOSS_NAME = "The Arcane Guardian"

-- =========================================================
-- CONFIGURACIÓN DE LAS MECÁNICAS
-- =========================================================

local mechanicConfig = {
	-- Cada cuántos segundos realiza la onda de empuje
	shockwaveCooldown = 20,

	-- Tiempo de advertencia antes de ejecutar la onda
	shockwaveWarningTime = 2000,

	-- Distancia alrededor del boss afectada por la onda
	shockwaveRadius = 5,

	-- Daño de la onda
	shockwaveMinDamage = 70000,
	shockwaveMaxDamage = 120000,

	-- Cantidad de casillas que intenta empujar al jugador
	pushDistance = 2,

	-- Texto mostrado antes de la onda
	warningText = "ARCANE REPULSION!",

	-- Efectos
	warningEffect = CONST_ME_ENERGYAREA,
	shockwaveEffect = CONST_ME_BIGCLOUDS,
	pushEffect = CONST_ME_TELEPORT,

	-- Sonido opcional
	useSound = true,
}

-- =========================================================
-- ESTADO DE CADA BOSS
-- =========================================================

local guardianState = {}

-- =========================================================
-- COMBATE FRONTAL ESPECIAL
-- =========================================================

local frontalCombat = Combat()

frontalCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
frontalCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
frontalCombat:setArea(createCombatArea(AREA_WAVE4))

function onGetFrontalDamage(creature, level, magicLevel)
	return -50000, -85000
end

frontalCombat:setCallback(
	CALLBACK_PARAM_LEVELMAGICVALUE,
	"onGetFrontalDamage"
)

-- =========================================================
-- FUNCIONES AUXILIARES
-- =========================================================

local function isGuardian(creature)
	if not creature or not creature:isMonster() then
		return false
	end

	return creature:getName():lower() == BOSS_NAME:lower()
end

local function getDirectionAwayFromBoss(bossPosition, playerPosition)
	local differenceX = playerPosition.x - bossPosition.x
	local differenceY = playerPosition.y - bossPosition.y

	if math.abs(differenceX) > math.abs(differenceY) then
		if differenceX > 0 then
			return DIRECTION_EAST
		end

		return DIRECTION_WEST
	end

	if differenceY > 0 then
		return DIRECTION_SOUTH
	end

	return DIRECTION_NORTH
end

local function getPositionInDirection(position, direction)
	if direction == DIRECTION_NORTH then
		return Position(position.x, position.y - 1, position.z)
	elseif direction == DIRECTION_EAST then
		return Position(position.x + 1, position.y, position.z)
	elseif direction == DIRECTION_SOUTH then
		return Position(position.x, position.y + 1, position.z)
	elseif direction == DIRECTION_WEST then
		return Position(position.x - 1, position.y, position.z)
	end

	return nil
end

local function canMoveToPosition(position)
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

local function pushPlayerAway(player, bossPosition)
	local direction = getDirectionAwayFromBoss(
		bossPosition,
		player:getPosition()
	)

	local currentPosition = player:getPosition()
	local finalPosition = currentPosition

	for _ = 1, mechanicConfig.pushDistance do
		local nextPosition = getPositionInDirection(
			finalPosition,
			direction
		)

		if not nextPosition then
			break
		end

		if not canMoveToPosition(nextPosition) then
			break
		end

		finalPosition = nextPosition
	end

	if finalPosition.x == currentPosition.x
		and finalPosition.y == currentPosition.y
		and finalPosition.z == currentPosition.z
	then
		return false
	end

	player:teleportTo(finalPosition, true)
	finalPosition:sendMagicEffect(mechanicConfig.pushEffect)

	return true
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

-- =========================================================
-- EJECUTAR ONDA ARCANA
-- =========================================================

local function executeArcaneShockwave(bossId)
	local boss = Monster(bossId)

	if not boss or boss:isRemoved() then
		guardianState[bossId] = nil
		return
	end

	if not isGuardian(boss) then
		return
	end

	local bossPosition = boss:getPosition()
	local players = getNearbyPlayers(
		bossPosition,
		mechanicConfig.shockwaveRadius
	)

	boss:say(
		"BEGONE, INTRUDERS!",
		TALKTYPE_MONSTER_YELL
	)

	bossPosition:sendMagicEffect(
		mechanicConfig.shockwaveEffect
	)

	if mechanicConfig.useSound then
		bossPosition:sendSingleSoundEffect(
			SOUND_EFFECT_TYPE_SPELL_ENERGY_WAVE
		)
	end

	for _, player in ipairs(players) do
		if player and not player:isRemoved() then
			local playerPosition = player:getPosition()

			doTargetCombatHealth(
				boss,
				player,
				COMBAT_ENERGYDAMAGE,
				-mechanicConfig.shockwaveMinDamage,
				-mechanicConfig.shockwaveMaxDamage,
				CONST_ME_ENERGYHIT
			)

			pushPlayerAway(player, bossPosition)

			playerPosition:sendMagicEffect(
				CONST_ME_ENERGYAREA
			)
		end
	end
end

-- =========================================================
-- PREPARAR ONDA ARCANA
-- =========================================================

local function prepareArcaneShockwave(boss)
	local bossId = boss:getId()
	local bossPosition = boss:getPosition()

	boss:say(
		mechanicConfig.warningText,
		TALKTYPE_MONSTER_YELL
	)

	bossPosition:sendMagicEffect(
		mechanicConfig.warningEffect
	)

	local nearbyPlayers = getNearbyPlayers(
		bossPosition,
		mechanicConfig.shockwaveRadius
	)

	for _, player in ipairs(nearbyPlayers) do
		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"The Arcane Guardian is charging a repulsion wave. Move away!"
		)

		player:getPosition():sendMagicEffect(
			CONST_ME_YELLOW_RINGS
		)
	end

	addEvent(
		executeArcaneShockwave,
		mechanicConfig.shockwaveWarningTime,
		bossId
	)
end

-- =========================================================
-- CREATURE EVENT: THINK
-- =========================================================

local guardianThink = CreatureEvent("ArcaneGuardianThink")

function guardianThink.onThink(creature, interval)
	local boss = creature:getMonster()

	if not boss or not isGuardian(boss) then
		return true
	end

	local bossId = boss:getId()
	local currentTime = os.time()

	if not guardianState[bossId] then
		guardianState[bossId] = {
			nextShockwave = currentTime
				+ mechanicConfig.shockwaveCooldown,
		}
	end

	local state = guardianState[bossId]

	if currentTime >= state.nextShockwave then
		state.nextShockwave = currentTime
			+ mechanicConfig.shockwaveCooldown

		prepareArcaneShockwave(boss)
	end

	return true
end

guardianThink:register()

-- =========================================================
-- CREATURE EVENT: MUERTE
-- =========================================================

local guardianDeath = CreatureEvent("ArcaneGuardianMechanicDeath")

function guardianDeath.onDeath(
	creature,
	corpse,
	killer,
	mostDamageKiller,
	unjustified,
	mostDamageUnjustified
)
	guardianState[creature:getId()] = nil

	creature:getPosition():sendMagicEffect(
		CONST_ME_HOLYDAMAGE
	)

	return true
end

guardianDeath:register()

-- =========================================================
-- DEFINICIÓN DEL MONSTRUO
-- =========================================================

local monsterType = Game.createMonsterType(BOSS_NAME)

local monster = {}

monster.description = "the arcane guardian"
monster.experience = 180000000

monster.outfit = {
	-- Cambia este outfit por el que quieras usar
	lookType = 12,
	lookHead = 0,
	lookBody = 77,
	lookLegs = 77,
	lookFeet = 77,
	lookAddons = 3,
	lookMount = 0,
}

monster.health = 320000000
monster.maxHealth = 320000000
monster.race = "energy"
monster.corpse = 5995
monster.speed = 220
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20,
}

monster.strategiesTarget = {
	nearest = 60,
	health = 10,
	damage = 20,
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
	targetDistance = 1,
	staticAttackChance = 90,
	isBoss = true,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 8,
	color = 89,
}

-- =========================================================
-- ATAQUES NORMALES
-- =========================================================

monster.attacks = {
	{
		name = "melee",
		interval = 2000,
		chance = 100,
		minDamage = -35000,
		maxDamage = -70000,
	},

	{
		name = "combat",
		interval = 2500,
		chance = 25,
		type = COMBAT_ENERGYDAMAGE,
		minDamage = -45000,
		maxDamage = -80000,
		range = 7,
		shootEffect = CONST_ANI_ENERGY,
		effect = CONST_ME_ENERGYHIT,
		target = true,
	},

	{
		name = "combat",
		interval = 4000,
		chance = 20,
		type = COMBAT_PHYSICALDAMAGE,
		minDamage = -55000,
		maxDamage = -95000,
		radius = 3,
		effect = CONST_ME_GROUNDSHAKER,
		target = false,
	},

	-- Ataque frontal
	{
		name = "combat",
		interval = 5000,
		chance = 25,
		type = COMBAT_ENERGYDAMAGE,
		minDamage = -50000,
		maxDamage = -85000,
		length = 5,
		spread = 2,
		effect = CONST_ME_ENERGYAREA,
		target = false,
	},
}

-- =========================================================
-- DEFENSAS
-- =========================================================

monster.defenses = {
	defense = 180,
	armor = 220,
	mitigation = 3.25,

	{
		name = "combat",
		type = COMBAT_HEALING,
		interval = 5000,
		chance = 18,
		minDamage = 1800000,
		maxDamage = 3500000,
		effect = CONST_ME_MAGIC_BLUE,
	},
}

-- =========================================================
-- ELEMENTOS
-- =========================================================

monster.elements = {
	{
		type = COMBAT_PHYSICALDAMAGE,
		percent = 10,
	},
	{
		type = COMBAT_ENERGYDAMAGE,
		percent = 35,
	},
	{
		type = COMBAT_FIREDAMAGE,
		percent = 25,
	},
	{
		type = COMBAT_ICEDAMAGE,
		percent = -10,
	},
	{
		type = COMBAT_EARTHDAMAGE,
		percent = 25,
	},
	{
		type = COMBAT_HOLYDAMAGE,
		percent = -10,
	},
	{
		type = COMBAT_DEATHDAMAGE,
		percent = 25,
	},
}

-- =========================================================
-- INMUNIDADES
-- =========================================================

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
	{
		type = "fire",
		condition = true,
	},
	{
		type = "energy",
		condition = true,
	},
}

-- =========================================================
-- VOCES
-- =========================================================

monster.voices = {
	interval = 5000,
	chance = 15,

	{
		text = "THE LABORATORY MUST REMAIN SEALED!",
		yell = true,
	},
	{
		text = "ARCANE PROTOCOL ENGAGED!",
		yell = true,
	},
	{
		text = "INTRUDERS WILL BE ERADICATED!",
		yell = true,
	},
	{
		text = "NONE SHALL PASS!",
		yell = true,
	},
}

-- =========================================================
-- LOOT
-- =========================================================

monster.loot = {
	{
		id = 2148,
		chance = 100000,
		maxCount = 100,
	},
	{
		id = 2152,
		chance = 50000,
		maxCount = 10,
	},
}

-- =========================================================
-- EVENTOS
-- =========================================================

monster.events = {
	"ArcaneGuardianThink",
	"ArcaneGuardianMechanicDeath",

	-- Evento del sistema de seis bosses
	"BossGauntletDeath",
}

monsterType:register(monster)