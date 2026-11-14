local mType = Game.createMonsterType("beholder")
local monster = {}

monster.name = "beholder"
monster.description = "a beholder"
monster.experience = 170000
monster.outfit = {
	lookType = 17,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 260
monster.maxHealth = 260
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5992
monster.speed = 150
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
	{text = "Eye for eye!", yell = false},
	{text = "Here's looking at you!", yell = false},
	{text = "Let me take a look at you!", yell = false},
	{text = "You've got the look!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 35, attack = 12},
	{name ="combat", interval = 1000, chance = 7, type = COMBAT_ENERGYDAMAGE, minDamage = -15, maxDamage = -45, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 2000, chance = 7, type = COMBAT_FIREDAMAGE, minDamage = -25, maxDamage = -45, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 8, type = COMBAT_PHYSICALDAMAGE, minDamage = -30, maxDamage = -50, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 8, type = COMBAT_EARTHDAMAGE, minDamage = -5, maxDamage = -45, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON},
	{name ="combat", interval = 3000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -35, maxDamage = -45, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 5, type = COMBAT_MANADRAIN, minDamage = -5, maxDamage = -25, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 10,
	armor = 15
}

monster.maxSummons = 6
monster.summons = {
	{name = "skeleton", chance = 12, interval = 1000, max = 6}
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 52},
	{id = 3059, chance = 4000},
	{name = "terra rod", chance = 1333},
	{name = "steel shield", chance = 3333},
	{name = "two handed sword", chance = 2000},
	{id = 3355, chance = 100},
	{id = 2853, chance = 90000, child = {
			{name = "wooden shield", chance = 3000},
			{name = "morning star", chance = 5000},
			{name = "gold coin", chance = 100000, maxCount = 12},
			{id = 3418, chance = 1000},
			{name = "longsword", chance = 6666},
			{id = 5898, chance = 556}
		}
	}
}

mType:register(monster)





