local mType = Game.createMonsterType("stone golem")
local monster = {}

monster.name = "stone golem"
monster.description = "a stone golem"
monster.experience = 280000
monster.outfit = {
	lookType = 67,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 270
monster.maxHealth = 270
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6005
monster.speed = 180
monster.summonCost = 590

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
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 22},
	{type = COMBAT_ENERGYDAMAGE, percent = 13},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 52, attack = 38}
}

monster.defenses = {
	defense = 18,
	armor = 10
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "scale armor", chance = 10000},
	{name = "iron ore", chance = 2500, maxCount = 2},
	{id = 2853, chance = 100000, child = {
			{id = 1781, chance = 10000},
			{name = "small stone", chance = 20000, maxCount = 5},
			{name = "carlin sword", chance = 2500},
			{id = 2920, chance = 20000},
			{name = "fishing rod", chance = 5000}
		}
	}
}

mType:register(monster)





