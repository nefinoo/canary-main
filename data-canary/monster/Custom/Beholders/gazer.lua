local mType = Game.createMonsterType("gazer")
local monster = {}

monster.name = "gazer"
monster.description = "a gazer"
monster.experience = 90
monster.outfit = {
	lookType = 109,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 120
monster.maxHealth = 120
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6036
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
	{text = "Mommy!?", yell = false},
	{text = "Buuuuhaaaahhaaaaa!", yell = false},
	{text = "Me need mana!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
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
	{name ="melee", interval = 2000, chance = 100, skill = 25, attack = 9},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_LIFEDRAIN, minDamage = -25, maxDamage = -35, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -5, maxDamage = -15, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 15,
	armor = 4,
	{name ="speed", interval = 1000, chance = 10, speed = {min = 320, max = 320}, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 30},
	{id = 2920, chance = 20000},
	{name = "scale armor", chance = 10000},
	{name = "viking helmet", chance = 6666},
	{name = "mace", chance = 20000},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 2853, chance = 100000, child = {
			{name = "brass helmet", chance = 6666},
			{id = 3114, chance = 20000, maxCount = 2},
			{name = "knife", chance = 10000},
			{id = 3052, chance = 2500},
			{id = 3355, chance = 500}
		}
	}
}

mType:register(monster)




