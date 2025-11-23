local mType = Game.createMonsterType("skeletor")
local monster = {}

monster.name = "skeletor"
monster.description = "skeletor"
monster.experience = 15000000
monster.outfit = {
	lookType = 298,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8000000
monster.maxHealth = 8000000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 5972
monster.speed = 580
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 33
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
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -10000, maxDamage = -18000},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -5000, maxDamage = -15000, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -5600, maxDamage = -12500, radius = 5, target = false, effect = CONST_ME_GROUNDSHAKER}
}

monster.defenses = {
	defense = 9,
	armor = 2
}

monster.loot = {
	{name = "gold coin", chance = 90000, maxCount = 15},
	{id = 3115, chance = 3333},
	{id = 2853, chance = 100000, child = {
			{name = "mace", chance = 10000},
			{name = "brass shield", chance = 5000},
			{name = "white mushroom", chance = 90000, maxCount = 3},
			{id = 3115, chance = 2789}
		}
	}
}

mType:register(monster)



