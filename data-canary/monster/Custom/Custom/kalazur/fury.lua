local mType = Game.createMonsterType("fury")
local monster = {}

monster.name = "Fury"
monster.description = "a fury"
monster.experience = 2500000
monster.outfit = {
	lookType = 149,
	lookHead = 94,
	lookBody = 77,
	lookLegs = 96,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 1300000
monster.maxHealth = 1300000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6081
monster.speed = 460
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
	canPushCreatures = true,
	staticAttackChance = 60,
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
	interval = 3000,
	chance = 30,
	{text = "Ahhhhrrrr!", yell = false},
	{text = "Waaaaah!", yell = false},
	{text = "Carnage!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = -15},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 40},
	{type = COMBAT_HOLYDAMAGE , percent = 40},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -4000, maxDamage = -10000},
	{name ="combat", interval = 2000, chance = 80, type = COMBAT_PHYSICALDAMAGE, minDamage = -1400, maxDamage = -2000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGSTAR},
	{name ="melee", interval = 1000, chance = 30, minDamage = -11500, maxDamage = -15500},
	{name ="melee", interval = 3000, chance = 40, minDamage = -3000, maxDamage = -4200},
	{name ="combat", interval = 1000, chance = 55, type = COMBAT_PHYSICALDAMAGE, minDamage = -1700, maxDamage = -2000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 30,
	armor = 25,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 1800, maxDamage = 9900, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 83, description2 = "gold coin"},
	{name = "steel boots", chance = 400, description2 = "steel boots"},
	{id = 6558, chance = 5555, maxCount = 3, description2 = "concentrated demonic blood"},
	{name = "meat", chance = 25000, description2 = "meat"},
	{name = "demonic essence", chance = 2500, description2 = "demonic essence"},
	{name = "soul orb", chance = 8888, description2 = "soul orb"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{name = "crown armor", chance = 600, description2 = "crown armor"},
			{name = "terra rod", chance = 1333, description2 = "terra rod"},
			{name = "white pearl", chance = 12000, description2 = "white pearl"},
			{id = 3039, chance = 1900, description2 = "red gem"},
			{name = "red piece of cloth", chance = 1800, description2 = "red piece of cloth"}
		}
	}
}

mType:register(monster)



