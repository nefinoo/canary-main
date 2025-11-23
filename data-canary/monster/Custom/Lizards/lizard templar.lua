local mType = Game.createMonsterType("lizard templar")
local monster = {}

monster.name = "lizard templar"
monster.description = "a lizard templar"
monster.experience = 115
monster.outfit = {
	lookType = 113,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 410
monster.maxHealth = 410
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 4251
monster.speed = 220
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
	{text = "Hissss!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 44, attack = 30}
}

monster.defenses = {
	defense = 19,
	armor = 16
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 70},
	{id = 3264, chance = 20000},
	{name = "tusk shield", chance = 300},
	{name = "plate armor", chance = 2000},
	{name = "lizard leather", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "sentinel shield", chance = 500},
			{name = "steel helmet", chance = 3333},
			{name = "templar scytheblade", chance = 433},
			{name = "lizard scale", chance = 5000}
		}
	}
}

mType:register(monster)



