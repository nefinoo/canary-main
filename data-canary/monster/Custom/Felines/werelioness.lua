local mType = Game.createMonsterType("Werelioness")
local monster = {}

local supportCooldown = {}
local SUPPORT_INTERVAL = 8
local SUPPORT_RADIUS = 6
local SUPPORT_MIN_HEAL = 250000
local SUPPORT_MAX_HEAL = 400000
local SUPPORT_MAX_TARGETS = 3

local function isWereCreature(monsterCreature)
	if not monsterCreature or not monsterCreature:isMonster() then
		return false
	end

	local name = monsterCreature:getName():lower()
	return name == "werelioness"
		or name == "werelion"
		or name == "werepanther"
		or name == "weretiger"
end

local werelionessSupport = CreatureEvent("WerelionessLevel10000Support")
function werelionessSupport.onThink(creature, interval)
	local lioness = creature:getMonster()
	if not lioness then
		return true
	end

	local lionessId = lioness:getId()
	local now = os.time()
	if supportCooldown[lionessId] and supportCooldown[lionessId] > now then
		return true
	end

	supportCooldown[lionessId] = now + SUPPORT_INTERVAL

	local spectators = Game.getSpectators(lioness:getPosition(), false, false, SUPPORT_RADIUS, SUPPORT_RADIUS, SUPPORT_RADIUS, SUPPORT_RADIUS)
	local targets = {}

	for _, spectator in ipairs(spectators) do
		local target = spectator:getMonster()
		if target and target:getId() ~= lionessId and isWereCreature(target) and target:getHealth() < target:getMaxHealth() then
			targets[#targets + 1] = target
		end
	end

	table.sort(targets, function(a, b)
		return (a:getHealth() / a:getMaxHealth()) < (b:getHealth() / b:getMaxHealth())
	end)

	local healed = 0
	for _, target in ipairs(targets) do
		if healed >= SUPPORT_MAX_TARGETS then
			break
		end

		target:addHealth(math.random(SUPPORT_MIN_HEAL, SUPPORT_MAX_HEAL))
		target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		healed = healed + 1
	end

	if healed > 0 then
		lioness:say("THE PACK WILL NOT FALL!", TALKTYPE_MONSTER_SAY)
		lioness:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	end

	return true
end
werelionessSupport:register()

local werelionessSupportDeath = CreatureEvent("WerelionessLevel10000SupportDeath")
function werelionessSupportDeath.onDeath(creature)
	supportCooldown[creature:getId()] = nil
	return true
end
werelionessSupportDeath:register()


monster.description = "a werelioness"
monster.experience = 4000000000
monster.outfit = {
	lookType = 1301,
	lookHead = 0,
	lookBody = 2,
	lookLegs = 0,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 1966
monster.Bestiary = {
	class = "Lycanthrope",
	race = BESTY_RACE_LYCANTHROPE,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Lion Sanctum.",
}

monster.health = 1800000
monster.maxHealth = 1800000
monster.race = "blood"
monster.corpse = 34185
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 20,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 5,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "platinum coin", chance = 100000, maxCount = 5 },
	{ name = "gold coin", chance = 100000, maxCount = 60 },
	{ name = "small enchanted sapphire", chance = 5000, maxCount = 2 },
	{ name = "black pearl", chance = 5000, maxCount = 2 },
	{ name = "ham", chance = 5000, maxCount = 2 },
	{ name = "meat", chance = 5000, maxCount = 2 },
	{ name = "soul orb", chance = 5000, maxCount = 2 },
	{ name = "white pearl", chance = 1500, maxCount = 2 },
	{ name = "ankh", chance = 5000 },
	{ name = "crystal sword", chance = 5000 },
	{ name = "serpent sword", chance = 5000 },
	{ name = "rapier", chance = 5000 },
	{ name = "lion's mane", chance = 5000 },
	{ name = "lightning headband", chance = 1500 },
	{ name = "steel helmet", chance = 1500 },
	{ name = "doublet", chance = 1500 },
	{ name = "ivory carving", chance = 1500 },
	{ name = "magma legs", chance = 500 },
	{ name = "crown helmet", chance = 500 },
	{ name = "white silk flower", chance = 200 },
	{ name = "lion figurine", chance = 100 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -18000, maxDamage = -38000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HOLYDAMAGE, minDamage = -35000, maxDamage = -55000, range = 3, effect = CONST_ME_HOLYAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HOLYDAMAGE, minDamage = -30000, maxDamage = -50000, range = 3, shootEffect = CONST_ANI_HOLY, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -32000, maxDamage = -48000, length = 4, spread = 0, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 60,
	armor = 80,
	mitigation = 2.20,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 30000, maxDamage = 60000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 35 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -25 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.events = {
	"WerelionessLevel10000Support",
	"WerelionessLevel10000SupportDeath",
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

