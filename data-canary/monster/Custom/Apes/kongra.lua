local mType = Game.createMonsterType("kongra")
local monster = {}

monster.name = "kongra"
monster.description = "a kongra"
monster.experience = 115
monster.outfit = {
	lookType = 116,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 340
monster.maxHealth = 340
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 6043
monster.speed = 200
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20
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
	{text = "Hugah!", yell = false},
	{text = "Ungh! Ungh!", yell = false},
	{text = "Huaauaauaauaa!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 3},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -30, maxDamage = -70}
}

monster.defenses = {
	defense = 14,
	armor = 18,
	{name ="speed", interval = 1000, chance = 7, speed = {min = 260, max = 260}, duration = 3000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "worm", chance = 20000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 65},
	{name = "small stone", chance = 2500, maxCount = 3},
	{name = "ape fur", chance = 1000, maxCount = 2},
	{id = 2853, chance = 100000, child = {
			{name = "banana", chance = 5000, maxCount = 11},
			{name = "protection amulet", chance = 2000},
			{id = 3093, chance = 2857},
			{id = 3050, chance = 1429},
			{name = "plate armor", chance = 1667}
		}
	}
}

mType:register(monster)




