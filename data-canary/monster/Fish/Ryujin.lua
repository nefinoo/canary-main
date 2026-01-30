local mType = Game.createMonsterType("Ryujin")
local monster = {}

monster.description = "a power of the sea"
monster.experience = 25000000
monster.outfit = {
	lookType = 675,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- monster.bosstiary = {
	-- bossRaceId = 8001,
	-- bossRace = RARITY_NEMESIS,
-- }

monster.health = 20000000
monster.maxHealth = 20000000
monster.race = "venom"
monster.corpse = 21893
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 9,
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
	level = 3,
	color = 212,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "LEAVE THESE GROUNDS...", yell = true },
	{ text = "THE DARK TIDE WILL SWALLOW YOU...", yell = true },
}

monster.loot = {
	{name = "salmon", chance = 2000},
	{name = "northern pike", chance = 2000},
	{name = "worm", chance = 5000, maxCount = 25},
	{name = "rainbow trout", chance = 2000},
	{name = "green perch", chance = 2000},
	{name = "experience scroll", chance = 3000, maxCount = 2},
	{name = "platinum coin", chance = 100000, maxCount = 10},
	{name = "platinum coin", chance = 75000, maxCount = 30},
	{name = "platinum coin", chance = 50000, maxCount = 60},
	{id = 893, chance = 5},
	-- weapons lvl 500	
	{id = 7366, chance = 350},
	{id = 7426, chance = 350}, 
	{id = 7420, chance = 350}, 
	{id = 3296, chance = 350},
	{id = 7437, chance = 350},
	-- weapons lvl 100
	{name = "magic sword", chance = 500},
	{ id = 3319, chance = 500 }, 
	{ id = 3309, chance = 500 }, 
	{id = 3341, chance = 500},
	{name = "throwing star", chance = 500},
	
	{name = "demon helmet", chance = 750},
	{name = "demon legs", chance = 750},
	{name = "demon shield", chance = 750},
	{id = 6529, chance = 750}, -- soft boots
	-- Reward Box
	{id = 50850, chance = 15},
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 150, attack = 220 },

	{ name = "combat", interval = 2000, chance = 7, type = COMBAT_DEATHDAMAGE,
	  minDamage = -18000, maxDamage = -28000, range = 7,
	  shootEffect = CONST_ANI_EARTH, effect = CONST_ME_SOUND_RED, target = true },

	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN,
	  minDamage = -17000, maxDamage = -25000, radius = 3,
	  effect = CONST_ME_MAGIC_RED, target = false },

	{ name = "seacrest serpent wave", interval = 2000, chance = 25,
	  minDamage = -19000, maxDamage = -30000, target = false },

	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE,
	  minDamage = -20000, maxDamage = -28000, length = 4, spread = 3,
	  effect = CONST_ME_MAGIC_BLUE, target = false }
}

monster.defenses = {
	defense = 50,
	armor = 65,
	mitigation = 0.60,

	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING,
	  minDamage = 8000, maxDamage = 13000, effect = CONST_ME_MAGIC_BLUE, target = false }
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "invisible", condition = true }
}

mType:register(monster)



