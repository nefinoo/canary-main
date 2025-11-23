local mType = Game.createMonsterType("lich")
local monster = {}

monster.name = "Lich"
monster.description = "a lich"
monster.experience = 900
monster.outfit = {
	lookType = 99,
	lookHead = 95,
	lookBody = 116,
	lookLegs = 119,
	lookFeet = 115,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 880
monster.maxHealth = 880
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6028
monster.speed = 320
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
	{text = "Doomed be the living!", yell = false},
	{text = "You will endure agony beyond thy death!", yell = false},
	{text = "Death awaits all!", yell = false},
	{text = "Thy living flesh offends me!", yell = false},
	{text = "Death and Decay!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -35},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -30, maxDamage = -100},
	{name ="combat", interval = 3000, chance = 4, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -250, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 4000, chance = 15, speed = {min = -600, max = -600}, duration = 30000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_LIFEDRAIN, minDamage = -120, maxDamage = -200, radius = 3, target = false, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -200, length = 8, spread = 0, effect = CONST_ME_MAGIC_RED},
	{name ="condition", interval = 3000, chance = 9, type = CONDITION_POISON, startDamage = 0, tick = 4000, minDamage = -300, maxDamage = -400, length = 8, spread = 0, effect = CONST_ME_HITBYPOISON}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 50, maxDamage = 150, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 4
monster.summons = {
	{name = "bonebeast", chance = 17, interval = 1000, max = 4}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{id = 3289, chance = 10000},
	{name = "platinum amulet", chance = 1666},
	{id = 7991, chance = 709},
	{name = "black pearl", chance = 6666, maxCount = 6},
	{id = 2853, chance = 100000, child = {
			{name = "castle shield", chance = 588},
			{id = 3049, chance = 888},
			{name = "white pearl", chance = 4000, maxCount = 4},
			{name = "dirty cape", chance = 10000},
			{name = "gold coin", chance = 80000, maxCount = 12},
			{id = 3059, chance = 10000},
			{name = "gold ring", chance = 900},
			{name = "lich staff", chance = 1000}
		}
	}
}

mType:register(monster)



