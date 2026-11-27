-- Frozen Hell Fishing - normal encounter (level 50), balanced independently of standard hunts.
local mType = Game.createMonsterType("Fishing Calamary")
local monster = {}

monster.description = "a calamary"
monster.experience = 1560000
monster.outfit = {
	lookType = 451,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 780
monster.Bestiary = {
	class = "Aquatic",
	race = BESTY_RACE_AQUATIC,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 1,
	Locations = "Fiehonja.",
}

monster.health = 2900
monster.maxHealth = 2900
monster.race = "undead"
monster.corpse = 13853
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 75,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	isPreyExclusive = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Bubble!", yell = false },
	{ text = "Bobble!", yell = false },
}

monster.loot = {
	{ id = 3578, chance = 48000, maxCount = 1 },
	{ id = 3579, chance = 15500, maxCount = 1 },
	{ id = 3580, chance = 4300 },
	{ id = 3581, chance = 5000 },
	{ id = 7159, chance = 1100 }
}


monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -40, maxDamage = -85},
	{name ="combat", interval = 4000, chance = 40, type = COMBAT_DROWNDAMAGE, minDamage = -35, maxDamage = -80, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_REDSTAR, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -35, maxDamage = -85, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED}
}


monster.defenses = {
	defense = 5,
	armor = 13,
	mitigation = 0.36,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)




