-- =========================================================
-- THE CRYSTAL WARDEN
-- Tercer boss de la quest de Zephyr
-- Nivel recomendado: 10000
-- Canary RevScript
-- =========================================================

local BOSS_NAME = "The Crystal Warden"
local CRYSTAL_NAME = "Arcane Ward Crystal"

local config = {
	phasePercentages = { 80, 55, 30 },
	crystalsPerPhase = 4,
	crystalRadius = 5,

	-- Mientras exista al menos un cristal:
	damageReceivedWithCrystals = 20,

	-- Pulso de daño del boss
	pulseCooldown = 12,
	pulseWarningTime = 2000,
	pulseRadius = 6,
	pulseMinDamage = 85000,
	pulseMaxDamage = 140000,

	-- Curación al iniciar cada fase
	phaseHeal = 18000000,

	maxSpawnAttempts = 30,
}

local bossState = {}

-- =========================================================
-- FUNCIONES AUXILIARES
-- =========================================================

local function isCrystalWarden(creature)
	return creature
		and creature:isMonster()
		and creature:getName():lower() == BOSS_NAME:lower()
end

local function isWardCrystal(creature)
	return creature
		and creature:isMonster()
		and creature:getName():lower() == CRYSTAL_NAME:lower()
end

local function getState(boss)
	local id = boss:getId()

	if not bossState[id] then
		bossState[id] = {
			triggeredPhases = {},
			nextPulse = os.time() + config.pulseCooldown,
		}
	end

	return bossState[id]
end

local function getLivingCrystals(boss)
	local crystals = {}

	for _, summon in ipairs(boss:getSummons()) do
		if summon
			and not summon:isRemoved()
			and summon:getHealth() > 0
			and isWardCrystal(summon)
		then
			crystals[#crystals + 1] = summon
		end
	end

	return crystals
end

local function hasLivingCrystals(boss)
	return #getLivingCrystals(boss) > 0
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

local function findCrystalPosition(center)
	for _ = 1, config.maxSpawnAttempts do
		local offsetX = math.random(-config.crystalRadius, config.crystalRadius)
		local offsetY = math.random(-config.crystalRadius, config.crystalRadius)

		if offsetX ~= 0 or offsetY ~= 0 then
			local position = Position(
				center.x + offsetX,
				center.y + offsetY,
				center.z
			)

			if canSpawnAt(position) then
				return position
			end
		end
	end

	return nil
end

local function summonCrystals(boss)
	local center = boss:getPosition()
	local created = 0

	for _ = 1, config.crystalsPerPhase do
		local spawnPosition = findCrystalPosition(center)

		if spawnPosition then
			local crystal = Game.createMonster(
				CRYSTAL_NAME,
				spawnPosition,
				true,
				true
			)

			if crystal then
				crystal:setMaster(boss)
				crystal:registerEvent("ArcaneWardCrystalThink")
				crystal:registerEvent("ArcaneWardCrystalDeath")
				spawnPosition:sendMagicEffect(CONST_ME_ENERGYAREA)
				created = created + 1
			end
		end
	end

	return created
end

local function triggerCrystalPhase(boss, percentage)
	local state = getState(boss)

	if state.triggeredPhases[percentage] then
		return
	end

	state.triggeredPhases[percentage] = true

	boss:say(
		"CRYSTALS, FORM THE ARCANE BARRIER!",
		TALKTYPE_MONSTER_YELL
	)

	local created = summonCrystals(boss)

	if created > 0 then
		boss:addHealth(config.phaseHeal)
		boss:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
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
-- PULSO CRISTALINO
-- =========================================================

local function executeCrystalPulse(bossId)
	local boss = Monster(bossId)

	if not boss or boss:isRemoved() or not isCrystalWarden(boss) then
		return
	end

	local position = boss:getPosition()

	boss:say("SHATTER BENEATH ARCANE POWER!", TALKTYPE_MONSTER_YELL)
	position:sendMagicEffect(CONST_ME_ENERGYAREA)

	for _, player in ipairs(getNearbyPlayers(position, config.pulseRadius)) do
		if player and not player:isRemoved() then
			doTargetCombatHealth(
				boss,
				player,
				COMBAT_ENERGYDAMAGE,
				-config.pulseMinDamage,
				-config.pulseMaxDamage,
				CONST_ME_ENERGYHIT
			)
		end
	end
end

local function prepareCrystalPulse(boss)
	local id = boss:getId()
	local position = boss:getPosition()

	boss:say(
		"THE CRYSTAL CORE IS OVERLOADING!",
		TALKTYPE_MONSTER_YELL
	)

	position:sendMagicEffect(CONST_ME_YELLOW_RINGS)

	for _, player in ipairs(getNearbyPlayers(position, config.pulseRadius)) do
		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"The Crystal Warden is charging an arcane pulse. Move away!"
		)

		player:getPosition():sendMagicEffect(CONST_ME_YELLOW_RINGS)
	end

	addEvent(
		executeCrystalPulse,
		config.pulseWarningTime,
		id
	)
end

-- =========================================================
-- THINK DEL BOSS
-- =========================================================

local wardenThink = CreatureEvent("CrystalWardenThink")

function wardenThink.onThink(creature, interval)
	local boss = creature:getMonster()

	if not boss or not isCrystalWarden(boss) then
		return true
	end

	local state = getState(boss)
	local hpPercent = (boss:getHealth() / boss:getMaxHealth()) * 100

	for _, percentage in ipairs(config.phasePercentages) do
		if hpPercent <= percentage
			and not state.triggeredPhases[percentage]
		then
			triggerCrystalPhase(boss, percentage)
			break
		end
	end

	local now = os.time()

	if now >= state.nextPulse then
		state.nextPulse = now + config.pulseCooldown
		prepareCrystalPulse(boss)
	end

	return true
end

wardenThink:register()

-- =========================================================
-- ESCUDO DEL BOSS
-- =========================================================

local wardenHealth = CreatureEvent("CrystalWardenHealth")

function wardenHealth.onHealthChange(
	creature,
	attacker,
	primaryDamage,
	primaryType,
	secondaryDamage,
	secondaryType,
	origin
)
	local boss = creature:getMonster()

	if not boss or not isCrystalWarden(boss) then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	if hasLivingCrystals(boss) then
		if primaryDamage < 0 then
			primaryDamage = math.ceil(
				primaryDamage * config.damageReceivedWithCrystals / 100
			)
		end

		if secondaryDamage < 0 then
			secondaryDamage = math.ceil(
				secondaryDamage * config.damageReceivedWithCrystals / 100
			)
		end
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

wardenHealth:register()

-- =========================================================
-- THINK DEL CRISTAL
-- =========================================================

local crystalThink = CreatureEvent("ArcaneWardCrystalThink")

function crystalThink.onThink(creature, interval)
	local crystal = creature:getMonster()

	if not crystal or not isWardCrystal(crystal) then
		return true
	end

	local master = crystal:getMaster()

	if not master or master:isRemoved() or not isCrystalWarden(master) then
		crystal:remove()
		return true
	end

	if math.random(100) <= 20 then
		local players = getNearbyPlayers(crystal:getPosition(), 4)

		if #players > 0 then
			local target = players[math.random(#players)]

			doTargetCombatHealth(
				crystal,
				target,
				COMBAT_ENERGYDAMAGE,
				-35000,
				-70000,
				CONST_ME_ENERGYHIT
			)
		end
	end

	return true
end

crystalThink:register()

-- =========================================================
-- MUERTE DE CRISTAL
-- =========================================================

local crystalDeath = CreatureEvent("ArcaneWardCrystalDeath")

function crystalDeath.onDeath(
	creature,
	corpse,
	killer,
	mostDamageKiller,
	unjustified,
	mostDamageUnjustified
)
	local master = creature:getMaster()

	if master and isCrystalWarden(master) then
		local remaining = #getLivingCrystals(master)

		if remaining <= 1 then
			master:say(
				"THE BARRIER HAS FALLEN!",
				TALKTYPE_MONSTER_YELL
			)

			master:getPosition():sendMagicEffect(
				CONST_ME_HOLYDAMAGE
			)
		end
	end

	return true
end

crystalDeath:register()

-- =========================================================
-- MUERTE DEL BOSS
-- =========================================================

local wardenDeath = CreatureEvent("CrystalWardenDeath")

function wardenDeath.onDeath(
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
	creature:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)

	return true
end

wardenDeath:register()

-- =========================================================
-- ARCANE WARD CRYSTAL
-- =========================================================

local crystalType = Game.createMonsterType(CRYSTAL_NAME)
local crystal = {}

crystal.description = "an arcane ward crystal"
crystal.experience = 0

crystal.outfit = {
	lookTypeEx = 15269,
}

crystal.health = 5000000
crystal.maxHealth = 5000000
crystal.race = "energy"
crystal.corpse = 0
crystal.speed = 0
crystal.manaCost = 0

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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

crystal.light = {
	level = 8,
	color = 89,
}

crystal.attacks = {}

crystal.defenses = {
	defense = 140,
	armor = 180,
	mitigation = 3.00,
}

crystal.elements = {
	{
		type = COMBAT_PHYSICALDAMAGE,
		percent = 15,
	},
	{
		type = COMBAT_ENERGYDAMAGE,
		percent = 50,
	},
	{
		type = COMBAT_FIREDAMAGE,
		percent = 20,
	},
	{
		type = COMBAT_ICEDAMAGE,
		percent = -20,
	},
	{
		type = COMBAT_EARTHDAMAGE,
		percent = 20,
	},
	{
		type = COMBAT_HOLYDAMAGE,
		percent = -15,
	},
	{
		type = COMBAT_DEATHDAMAGE,
		percent = 20,
	},
}

crystal.immunities = {
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

crystal.loot = {}

crystal.events = {
	"ArcaneWardCrystalThink",
	"ArcaneWardCrystalDeath",
}

crystalType:register(crystal)

-- =========================================================
-- THE CRYSTAL WARDEN
-- =========================================================

local monsterType = Game.createMonsterType(BOSS_NAME)
local monster = {}

monster.description = "the crystal warden"
monster.experience = 340000000

monster.outfit = {
	lookType = 12,
	lookHead = 89,
	lookBody = 87,
	lookLegs = 87,
	lookFeet = 87,
	lookAddons = 3,
	lookMount = 0,
}

monster.health = 600000000
monster.maxHealth = 600000000
monster.race = "energy"
monster.corpse = 5995
monster.speed = 230
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
	color = 89,
}

monster.attacks = {
	{
		name = "melee",
		interval = 2000,
		chance = 100,
		minDamage = -45000,
		maxDamage = -85000,
	},
	{
		name = "combat",
		interval = 2500,
		chance = 30,
		type = COMBAT_ENERGYDAMAGE,
		minDamage = -60000,
		maxDamage = -105000,
		range = 7,
		shootEffect = CONST_ANI_ENERGY,
		effect = CONST_ME_ENERGYHIT,
		target = true,
	},
	{
		name = "combat",
		interval = 4000,
		chance = 24,
		type = COMBAT_PHYSICALDAMAGE,
		minDamage = -65000,
		maxDamage = -110000,
		radius = 3,
		effect = CONST_ME_GROUNDSHAKER,
		target = false,
	},
	{
		name = "combat",
		interval = 5000,
		chance = 22,
		type = COMBAT_ICEDAMAGE,
		minDamage = -70000,
		maxDamage = -115000,
		length = 6,
		spread = 2,
		effect = CONST_ME_ICEAREA,
		target = false,
	},
}

monster.defenses = {
	defense = 220,
	armor = 260,
	mitigation = 3.75,

	{
		name = "combat",
		type = COMBAT_HEALING,
		interval = 6000,
		chance = 16,
		minDamage = 3000000,
		maxDamage = 5000000,
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
		percent = 40,
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
		percent = -15,
	},
	{
		type = COMBAT_DEATHDAMAGE,
		percent = 30,
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
}

monster.voices = {
	interval = 5000,
	chance = 15,
	{
		text = "THE CRYSTALS ANSWER TO ME!",
		yell = true,
	},
	{
		text = "YOUR WEAPONS CANNOT BREAK MY WARD!",
		yell = true,
	},
	{
		text = "ARCANE BARRIERS, RISE!",
		yell = true,
	},
	{
		text = "YOU WILL SHATTER FIRST!",
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
		chance = 75000,
		maxCount = 20,
	},
}

monster.events = {
	"CrystalWardenThink",
	"CrystalWardenHealth",
	"CrystalWardenDeath",
	"BossGauntletDeath",
}

monsterType:register(monster)
