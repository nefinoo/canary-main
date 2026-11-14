-- =========================================================
-- THE RIFT CONJURER
-- Segundo boss de la quest de Zephyr
-- Balanceado para jugadores nivel 10000 y grupos de hasta 21 jugadores
-- Canary RevScript
-- =========================================================

local BOSS_NAME = "The Rift Conjurer"
local SUMMON_NAME = "Arcane Aberration"

-- =========================================================
-- CONFIGURACIÓN
-- =========================================================

local config = {
	-- Fases de invocación según el porcentaje de vida
	phasePercentages = { 75, 50, 25 },

	-- Criaturas invocadas en cada fase
	summonsPerPhase = 4,

	-- Distancia máxima donde aparecen alrededor del boss
	summonRadius = 4,

	-- Mientras tenga aberraciones vivas, recibe este porcentaje del daño
	damageReceivedWithSummons = 30,

	-- Explosión periódica
	explosionCooldown = 14,
	explosionWarningTime = 2000,
	explosionRadius = 5,
	explosionMinDamage = 75000,
	explosionMaxDamage = 125000,

	-- Curación al iniciar una fase
	phaseHeal = 12000000,

	-- Máximo de intentos para encontrar una casilla de invocación
	maxPositionAttempts = 25,
}

-- Estado individual de cada boss activo
local bossState = {}

-- =========================================================
-- FUNCIONES AUXILIARES
-- =========================================================

local function isRiftConjurer(creature)
	return creature
		and creature:isMonster()
		and creature:getName():lower() == BOSS_NAME:lower()
end

local function isArcaneAberration(creature)
	return creature
		and creature:isMonster()
		and creature:getName():lower() == SUMMON_NAME:lower()
end

local function getBossState(boss)
	local bossId = boss:getId()

	if not bossState[bossId] then
		bossState[bossId] = {
			phasesTriggered = {},
			nextExplosion = os.time() + config.explosionCooldown,
		}
	end

	return bossState[bossId]
end

local function getLivingAberrations(boss)
	local alive = {}

	for _, summon in ipairs(boss:getSummons()) do
		if summon
			and not summon:isRemoved()
			and summon:getHealth() > 0
			and isArcaneAberration(summon)
		then
			alive[#alive + 1] = summon
		end
	end

	return alive
end

local function hasLivingAberrations(boss)
	return #getLivingAberrations(boss) > 0
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

local function findSummonPosition(centerPosition)
	for _ = 1, config.maxPositionAttempts do
		local offsetX = math.random(-config.summonRadius, config.summonRadius)
		local offsetY = math.random(-config.summonRadius, config.summonRadius)

		if offsetX ~= 0 or offsetY ~= 0 then
			local position = Position(
				centerPosition.x + offsetX,
				centerPosition.y + offsetY,
				centerPosition.z
			)

			if canSpawnAt(position) then
				return position
			end
		end
	end

	return nil
end

local function summonAberrations(boss)
	local bossPosition = boss:getPosition()
	local created = 0

	for _ = 1, config.summonsPerPhase do
		local spawnPosition = findSummonPosition(bossPosition)

		if spawnPosition then
			local summon = Game.createMonster(
				SUMMON_NAME,
				spawnPosition,
				true,
				true
			)

			if summon then
				summon:setMaster(boss)
				summon:registerEvent("ArcaneAberrationDeath")
				spawnPosition:sendMagicEffect(CONST_ME_TELEPORT)
				created = created + 1
			end
		end
	end

	return created
end

local function triggerSummonPhase(boss, phasePercentage)
	local state = getBossState(boss)

	if state.phasesTriggered[phasePercentage] then
		return
	end

	state.phasesTriggered[phasePercentage] = true

	boss:say(
		"THE RIFT OPENS! DEFEND YOUR MASTER!",
		TALKTYPE_MONSTER_YELL
	)

	local bossPosition = boss:getPosition()
	bossPosition:sendMagicEffect(CONST_ME_PURPLEENERGY)

	local created = summonAberrations(boss)

	if created > 0 then
		boss:addHealth(config.phaseHeal)
		bossPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
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
-- EXPLOSIÓN DEL VACÍO
-- =========================================================

local function executeVoidExplosion(bossId)
	local boss = Monster(bossId)

	if not boss or boss:isRemoved() or not isRiftConjurer(boss) then
		return
	end

	local bossPosition = boss:getPosition()
	local players = getNearbyPlayers(
		bossPosition,
		config.explosionRadius
	)

	boss:say("BE CONSUMED BY THE RIFT!", TALKTYPE_MONSTER_YELL)
	bossPosition:sendMagicEffect(CONST_ME_MORTAREA)

	for _, player in ipairs(players) do
		if player and not player:isRemoved() then
			doTargetCombatHealth(
				boss,
				player,
				COMBAT_DEATHDAMAGE,
				-config.explosionMinDamage,
				-config.explosionMaxDamage,
				CONST_ME_MORTAREA
			)
		end
	end
end

local function prepareVoidExplosion(boss)
	local bossId = boss:getId()
	local bossPosition = boss:getPosition()

	boss:say("THE VOID GATHERS AROUND YOU!", TALKTYPE_MONSTER_YELL)
	bossPosition:sendMagicEffect(CONST_ME_PURPLEENERGY)

	for _, player in ipairs(
		getNearbyPlayers(bossPosition, config.explosionRadius)
	) do
		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"The Rift Conjurer is preparing a void explosion. Move away!"
		)

		player:getPosition():sendMagicEffect(CONST_ME_YELLOW_RINGS)
	end

	addEvent(
		executeVoidExplosion,
		config.explosionWarningTime,
		bossId
	)
end

-- =========================================================
-- EVENTO THINK DEL BOSS
-- =========================================================

local conjurerThink = CreatureEvent("RiftConjurerThink")

function conjurerThink.onThink(creature, interval)
	local boss = creature:getMonster()

	if not boss or not isRiftConjurer(boss) then
		return true
	end

	local state = getBossState(boss)
	local healthPercentage = (
		boss:getHealth() / boss:getMaxHealth()
	) * 100

	for _, phasePercentage in ipairs(config.phasePercentages) do
		if healthPercentage <= phasePercentage
			and not state.phasesTriggered[phasePercentage]
		then
			triggerSummonPhase(boss, phasePercentage)
			break
		end
	end

	local currentTime = os.time()

	if currentTime >= state.nextExplosion then
		state.nextExplosion = currentTime + config.explosionCooldown
		prepareVoidExplosion(boss)
	end

	return true
end

conjurerThink:register()

-- =========================================================
-- REDUCCIÓN DE DAÑO MIENTRAS EXISTEN SUMMONS
-- =========================================================

local conjurerHealth = CreatureEvent("RiftConjurerHealth")

function conjurerHealth.onHealthChange(
	creature,
	attacker,
	primaryDamage,
	primaryType,
	secondaryDamage,
	secondaryType,
	origin
)
	local boss = creature:getMonster()

	if not boss or not isRiftConjurer(boss) then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	-- Solo reduce daño recibido. No altera curaciones.
	if hasLivingAberrations(boss) then
		if primaryDamage < 0 then
			primaryDamage = math.ceil(
				primaryDamage
					* config.damageReceivedWithSummons
					/ 100
			)
		end

		if secondaryDamage < 0 then
			secondaryDamage = math.ceil(
				secondaryDamage
					* config.damageReceivedWithSummons
					/ 100
			)
		end
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

conjurerHealth:register()

-- =========================================================
-- MUERTE DE UNA ABERRACIÓN
-- =========================================================

local aberrationDeath = CreatureEvent("ArcaneAberrationDeath")

function aberrationDeath.onDeath(
	creature,
	corpse,
	killer,
	mostDamageKiller,
	unjustified,
	mostDamageUnjustified
)
	local master = creature:getMaster()

	if master and isRiftConjurer(master) then
		local remaining = #getLivingAberrations(master)

		if remaining <= 1 then
			master:say(
				"MY PROTECTION... SHATTERS!",
				TALKTYPE_MONSTER_YELL
			)

			master:getPosition():sendMagicEffect(
				CONST_ME_HOLYDAMAGE
			)
		end
	end

	return true
end

aberrationDeath:register()

-- =========================================================
-- MUERTE DEL BOSS
-- =========================================================

local conjurerDeath = CreatureEvent("RiftConjurerDeath")

function conjurerDeath.onDeath(
	creature,
	corpse,
	killer,
	mostDamageKiller,
	unjustified,
	mostDamageUnjustified
)
	local bossId = creature:getId()

	for _, summon in ipairs(creature:getSummons()) do
		if summon and not summon:isRemoved() then
			summon:remove()
		end
	end

	bossState[bossId] = nil

	creature:getPosition():sendMagicEffect(
		CONST_ME_HOLYDAMAGE
	)

	return true
end

conjurerDeath:register()

-- =========================================================
-- ARCANE ABERRATION
-- Criatura invocada durante las fases
-- =========================================================

local aberrationType = Game.createMonsterType(SUMMON_NAME)
local aberration = {}

aberration.description = "an arcane aberration"
aberration.experience = 0

aberration.outfit = {
	lookType = 130,
	lookHead = 95,
	lookBody = 88,
	lookLegs = 88,
	lookFeet = 88,
	lookAddons = 3,
	lookMount = 0,
}

aberration.health = 3500000
aberration.maxHealth = 3500000
aberration.race = "blood"
aberration.corpse = 5995
aberration.speed = 310
aberration.manaCost = 0

aberration.changeTarget = {
	interval = 3000,
	chance = 25,
}

aberration.strategiesTarget = {
	nearest = 45,
	health = 20,
	damage = 25,
	random = 10,
}

aberration.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	targetDistance = 1,
	staticAttackChance = 85,
	isBoss = false,
	isBlockable = true,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

aberration.light = {
	level = 5,
	color = 95,
}

aberration.attacks = {
	{
		name = "melee",
		interval = 2000,
		chance = 100,
		minDamage = -25000,
		maxDamage = -60000,
	},
	{
		name = "combat",
		interval = 3000,
		chance = 25,
		type = COMBAT_DEATHDAMAGE,
		minDamage = -35000,
		maxDamage = -65000,
		range = 7,
		shootEffect = CONST_ANI_SUDDENDEATH,
		effect = CONST_ME_MORTAREA,
		target = true,
	},
	{
		name = "combat",
		interval = 4500,
		chance = 18,
		type = COMBAT_ENERGYDAMAGE,
		minDamage = -30000,
		maxDamage = -55000,
		radius = 2,
		effect = CONST_ME_ENERGYAREA,
		target = false,
	},
}

aberration.defenses = {
	defense = 100,
	armor = 130,
	mitigation = 2.50,
}

aberration.elements = {
	{
		type = COMBAT_PHYSICALDAMAGE,
		percent = 10,
	},
	{
		type = COMBAT_ENERGYDAMAGE,
		percent = 25,
	},
	{
		type = COMBAT_FIREDAMAGE,
		percent = 15,
	},
	{
		type = COMBAT_ICEDAMAGE,
		percent = -10,
	},
	{
		type = COMBAT_EARTHDAMAGE,
		percent = 15,
	},
	{
		type = COMBAT_HOLYDAMAGE,
		percent = -15,
	},
	{
		type = COMBAT_DEATHDAMAGE,
		percent = 35,
	},
}

aberration.immunities = {
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

aberration.voices = {
	interval = 5000,
	chance = 10,
	{
		text = "THE RIFT HUNGERS!",
		yell = true,
	},
}

aberration.loot = {}

aberration.events = {
	"ArcaneAberrationDeath",
}

aberrationType:register(aberration)

-- =========================================================
-- THE RIFT CONJURER
-- =========================================================

local monsterType = Game.createMonsterType(BOSS_NAME)
local monster = {}

monster.description = "the rift conjurer"
monster.experience = 250000000

monster.outfit = {
	-- Cambia este outfit por el que desees
	lookType = 12,
	lookHead = 95,
	lookBody = 88,
	lookLegs = 88,
	lookFeet = 88,
	lookAddons = 3,
	lookMount = 0,
}

monster.health = 450000000
monster.maxHealth = 450000000
monster.race = "venom"
monster.corpse = 5995
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 3500,
	chance = 25,
}

monster.strategiesTarget = {
	nearest = 45,
	health = 20,
	damage = 25,
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
	targetDistance = 4,
	staticAttackChance = 75,
	isBoss = true,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 8,
	color = 95,
}

-- =========================================================
-- ATAQUES
-- =========================================================

monster.attacks = {
	{
		name = "melee",
		interval = 2000,
		chance = 100,
		minDamage = -40000,
		maxDamage = -75000,
	},
	{
		name = "combat",
		interval = 2500,
		chance = 30,
		type = COMBAT_DEATHDAMAGE,
		minDamage = -50000,
		maxDamage = -90000,
		range = 7,
		shootEffect = CONST_ANI_SUDDENDEATH,
		effect = CONST_ME_MORTAREA,
		target = true,
	},
	{
		name = "combat",
		interval = 4000,
		chance = 22,
		type = COMBAT_ENERGYDAMAGE,
		minDamage = -55000,
		maxDamage = -100000,
		radius = 3,
		effect = CONST_ME_ENERGYAREA,
		target = false,
	},
	{
		name = "combat",
		interval = 5000,
		chance = 20,
		type = COMBAT_EARTHDAMAGE,
		minDamage = -60000,
		maxDamage = -105000,
		length = 6,
		spread = 2,
		effect = CONST_ME_CARNIPHILA,
		target = false,
	},
}

-- =========================================================
-- DEFENSAS
-- =========================================================

monster.defenses = {
	defense = 200,
	armor = 240,
	mitigation = 3.50,

	{
		name = "combat",
		type = COMBAT_HEALING,
		interval = 6000,
		chance = 16,
		minDamage = 2200000,
		maxDamage = 4200000,
		effect = CONST_ME_MAGIC_BLUE,
	},
}

-- =========================================================
-- ELEMENTOS
-- =========================================================

monster.elements = {
	{
		type = COMBAT_PHYSICALDAMAGE,
		percent = 15,
	},
	{
		type = COMBAT_ENERGYDAMAGE,
		percent = 30,
	},
	{
		type = COMBAT_FIREDAMAGE,
		percent = 20,
	},
	{
		type = COMBAT_ICEDAMAGE,
		percent = -10,
	},
	{
		type = COMBAT_EARTHDAMAGE,
		percent = 30,
	},
	{
		type = COMBAT_HOLYDAMAGE,
		percent = -15,
	},
	{
		type = COMBAT_DEATHDAMAGE,
		percent = 40,
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
	{
		type = "energy",
		condition = true,
	},
	{
		type = "poison",
		condition = true,
	},
}

monster.voices = {
	interval = 5000,
	chance = 15,
	{
		text = "THE RIFT OBEYS MY COMMAND!",
		yell = true,
	},
	{
		text = "MY CREATIONS WILL DEVOUR YOU!",
		yell = true,
	},
	{
		text = "YOU CANNOT BREAK THE CONJURATION!",
		yell = true,
	},
	{
		text = "YOUR SOUL WILL FEED THE VOID!",
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
		chance = 65000,
		maxCount = 15,
	},
}

monster.events = {
	"RiftConjurerThink",
	"RiftConjurerHealth",
	"RiftConjurerDeath",

	-- Evento del sistema de seis bosses
	"BossGauntletDeath",
}

monsterType:register(monster)
