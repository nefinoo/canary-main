local mType = Game.createMonsterType("Jellyfish")
local monster = {}

monster.description = "a jellyfish"
monster.experience = 7500000
monster.outfit = {
	lookType = 452,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 781
monster.Bestiary = {
	class = "Aquatic",
	race = BESTY_RACE_AQUATIC,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 1,
	Locations = "Fiehonja, Krailos Steppe underwater cave.",
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "undead"
monster.corpse = 13857
monster.speed = 84
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	isPreyExclusive = true,
}

monster.light = {
	level = 5,
	color = 65,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Luuurrrp!", yell = false },
}

monster.loot = {
	{name = "experience scroll", chance = 3000},
	{name = "gold coin", chance = 100000, maxCount = 90},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "platinum coin", chance = 74000, maxCount = 15},
	{ id = 3578, chance = 35430, maxCount = 15}, -- fish
	{ name = "salmon", chance = 14500, maxCount = 10},
}

monster.attacks = {
	{name = "melee", interval = 1500, chance = 100, minDamage = -288, maxDamage = -375, effect = CONST_ME_DRAWBLOOD },
	{name ="combat", interval = 4000, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -288, maxDamage = -375, length = 8, spread = 3, effect = 38},
	
}

monster.defenses = {
	defense = 10,
	armor = 11,
	mitigation = 0.30,
	-- { name = "invisible", interval = 2000, chance = 15 },
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




