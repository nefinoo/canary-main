local mType = Game.createMonsterType("crazed beggar")
local monster = {}

monster.name = "Crazed Beggar"
monster.description = "a crazed beggar"
monster.experience = 35
monster.outfit = {
	lookType = 153,
	lookHead = 59,
	lookBody = 38,
	lookLegs = 38,
	lookFeet = 97,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 100
monster.maxHealth = 100
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 3058
monster.speed = 220
monster.summonCost = 300

monster.changeTarget = {
	interval = 4000,
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
	interval = 4000,
	chance = 16,
	{text = "Hehehe!", yell = false},
	{text = "Raahhh!", yell = false},
	{text = "You are one of THEM! Die!", yell = false},
	{text = "Wanna buy roses??", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -25}
}

monster.defenses = {
	defense = 16,
	armor = 11
}

monster.loot = {
	{name = "gold coin", chance = 30000, maxCount = 9, description2 = "gold"},
	{name = "meat", chance = 19000, maxCount = 3, description2 = "meat"},
	{name = "dirty cape", chance = 40000, description2 = "dirty cape"},
	{name = "red rose", chance = 21000, description2 = "bed rose"},
	{id = 3258, chance = 13000, description2 = "lute"},
	{id = 2853, chance = 100000, child = {
			{name = "roll", chance = 11290, description2 = "roll"},
			{name = "wooden spoon", chance = 33000, description2 = "wooden spoon"},
			{id = 9808, chance = 2500, description2 = "rusty armor"},
			{name = "blue pillow", chance = 5500, description2 = "blue pillow"},
			{id = 3097, chance = 1500, description2 = "dwarven ring"}
		}
	}
}

mType:register(monster)



