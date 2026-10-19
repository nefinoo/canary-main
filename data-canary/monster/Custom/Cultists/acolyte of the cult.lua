local mType = Game.createMonsterType("acolyte Of The Cult")
local monster = {}

monster.name = "acolyte Of The Cult"
monster.description = "an acolyte of the cult"
monster.experience = 300
monster.outfit = {
	lookType = 194,
	lookHead = 114,
	lookBody = 121,
	lookLegs = 121,
	lookFeet = 57,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 390
monster.maxHealth = 390
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 230
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 5,
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
	{text = "Praise voodoo!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 50, maxDamage = 105, condition = {type = CONDITION_POISON, startDamage = 150, interval = 4000}},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_LIFEDRAIN, minDamage = -10, maxDamage = -100, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -185, range = 7, radius = 1, target = true, effect = CONST_ME_POISONAREA},
	{name ="drunk", interval = 1000, chance = 15, drunkenness = 25, duration = 10000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 20,
	armor = 10,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 30, maxDamage = 50, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 2
monster.summons = {
	{name = "Skeleton", chance = 100, interval = 2000, max = 2}
}

monster.loot = {
	{name = "gold coin", chance = 40000, maxCount = 54},
	{name = "small emerald", chance = 2000},
	{name = "dragon necklace", chance = 1793},
	{id = 6087, chance = 1428},
	{name = "morning star", chance = 3333},
	{id = 3053, chance = 1000},
	{id = 2853, chance = 100000, child = {
			{name = "terra rod", chance = 1333},
			{id = 3052, chance = 1428},
			{name = "pirate voodoo doll", chance = 555},
			{name = "green tunic", chance = 1666},
			{id = 5801, chance = 909}
		}
	}
}

mType:register(monster)




