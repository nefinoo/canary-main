local mType = Game.createMonsterType("Dabura")
local monster = {}

monster.description = "a king of hell"
monster.experience = 6500000
monster.outfit = {
	lookType = 1908,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2637,
	bossRace = RARITY_ARCHFOE,
} 

monster.health = 13500000
monster.maxHealth = 13500000
monster.race = "blood"
monster.corpse = 5981
monster.speed = 85
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "athena", chance = 15, interval = 20000, count = 1 },
		{ name = "ares", chance = 15, interval = 20000, count = 1 },
		{ name = "hercules", chance = 15, interval = 20000, count = 1 },
		{ name = "zeus", chance = 15, interval = 20000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I will protect the secrets of my master!", yell = false },
	{ text = "Kaplar!", yell = false },
	{ text = "This isle will become ours alone", yell = false },
	{ text = "You already know too much.", yell = false },
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 3},
	{name = "crystal coin", chance = 75000, maxCount = 5},
	{name = "crystal coin", chance = 50000, maxCount = 8},
	{ name = "experience scroll", chance = 5000, maxCount = 4},
	{ name = "silver token", chance = 2500, maxCount = 3 },
	{ name = "lizard leather", chance = 2350, maxCount = 5},
	{ name = "lizard scale", chance = 1280, maxCount = 3 },
	{name = "ape fur", chance = 1150, maxCount = 3},
	{name = "perfect behemoth fang", chance = 550, maxCount = 2},
	{name = "behemoth claw", chance = 500},
	
	-- Reward Box
	{id = 50850, chance = 2500},
	
	{ id = 51049, chance = 150, unique = true}, -- sorcerer helmet
	{ id = 51050, chance = 150, unique = true}, -- sorcerer armor
	{ id = 51051, chance = 150, unique = true}, -- sorcerer legs
	{ id = 51052, chance = 150, unique = true}, -- sorcerer boots
	{ id = 51053, chance = 150, unique = true}, -- sorcerer shield
	
	{ id = 51082, chance = 150, unique = true}, -- paladin helmet
	{ id = 51083, chance = 150, unique = true}, -- paladin armor
	{ id = 51084, chance = 150, unique = true}, -- paladin legs
	{ id = 51085, chance = 150, unique = true}, -- paladin boots
	{ id = 51086, chance = 150, unique = true}, -- paladin shield
	
	{ id = 51062, chance = 150, unique = true}, -- knight helmet
	{ id = 51059, chance = 150, unique = true}, -- knight armor
	{ id = 51060, chance = 150, unique = true}, -- knight legs
	{ id = 51061, chance = 150, unique = true}, -- knight boots
	{ id = 51063, chance = 150, unique = true}, -- knight shield
	
	{ id = 51054, chance = 150, unique = true}, -- druid helmet
	{ id = 51055, chance = 150, unique = true}, -- druid armor
	{ id = 51056, chance = 150, unique = true}, -- druid legs
	{ id = 51057, chance = 150, unique = true}, -- druid boots
	{ id = 51058, chance = 150, unique = true}, -- druid shield
	
	{ id = 50976, chance = 100, unique = true}, -- wand
	{ id = 51087, chance = 100, unique = true}, -- bow
	{ id = 51088, chance = 100, unique = true}, -- crossbow
	{ id = 51064, chance = 100, unique = true}, -- sword
	{ id = 51069, chance = 100, unique = true}, -- axe
	{ id = 51066, chance = 100, unique = true}, -- club
	{ id = 51853, chance = 100, unique = true}, -- rod
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, minDamage = -34600, maxDamage = -45000 },
	{ name = "timira fire ring", interval = 3500, chance = 35, minDamage = -50000, maxDamage = -90000 },
	{ name = "death chain", interval = 2500, chance = 25, minDamage = -50000, maxDamage = -90000, range = 3, target = true },
	{ name = "mana drain chain", interval = 2500, chance = 25, minDamage = -50000, maxDamage = -90000 },
	{ name = "timira explosion", interval = 4200, chance = 42, minDamage = -34600, maxDamage = -45000 },
	{ name = "combat", interval = 5500, chance = 55, type = COMBAT_PHYSICALDAMAGE, minDamage = -34600, maxDamage = -45000, length = 6, spread = 2, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 5000, chance = 50, type = COMBAT_ENERGYDAMAGE, minDamage = -34600, maxDamage = -45000, range = 1, radius = 1, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
}

monster.defenses = {
	defense = 13,
	armor = 12,
	--	mitigation = ???,
	{ name = "combat", interval = 10000, chance = 15, type = COMBAT_HEALING, minDamage = 75000, maxDamage = 150000, effect = CONST_ME_MAGIC_BLUE, target = false },
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
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)



