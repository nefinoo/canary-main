local mType = Game.createMonsterType("munster")
local monster = {}

monster.name = "munster"
monster.description = "a munster"
monster.experience = 23
monster.outfit = {
	lookType = 56,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 58
monster.maxHealth = 58
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 2813
monster.speed = 200
monster.summonCost = 250

monster.changeTarget = {
	interval = 60000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 80,
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
	{text = "Meeeeep!", yell = false}
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
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1, maxDamage = -15}
}

monster.defenses = {
	defense = 4,
	armor = 2
}

monster.maxSummons = 2
monster.summons = {
	{name = "Rat", chance = 20, interval = 2000, max = 2}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 16},
	{name = "cheese", chance = 50000},
	{id = 2853, chance = 100000, child = {
			{name = "cookie", chance = 5000},
			{name = "jacket", chance = 50000},
			{name = "bone club", chance = 5000}
		}
	}
}

mType:register(monster)



