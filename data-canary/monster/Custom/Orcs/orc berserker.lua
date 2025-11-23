local mType = Game.createMonsterType("orc berserker")
local monster = {}

monster.name = "orc berserker"
monster.description = "a orc berserker"
monster.experience = 195
monster.outfit = {
	lookType = 8,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 210
monster.maxHealth = 210
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5980
monster.speed = 250
monster.summonCost = 590

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = true,
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
	{text = "KRAK ORRRRRRK!", yell = true}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -30, maxDamage = -200}
}

monster.defenses = {
	defense = 12,
	armor = 15,
	{name ="speed", interval = 1000, chance = 15, speed = {min = 290, max = 290}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 15},
	{name = "meat", chance = 33333, maxCount = 3},
	{name = "halberd", chance = 6666},
	{id = 2853, chance = 100000, child = {
			{name = "chain armor", chance = 10000},
			{name = "chain helmet", chance = 10000},
			{id = 2914, chance = 5000},
			{name = "battle axe", chance = 5000}
		}
	}
}

mType:register(monster)



