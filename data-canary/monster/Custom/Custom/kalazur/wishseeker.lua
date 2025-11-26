local mType = Game.createMonsterType("Wishseeker")
local monster = {}

monster.name = "Wishseeker"
monster.description = "a wishseeker"
monster.experience = 2500000
monster.outfit = {
	lookType = 80,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 800000
monster.maxHealth = 800000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6020
monster.speed = 290
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
	interval = 5000,
	chance = 10,
	{text = "Simsalabim", yell = false},
	{text = "Feel the power of my magic, tiny mortal!", yell = false},
	{text = "Be careful what you wish for.", yell = false},
	{text = "Wishes can come true.", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -6000, maxDamage = -12000},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_FIREDAMAGE, minDamage = -4500, maxDamage = -7500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="condition", interval = 1000, chance = 34, type = CONDITION_ENERGY, startDamage = 0, tick = 10000, minDamage = -500, maxDamage = -900, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -5500, maxDamage = -10500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH},
	{name ="drunk", interval = 1000, chance = 15, drunkenness = 25, duration = 10000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA},
	{name = "outfit", interval = 1000, chance = 17, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 20000, outfitMonster = "rabbit" },
}

monster.defenses = {
	defense = 10,
	armor = 20
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20, description2 = "gold coin"},
	{name = "royal spear", chance = 2000, maxCount = 2, description2 = "royal spear"},
	{name = "small sapphire", chance = 6666, maxCount = 4, description2 = "small sapphire"},
	{name = "mystic turban", chance = 1111, description2 = "mystic turban"},
	{name = "blue rose", chance = 1000, description2 = "blue rose"},
	{id = 3595, chance = 50000, maxCount = 5, description2 = "carrot"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{id = 1971, chance = 10000, description2 = "book"},
			{id = 2914, chance = 20000, description2 = "lamp"},
			{name = "small oil lamp", chance = 7500, description2 = "small oil lamp"},
			{name = "blue piece of cloth", chance = 5000, description2 = "blue piece of cloth"}
		}
	}
}

mType:register(monster)




