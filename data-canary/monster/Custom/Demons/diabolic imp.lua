local mType = Game.createMonsterType("diabolic imp")
local monster = {}

monster.name = "diabolic imp"
monster.description = "a diabolic imp"
monster.experience = 1950
monster.outfit = {
	lookType = 237,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1950
monster.maxHealth = 1950
monster.runHealth = 400
monster.race = "blood"
monster.corpse = 6364
monster.speed = 360
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
	targetDistance = 3,
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
	{text = "Muahaha!", yell = false},
	{text = "He he he!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -25},
	{type = COMBAT_HOLYDAMAGE , percent = -12},
	{type = COMBAT_DEATHDAMAGE , percent = 25}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 70, attack = 80},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -350, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 3000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -90, maxDamage = -500, range = 7, radius = 2, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 75, maxDamage = 125, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 40, speed = {min = 450, max = 450}, duration = 40000, effect = CONST_ME_MAGIC_RED},
	{name ="invisible", interval = 4000, chance = 50, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 79},
	{id = 2920, chance = 15000},
	{id = 6558, chance = 2222},
	{name = "blank rune", chance = 18000},
	{id = 6299, chance = 999},
	{name = "brass armor", chance = 6577},
	{id = 2853, chance = 100000, child = {
			{id = 3451, chance = 20000},
			{name = "brass armor", chance = 6577},
			{name = "necrotic rod", chance = 833},
			{name = "chain armor", chance = 7887},
			{name = "soul orb", chance = 5666},
			{name = "demonic essence", chance = 7777},
			{name = "small amethyst", chance = 8888},
			{id = 3049, chance = 4555}
		}
	}
}

mType:register(monster)




