local mType = Game.createMonsterType("ghost")
local monster = {}

monster.name = "ghost"
monster.description = "a ghost"
monster.experience = 120000
monster.outfit = {
	lookType = 48,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150
monster.maxHealth = 150
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5993
monster.speed = 160
monster.summonCost = 100

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
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
	{text = "Huh!", yell = false},
	{text = "Shhhhhh", yell = false},
	{text = "Buuuuuh", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 45, attack = 28},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -25, maxDamage = -45, range = 1, radius = 1, target = true}
}

monster.defenses = {
	defense = 10,
	armor = 10
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 15},
	{name = "sandals", chance = 10000},
	{name = "combat knife", chance = 10000},
	{name = "white piece of cloth", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "morning star", chance = 6666},
			{name = "shadow herb", chance = 20000, maxCount = 2},
			{name = "ancient shield", chance = 1666},
			{name = "snakebite rod", chance = 1333},
			{id = 3049, chance = 1538},
			{name = "clerical mace", chance = 10000},
			{id = 1962, chance = 5000}
		}
	}
}

mType:register(monster)





