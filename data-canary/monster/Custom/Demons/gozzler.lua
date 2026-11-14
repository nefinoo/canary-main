local mType = Game.createMonsterType("Gozzler")
local monster = {}

monster.name = "Gozzler"
monster.description = "a gozzler"
monster.experience = 180000
monster.outfit = {
	lookType = 313,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 240
monster.maxHealth = 240
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 9938
monster.speed = 200
monster.summonCost = 800

monster.changeTarget = {
	interval = 4000,
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
	interval = 3500,
	chance = 10,
	{text = "Huhuhuhuuu!", yell = false},
	{text = "Let the fun begin!", yell = false},
	{text = "Yihahaha!", yell = false},
	{text = "I'll bite you! Nyehehehehe!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -30},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -111},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -32, maxDamage = -100, range = 1, radius = 1, target = true, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 42, maxDamage = 68, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 9, speed = {min = 1201, max = 1201}, duration = 3000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "brown flask", chance = 9000, description2 = "brown flask"},
	{name = "gold coin", chance = 100000, maxCount = 53, description2 = "gps"},
	{name = "morning star", chance = 7000, description2 = "morning star"},
	{name = "sabre", chance = 7000, description2 = "sabre"},
	{id = 2920, chance = 15000, description2 = "torch"},
	{name = "plate shield", chance = 9000, description2 = "plate shield"},
	{id = 2853, chance = 100000, child = {
			{name = "battle axe", chance = 1500, description2 = "battle axe"},
			{name = "serpent sword", chance = 1500, description2 = "serpent sword"},
			{name = "clerical mace", chance = 1500, description2 = "clerical mace"},
			{id = 3097, chance = 400, description2 = "dwarven ring"},
			{name = "small sapphire", chance = 300, description2 = "small sapphire"}
		}
	}
}

mType:register(monster)





