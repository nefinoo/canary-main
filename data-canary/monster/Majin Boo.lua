local mType = Game.createMonsterType("Majin Boo")
local monster = {}

monster.description = "a chaotic, childish, immensely powerful magical creature"
monster.experience = 41000000
monster.outfit = {
	lookType = 1906,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2642,
	bossRace = RARITY_ARCHFOE,
} 

monster.health = 35000000
monster.maxHealth = 35000000
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
	maxSummons = 2,
	summons = {
		{ name = "Behemoth", chance = 30, interval = 5000, count = 2 },
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
	{name = "crystal coin", chance = 100000, maxCount = 5},
	{name = "crystal coin", chance = 75000, maxCount = 8},
	{name = "crystal coin", chance = 50000, maxCount = 10},
	{name = "experience scroll", chance = 5000, maxCount = 5},
	{name = "silver token", chance = 2500, maxCount = 4},
	
	{name = "white piece of cloth", chance = 2350, maxCount = 3},
	{name = "blue piece of cloth", chance = 1280, maxCount = 3},
	{name = "green piece of cloth", chance = 1150, maxCount = 3},
	{ id = 5911, chance = 2340 }, -- red piece of cloth
	
	-- Reward Box
	{id = 50851, chance = 2500},
	
	{ id = 52374, chance = 150, unique = true}, -- sorcerer helmet
	{ id = 52373, chance = 150, unique = true}, -- sorcerer armor
	{ id = 52372, chance = 150, unique = true}, -- sorcerer legs
	{ id = 52371, chance = 150, unique = true}, -- sorcerer boots
	{ id = 52370, chance = 150, unique = true}, -- sorcerer shield
	
	{ id = 51200, chance = 150, unique = true}, -- paladin helmet
	{ id = 51201, chance = 150, unique = true}, -- paladin armor
	{ id = 51202, chance = 150, unique = true}, -- paladin legs
	{ id = 51203, chance = 150, unique = true}, -- paladin boots
	{ id = 53419, chance = 150, unique = true}, -- paladin shield
	
	{ id = 51204, chance = 150, unique = true}, -- knight helmet
	{ id = 51206, chance = 150, unique = true}, -- knight armor
	{ id = 51211, chance = 150, unique = true}, -- knight legs
	{ id = 51215, chance = 150, unique = true}, -- knight boots
	{ id = 53421, chance = 150, unique = true}, -- knight shield
	
	{ id = 51234, chance = 150, unique = true}, -- druid helmet
	{ id = 51235, chance = 150, unique = true}, -- druid armor
	{ id = 51236, chance = 150, unique = true}, -- druid legs
	{ id = 51237, chance = 150, unique = true}, -- druid boots
	{ id = 51504, chance = 150, unique = true}, -- druid shield
	
	{ id = 52375, chance = 100, unique = true}, -- wand
	{ id = 51807, chance = 100, unique = true}, -- bow
	{ id = 51248, chance = 100, unique = true}, -- crossbow
	{ id = 50970, chance = 100, unique = true}, -- sword
	{ id = 50972, chance = 100, unique = true}, -- axe
	{ id = 50977, chance = 100, unique = true}, -- club
	{ id = 53019, chance = 100, unique = true}, -- rod
}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -60000, maxDamage = -90000, target = true }, -- basic attack (1000-3500)
	{ name = "death beam", interval = 3000, chance = 25, minDamage = -50000, maxDamage = -75000, target = false }, -- -_death_beam(1000-2100)
	{ name = "big death wave", interval =4500, chance = 25, minDamage = -50000, maxDamage = -75000, target = false }, -- -_death_wave(1000-2000)
	{ name = "combat", interval = 8000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -100000, maxDamage = -150000, radius = 5, effect = CONST_ME_MORTAREA, target = false }, -- -_great_death_bomb(700-1000)
}

monster.defenses = {
	defense = 13,
	armor = 12,
	--	mitigation = ???,
	{ name = "combat", interval = 4000, chance = 15, type = COMBAT_HEALING, minDamage = 155666, maxDamage = 225000, effect = CONST_ME_MAGIC_BLUE, target = false },
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



