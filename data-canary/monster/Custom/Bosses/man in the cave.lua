local mType = Game.createMonsterType("man in the cave")
local monster = {}

monster.name = "man in the cave"
monster.description = "man in the cave"
monster.experience = 555
monster.outfit = {
	lookType = 128,
	lookHead = 95,
	lookBody = 116,
	lookLegs = 95,
	lookFeet = 114,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 485
monster.maxHealth = 485
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
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
	interval = 2000,
	chance = 5,
	{text = "THE MONKS ARE MINE", yell = true},
	{text = "I will rope you up! All of you!", yell = false},
	{text = "You have been roped up!", yell = false},
	{text = "A MIC to rule them all!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 60, attack = 30},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -10, maxDamage = -95, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SMALLSTONE},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -20, maxDamage = -30, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 10,
	armor = 14
}

monster.maxSummons = 2
monster.summons = {
	{name = "Monk", chance = 20, interval = 2000, max = 1}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 27},
	{id = 3003, chance = 20000},
	{id = 3003, chance = 6666},
	{id = 3003, chance = 3333},
	{name = "brown bread", chance = 4000},
	{name = "brown piece of cloth", chance = 2000},
	{id = 2853, chance = 100000, child = {
			{name = "shard", chance = 4000},
			{name = "mammoth fur cape", chance = 6666},
			{name = "mercenary sword", chance = 6666},
			{name = "fur cap", chance = 1000},
			{name = "amulet of loss", chance = 500}
		}
	}
}

mType:register(monster)



