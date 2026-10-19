local mType = Game.createMonsterType("valkyrie")
local monster = {}

monster.name = "valkyrie"
monster.description = "a valkyrie"
monster.experience = 185
monster.outfit = {
	lookType = 139,
	lookHead = 113,
	lookBody = 57,
	lookLegs = 95,
	lookFeet = 113,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 190
monster.maxHealth = 190
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 6081
monster.speed = 176
monster.summonCost = 450

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
	{text = "Stand still!", yell = false},
	{text = "One more head for me!", yell = false},
	{text = "Head off!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -6},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 7},
	{type = COMBAT_DEATHDAMAGE , percent = -7}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 35, attack = 20},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -28, maxDamage = -42, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR}
}

monster.defenses = {
	defense = 14,
	armor = 12
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "chain armor", chance = 6666},
	{name = "crystal necklace", chance = 2500},
	{name = "double axe", chance = 3333},
	{name = "chain helmet", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "red apple", chance = 10000, maxCount = 4},
			{name = "machete", chance = 10000},
			{name = "meat", chance = 20000, maxCount = 3},
			{name = "small ruby", chance = 2500, maxCount = 2},
			{name = "small diamond", chance = 2500, maxCount = 2},
			{name = "protection amulet", chance = 1000},
			{name = "plate armor", chance = 1333}
		}
	}
}

mType:register(monster)




