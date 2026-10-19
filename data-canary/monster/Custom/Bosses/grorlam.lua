local mType = Game.createMonsterType("grorlam")
local monster = {}

monster.name = "grorlam"
monster.description = "Grorlam"
monster.experience = 2400
monster.outfit = {
	lookType = 205,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3000
monster.maxHealth = 3000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6005
monster.speed = 240
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 3
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
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 75, attack = 60},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -150, maxDamage = -200, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK}
}

monster.defenses = {
	defense = 25,
	armor = 15,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 100, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 6, speed = {min = 270, max = 270}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "scale armor", chance = 10000},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 2853, chance = 100000, child = {
			{id = 1781, chance = 10000},
			{name = "small stone", chance = 20000, maxCount = 5},
			{name = "carlin sword", chance = 2500},
			{id = 2920, chance = 20000},
			{name = "fishing rod", chance = 5000}
		}
	}
}

mType:register(monster)




