local mType = Game.createMonsterType("destroyer")
local monster = {}

monster.name = "destroyer"
monster.description = "a destroyer"
monster.experience = 2000
monster.outfit = {
	lookType = 236,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3700
monster.maxHealth = 3700
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6320
monster.speed = 270
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
	{text = "Destructiooooon!", yell = false},
	{text = "It's a good day to destroy!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 45},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -480},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -90, maxDamage = -165, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SMALLSTONE}
}

monster.defenses = {
	defense = 35,
	armor = 30,
	{name ="speed", interval = 1000, chance = 7, speed = {min = 380, max = 380}, duration = 8000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 82},
	{name = "steel boots", chance = 2222},
	{name = "platinum coin", chance = 100000, maxCount = 3},
	{name = "giant sword", chance = 660},
	{name = "skull helmet", chance = 1000},
	{name = "meat", chance = 30000, maxCount = 5},
	{id = 2853, chance = 100000, child = {
			{name = "plate armor", chance = 6666},
			{name = "crowbar", chance = 9999},
			{name = "dark armor", chance = 2500},
			{name = "small amethyst", chance = 7500, maxCount = 2}
		}
	}
}

mType:register(monster)




