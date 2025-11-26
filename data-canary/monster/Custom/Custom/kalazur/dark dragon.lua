local mType = Game.createMonsterType("dark dragon")
local monster = {}

monster.name = "dark dragon"
monster.description = "a dark dragon"
monster.experience = 2500000
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 750000
monster.maxHealth = 750000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6306
monster.speed = 350
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
	canPushCreatures = true,
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
	{text = "FEEEED MY ETERNAL HUNGER!", yell = true},
	{text = "I SENSE LIFE", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 8},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -5000, maxDamage = -9950},
	{name ="melee", interval = 2000, chance = 20, minDamage = -5000, maxDamage = -7950},
	{name ="combat", interval = 3000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -5000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -1200, maxDamage = -3900, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 23, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -1800, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -5000, maxDamage = -6000, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -2000, maxDamage = -6850, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -3000, maxDamage = -6000, length = 8, spread = 3, effect = CONST_ME_MAGIC_GREEN},
	{name ="condition", interval = 1000, chance = 20, type = CONDITION_DROWN, startDamage = 0, tick = 5000, length = 8, spread = 3, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 35,
	armor = 5
}

monster.loot = {
	{id = 2853, chance = 100000, child = {
			{id = 3049, chance = 10000},
			{name = "demon shield", chance = 7000},
			{name = "demon shield", chance = 7600}
		}
	},
	{name = "small amethyst", chance = 5515, maxCount = 20},
	{name = "crystal coin", chance = 100000, maxCount = 100},
	{name = "crystal coin", chance = 100000, maxCount = 50},
	{name = "fire axe", chance = 10000},
	{id = 6529, chance = 5000},
	{name = "assassin star", chance = 5000},
	{name = "experience scroll", chance = 10000}
}

mType:register(monster)




