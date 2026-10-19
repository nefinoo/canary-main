local mType = Game.createMonsterType("pirate marauder")
local monster = {}

monster.name = "pirate marauder"
monster.description = "a pirate marauder"
monster.experience = 125
monster.outfit = {
	lookType = 93,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 210
monster.maxHealth = 210
monster.runHealth = 25
monster.race = "blood"
monster.corpse = 6080
monster.speed = 230
monster.summonCost = 490

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
	{text = "Plundeeeeer!", yell = false},
	{text = "Give up!", yell = false},
	{text = "Hiyaa!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 16},
	{type = COMBAT_FIREDAMAGE, percent = -8},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = -7}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -140},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -65, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR}
}

monster.defenses = {
	defense = 20,
	armor = 15
}

monster.loot = {
	{name = "gold coin", chance = 42000, maxCount = 80},
	{id = 3264, chance = 15000},
	{id = 2920, chance = 18000},
	{name = "bandana", chance = 916},
	{name = "chain armor", chance = 6666},
	{name = "eye patch", chance = 5000},
	{name = "pirate shirt", chance = 5000},
	{name = "pirate backpack", chance = 100000, child = {
			{id = 5090, chance = 1666},
			{id = 5792, chance = 3333},
			{name = "peg leg", chance = 1428},
			{name = "eye patch", chance = 1428},
			{name = "hook", chance = 1428}
		}
	}
}

mType:register(monster)




