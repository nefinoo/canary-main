local mType = Game.createMonsterType("lizard sentinel")
local monster = {}

monster.name = "lizard sentinel"
monster.description = "a lizard sentinel"
monster.experience = 2050000
monster.outfit = {
	lookType = 114,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 176433
monster.maxHealth = 176433
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 6040
monster.speed = 240
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
	pushable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{text = "Tssss!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
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

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -4300, maxDamage = -5749},
	{name ="combat", interval = 1000, chance = 7, type = COMBAT_PHYSICALDAMAGE, minDamage = -8653, maxDamage = -11249, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR}
}

monster.defenses = {
	defense = 14,
	armor = 17
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "gold coin", chance = 100000, maxCount = 25},
	{name = "snakebite rod", chance = 450},
	{name = "obsidian lance", chance = 1428},
	{name = "halberd", chance = 6666},
	{name = "steel helmet", chance = 6666},
	{name = "sentinel shield", chance = 366},
	{name = "hunting spear", chance = 250},
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "lizard leather", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 50},
			{name = "small ruby", chance = 4000, maxCount = 4},
			{name = "cape", chance = 20000},
			{name = "lizard scale", chance = 5000}
		}
	}
}

mType:register(monster)




