local mType = Game.createMonsterType("goblin leader")
local monster = {}

monster.name = "goblin Leader"
monster.description = "a goblin leader"
monster.experience = 50
monster.outfit = {
	lookType = 61,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75
monster.maxHealth = 75
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 6002
monster.speed = 200
monster.summonCost = 290

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
	canPushItems = false,
	canPushCreatures = false,
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
	{text = "Go go, Gobo attack !!", yell = false},
	{text = "Me the greenest and the meanest!", yell = false},
	{text = "Me have power to crush you!", yell = false},
	{text = "Goblinkiller! Catch him !!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 25, attack = 30},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -32, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SMALLSTONE}
}

monster.defenses = {
	defense = 12,
	armor = 10
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 7},
	{name = "gold coin", chance = 100000, maxCount = 14},
	{name = "leather helmet", chance = 10000},
	{name = "short sword", chance = 10000},
	{name = "leather armor", chance = 10000},
	{id = 2853, chance = 100000, child = {
			{name = "small axe", chance = 10000},
			{name = "small stone", chance = 20000, maxCount = 4},
			{id = 3578, chance = 20000, maxCount = 2},
			{id = 3115, chance = 10000},
			{id = 3120, chance = 10000},
			{name = "bone club", chance = 10000}
		}
	}
}

mType:register(monster)



