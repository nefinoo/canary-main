local mType = Game.createMonsterType("wild warrior")
local monster = {}

monster.name = "wild warrior"
monster.description = "a wild warrior"
monster.experience = 55
monster.outfit = {
	lookType = 131,
	lookHead = 57,
	lookBody = 57,
	lookLegs = 57,
	lookFeet = 57,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 120
monster.maxHealth = 120
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 6080
monster.speed = 215
monster.summonCost = 420

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
	{text = "An enemy!", yell = false},
	{text = "Gimme your money!", yell = false}
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
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 46, attack = 16}
}

monster.defenses = {
	defense = 18,
	armor = 9,
	{name ="speed", interval = 1000, chance = 6, speed = {min = 200, max = 200}, duration = 2000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 30},
	{name = "brass shield", chance = 10000},
	{name = "brass armor", chance = 3333},
	{name = "steel shield", chance = 6666},
	{name = "war hammer", chance = 100},
	{name = "copper shield", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "mace", chance = 10000},
			{name = "meat", chance = 20000, maxCount = 2},
			{name = "leather legs", chance = 20000},
			{name = "war hammer", chance = 909},
			{id = 2991, chance = 2000},
			{name = "iron helmet", chance = 2500}
		}
	}
}

mType:register(monster)



