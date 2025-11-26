local mType = Game.createMonsterType("lizard snakecharmer")
local monster = {}

monster.name = "lizard snakecharmer"
monster.description = "a lizard snakecharmer"
monster.experience = 210
monster.outfit = {
	lookType = 115,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 325
monster.maxHealth = 325
monster.runHealth = 15
monster.race = "blood"
monster.corpse = 6041
monster.speed = 200
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
	canPushItems = true,
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
	{text = "I ssssmell warm blood!", yell = false},
	{text = "Shhhhhhhh", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -16},
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
	{name ="melee", interval = 2000, chance = 100, skill = 28, attack = 18},
	{name ="condition", interval = 1000, chance = 12, type = CONDITION_POISON, startDamage = 0, tick = 4000, minDamage = -50, maxDamage = -90, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -100, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS}
}

monster.defenses = {
	defense = 15,
	armor = 17,
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 2
monster.summons = {
	{name = "cobra", chance = 100, interval = 1000, max = 2}
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "gold coin", chance = 100000, maxCount = 25},
	{name = "yellow gem", chance = 555},
	{name = "wand of dragonbreath", chance = 400},
	{name = "snakebite rod", chance = 1333},
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "lizard leather", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "terra rod", chance = 1333},
			{name = "gold coin", chance = 100000, maxCount = 50},
			{name = "small amethyst", chance = 4000, maxCount = 4},
			{name = "cape", chance = 20000},
			{name = "lizard scale", chance = 5000}
		}
	}
}

mType:register(monster)




