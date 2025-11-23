local mType = Game.createMonsterType("gladiator")
local monster = {}

monster.name = "Gladiator"
monster.description = "a gladiator"
monster.experience = 90
monster.outfit = {
	lookType = 131,
	lookHead = 78,
	lookBody = 3,
	lookLegs = 79,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 185
monster.maxHealth = 185
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 3058
monster.speed = 200
monster.summonCost = 470

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = false,
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
	interval = 4000,
	chance = 10,
	{text = "You are no match for me!", yell = false},
	{text = "Feel my prowess", yell = false},
	{text = "Fight!", yell = false},
	{text = "Take this!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 70, attack = 30}
}

monster.defenses = {
	defense = 22,
	armor = 20,
	{name ="speed", interval = 1000, chance = 9, speed = {min = 215, max = 215}, duration = 5000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20, description2 = "gp's"},
	{name = "belted cape", chance = 6000, description2 = "belted cape"},
	{name = "meat", chance = 25000, maxCount = 2, description2 = "meat"},
	{name = "brass armor", chance = 9500, description2 = "nrass armor"},
	{id = 2853, chance = 100000, description2 = "Bag", child = {
			{name = "mace", chance = 18000, description2 = "mace"},
			{name = "iron helmet", chance = 4500, description2 = "iron helmet"},
			{name = "plate shield", chance = 9500, description2 = "plate shield"},
			{name = "steel shield", chance = 15000, description2 = "steel shield"}
		}
	}
}

mType:register(monster)



