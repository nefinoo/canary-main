local mType = Game.createMonsterType("skeleton")
local monster = {}

monster.name = "skeleton"
monster.description = "a skeleton"
monster.experience = 35000
monster.outfit = {
	lookType = 33,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50
monster.maxHealth = 50
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5972
monster.speed = 154
monster.summonCost = 300

monster.changeTarget = {
	interval = 2000,
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
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 18, attack = 14},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_LIFEDRAIN, minDamage = -7, maxDamage = -13, range = 1, radius = 1, target = true}
}

monster.defenses = {
	defense = 9,
	armor = 2
}

monster.loot = {
	{name = "gold coin", chance = 90000, maxCount = 10},
	{name = "legion helmet", chance = 6666},
	{id = 2853, chance = 100000, child = {
			{name = "hatchet", chance = 10000},
			{name = "mace", chance = 10000},
			{name = "brass shield", chance = 5000},
			{name = "viking helmet", chance = 5000},
			{id = 3264, chance = 3333},
			{id = 2920, chance = 20000}
		}
	}
}

mType:register(monster)





