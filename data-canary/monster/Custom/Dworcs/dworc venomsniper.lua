local mType = Game.createMonsterType("dworc venomsniper")
local monster = {}

monster.name = "dworc venomsniper"
monster.description = "a dworc venomsniper"
monster.experience = 30
monster.outfit = {
	lookType = 216,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 80
monster.maxHealth = 80
monster.runHealth = 15
monster.race = "blood"
monster.corpse = 6059
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
	canPushItems = false,
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
	{text = "grak brrretz!", yell = false},
	{text = "grow truk grrrrr.", yell = false},
	{text = "prek tars, dekklep zurk.", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -6},
	{type = COMBAT_HOLYDAMAGE , percent = 18},
	{type = COMBAT_DEATHDAMAGE , percent = -9}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 20, attack = 10},
	{name ="condition", interval = 1000, chance = 25, type = CONDITION_POISON, startDamage = 0, tick = 4000, minDamage = -14, maxDamage = -26, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_POISON}
}

monster.defenses = {
	defense = 15,
	armor = 3
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "crystal coin", chance = 100000, maxCount = 12},
	{name = "meat", chance = 40000, maxCount = 2},
	{name = "bast skirt", chance = 200},
	{name = "salamander shield", chance = 100},
	{name = "wooden shield", chance = 10000},
	{name = "copper shield", chance = 4000},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 2853, chance = 100000, child = {
			{name = "sabre", chance = 6666},
			{name = "chain armor", chance = 5000},
			{name = "machete", chance = 5000},
			{name = "studded club", chance = 5000},
			{id = 2875, chance = 20000}
		}
	}
}

mType:register(monster)




