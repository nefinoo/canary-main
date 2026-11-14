local mType = Game.createMonsterType("dark monk")
local monster = {}

monster.name = "dark monk"
monster.description = "a dark monk"
monster.experience = 145000
monster.outfit = {
	lookType = 225,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1200
monster.maxHealth = 1200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 210
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You are no match to us!", yell = false},
	{text = "This is where your path will end!", yell = false},
	{text = "Your end has come!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -12},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 40}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 50, attack = 57},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_LIFEDRAIN, minDamage = -55, maxDamage = -100, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 23,
	armor = 22,
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_HEALING, minDamage = 25, maxDamage = 49, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 10, speed = {min = 300, max = 300}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "daramian mace", chance = 400},
	{id = 2815, chance = 10000},
	{name = "leather armor", chance = 10000},
	{name = "sandals", chance = 6666},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 2853, chance = 100000, child = {
			{name = "life crystal", chance = 1000},
			{id = 2914, chance = 6666},
			{name = "bread", chance = 20000, maxCount = 3},
			{id = 3289, chance = 3333},
			{name = "daramian waraxe", chance = 100},
			{id = 3050, chance = 1428},
			{id = 2815, chance = 20000}
		}
	}
}

mType:register(monster)





