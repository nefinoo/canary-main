local mType = Game.createMonsterType("quara pincher scout")
local monster = {}

monster.name = "quara pincher scout"
monster.description = "a quara pincher scout"
monster.experience = 600
monster.outfit = {
	lookType = 77,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 775
monster.maxHealth = 775
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6063
monster.speed = 250
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
	{text = "Clank clank!", yell = false},
	{text = "Clap!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 88, attack = 60},
	{name ="speed", interval = 1000, chance = 12, speed = {min = -850, max = -850}, duration = 4000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 35,
	armor = 30
}

monster.loot = {
	{name = "shrimp", chance = 20000, maxCount = 5},
	{name = "fish fin", chance = 2000},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{id = 3369, chance = 1333},
	{id = 2853, chance = 100000, child = {
			{name = "mace", chance = 5000},
			{name = "halberd", chance = 2222},
			{name = "crown armor", chance = 500},
			{name = "small ruby", chance = 1538, maxCount = 3}
		}
	}
}

mType:register(monster)




