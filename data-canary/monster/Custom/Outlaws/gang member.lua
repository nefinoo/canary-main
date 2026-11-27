local mType = Game.createMonsterType("Gang Member")
local monster = {}

monster.name = "Gang Member"
monster.description = "a gang member"
monster.experience = 70000
monster.outfit = {
	lookType = 151,
	lookHead = 114,
	lookBody = 19,
	lookLegs = 42,
	lookFeet = 20,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 295
monster.maxHealth = 295
monster.runHealth = 45
monster.race = "blood"
monster.corpse = 3058
monster.speed = 220
monster.summonCost = 420

monster.changeTarget = {
	interval = 2000,
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
	{text = "This is our territory!", yell = false},
	{text = "Help me guys!", yell = false},
	{text = "I don't like the way you look!", yell = false},
	{text = "You're wearing the wrong colours!", yell = false}
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
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -55}
}

monster.defenses = {
	defense = 16,
	armor = 14
}

monster.loot = {
	{name = "gold coin", chance = 65000, maxCount = 23, description2 = "gold"},
	{name = "studded legs", chance = 19000, description2 = "studded legs"},
	{name = "meat", chance = 33333, maxCount = 2, description2 = "meat"},
	{name = "spear", chance = 14500, description2 = "mace"},
	{id = 2816, chance = 100000, child = {
			{name = "leather legs", chance = 38000, description2 = "leather Legs"},
			{name = "bread", chance = 20000, maxCount = 2, description2 = "bread"},
			{id = 3093, chance = 5500, description2 = "club ring"}
		}
	}
}

mType:register(monster)





