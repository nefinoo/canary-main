local mType = Game.createMonsterType("the old widow")
local monster = {}

monster.name = "The Old Widow"
monster.description = "the Old Widow"
monster.experience = 2800
monster.outfit = {
	lookType = 208,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3200
monster.maxHealth = 3200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5977
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
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -500},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -250, maxDamage = -300, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="speed", interval = 1000, chance = 20, speed = {min = -850, max = -850}, duration = 25000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="poisonfield", interval = 1000, chance = 10, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON}
}

monster.defenses = {
	defense = 21,
	armor = 17,
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 225, maxDamage = 275, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 8, speed = {min = 345, max = 345}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 2
monster.summons = {
	{name = "giant spider", chance = 13, interval = 1000, max = 2}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 50},
	{name = "plate armor", chance = 4000},
	{name = "platinum amulet", chance = 400},
	{name = "iron helmet", chance = 20000},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 5879, chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "steel helmet", chance = 10000},
			{name = "gold coin", chance = 100000, maxCount = 40},
			{name = "knight armor", chance = 1000},
			{name = "knight legs", chance = 500},
			{name = "brass legs", chance = 10000},
			{id = 3053, chance = 800}
		}
	}
}

mType:register(monster)



