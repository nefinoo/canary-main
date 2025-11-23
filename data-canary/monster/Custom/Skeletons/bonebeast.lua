local mType = Game.createMonsterType("bonebeast")
local monster = {}

monster.name = "Bonebeast"
monster.description = "a bonebeast"
monster.experience = 580
monster.outfit = {
	lookType = 101,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 515
monster.maxHealth = 515
monster.runHealth = 0
monster.race = "undead"
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
	{name ="melee", interval = 2000, chance = 100, skill = 40, attack = 80, condition = {type = CONDITION_POISON, startDamage = 110, interval = 4000}},
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
	{name = "gold coin", chance = 15000, maxCount = 55, description2 = "gold coin"},
	{name = "gold coin", chance = 15000, maxCount = 35, description2 = "gold coin"},
	{name = "big bone", chance = 11000, description2 = "big bone"},
	{id = 3115, chance = 47750, description2 = "bone"},
	{name = "bone club", chance = 3250, description2 = "bone club"},
	{name = "bone shield", chance = 2600, description2 = "bone shield"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{name = "green mushroom", chance = 1750, description2 = "green mushroom"},
			{name = "hardened bone", chance = 900, description2 = "hardened bone"},
			{name = "plate armor", chance = 5650, description2 = "plate armor"},
			{name = "health potion", chance = 900, description2 = "health potion"},
			{id = 3114, chance = 21000, description2 = "skull"}
		}
	}
}

mType:register(monster)



