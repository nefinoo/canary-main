local mType = Game.createMonsterType("swamp troll")
local monster = {}

monster.name = "swamp troll"
monster.description = "a swamp troll"
monster.experience = 65
monster.outfit = {
	lookType = 76,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 55
monster.maxHealth = 55
monster.runHealth = 15
monster.race = "blood"
monster.corpse = 6018
monster.speed = 128
monster.summonCost = 320

monster.changeTarget = {
	interval = 5000,
	chance = 0
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
	{text = "Grrrr", yell = false},
	{text = "Groar!", yell = false},
	{text = "Me strong! Me ate spinach!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 20, attack = 12, condition = {type = CONDITION_POISON, startDamage = 30, interval = 4000}}
}

monster.defenses = {
	defense = 10,
	armor = 6
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 12},
	{id = 3578, chance = 90000},
	{id = 2853, chance = 100000, child = {
			{name = "leather boots", chance = 20000},
			{id = 2920, chance = 20000},
			{name = "fishing rod", chance = 20000}
		}
	}
}

mType:register(monster)



