local mType = Game.createMonsterType("bone beast")
local monster = {}

monster.name = "bone beast"
monster.description = "a bone beast"
monster.experience = 580000
monster.outfit = {
	lookType = 101,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 515
monster.maxHealth = 515
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6030
monster.speed = 210
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
	{text = "Cccchhhhhhhhh!", yell = false},
	{text = "Knooorrrrr!", yell = false}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 75, attack = 47, condition = {type = CONDITION_POISON, startDamage = 110, interval = 4000}},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -25, maxDamage = -65, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -30, maxDamage = -50, radius = 3, target = false, effect = CONST_ME_MAGIC_RED},
	{name ="condition", interval = 1000, chance = 13, type = CONDITION_POISON, startDamage = 0, tick = 4000, minDamage = -60, maxDamage = -80, radius = 3, target = false, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 35,
	armor = 20,
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_HEALING, minDamage = 30, maxDamage = 60, effect = CONST_ME_HITBYPOISON}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{id = 3114, chance = 20000, maxCount = 2},
	{name = "big bone", chance = 33333},
	{name = "plate armor", chance = 2500},
	{name = "hardened bone", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "bone shield", chance = 2000},
			{name = "gold coin", chance = 50000, maxCount = 10},
			{name = "bone sword", chance = 1666},
			{name = "bone club", chance = 10000}
		}
	}
}

mType:register(monster)





