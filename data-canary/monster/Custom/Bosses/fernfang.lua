local mType = Game.createMonsterType("fernfang")
local monster = {}

monster.name = "fernfang"
monster.description = "Fernfang"
monster.experience = 400
monster.outfit = {
	lookType = 206,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 400
monster.maxHealth = 400
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 240
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
	interval = 5000,
	chance = 10,
	{text = "You desecrated this place!", yell = false},
	{text = "I will cleanse this isle!", yell = false},
	{text = "Grrrrrrr", yell = false},
	{text = "Yoooohhuuuu!", yell = true}
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
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 70},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 50, attack = 40},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -25, maxDamage = -45, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_ENERGYDAMAGE, minDamage = -70, maxDamage = -90, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -140, maxDamage = -180, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH}
}

monster.defenses = {
	defense = 10,
	armor = 15,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 90, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 7, speed = {min = 310, max = 310}, duration = 10000, effect = CONST_ME_MAGIC_RED},
	{ name = "outfit", interval = 1000, chance = 5, effect = CONST_ME_GROUNDSHAKER, target = false, duration = 14000, outfitMonster = "war wolf" },
}

monster.maxSummons = 3
monster.summons = {
	{name = "war wolf", chance = 13, interval = 1000, max = 3}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{id = 2815, chance = 10000},
	{name = "leather armor", chance = 10000},
	{name = "sandals", chance = 6666},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 2853, chance = 100000, child = {
			{id = 2914, chance = 6666},
			{name = "bread", chance = 20000, maxCount = 3},
			{id = 3289, chance = 3333},
			{id = 3050, chance = 1428}
		}
	}
}

mType:register(monster)



