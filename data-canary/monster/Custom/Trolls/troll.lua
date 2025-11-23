local mType = Game.createMonsterType("troll")
local monster = {}

monster.name = "troll"
monster.description = "a troll"
monster.experience = 20
monster.outfit = {
	lookType = 15,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50
monster.maxHealth = 50
monster.runHealth = 15
monster.race = "blood"
monster.corpse = 5960
monster.speed = 126
monster.summonCost = 290

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
	{text = "Grrrr", yell = false},
	{text = "Groar", yell = false},
	{text = "Gruntz!", yell = false},
	{text = "Hmmm, bugs.", yell = false},
	{text = "Hmmm, dogs.", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = -4},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, skill = 15, attack = 10}
}

monster.defenses = {
	defense = 8,
	armor = 6
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 10},
	{name = "spear", chance = 33333},
	{name = "leather boots", chance = 10000},
	{name = "leather helmet", chance = 20000},
	{id = 3003, chance = 23333},
	{name = "bronze amulet", chance = 3333},
	{id = 2853, chance = 100000, child = {
			{name = "wooden shield", chance = 6666},
			{name = "meat", chance = 30000, maxCount = 2},
			{name = "hand axe", chance = 10000},
			{name = "silver amulet", chance = 1428},
			{name = "studded club", chance = 10000}
		}
	}
}

mType:register(monster)



