local mType = Game.createMonsterType("hellhound")
local monster = {}

monster.name = "hellhound"
monster.description = "a hellhound"
monster.experience = 6800
monster.outfit = {
	lookType = 240,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7500
monster.maxHealth = 7500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6332
monster.speed = 310
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
	interval = 5000,
	chance = 10,
	{text = "GROOOWL!", yell = false},
	{text = "GRRRRR!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 40},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -1000},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -600, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -480, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 3000, chance = 19, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -660, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 23, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -400, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 35,
	armor = 25
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "soul orb", chance = 5555},
	{name = "ham", chance = 50000, maxCount = 5},
	{id = 3115, chance = 25000},
	{name = "demonic essence", chance = 7200},
	{name = "big bone", chance = 30000},
	{name = "giant sword", chance = 2000},
	{name = "black pearl", chance = 9999, maxCount = 3},
	{id = 2853, chance = 100000, child = {
			{name = "knight axe", chance = 2857},
			{name = "spike sword", chance = 2500},
			{name = "throwing knife", chance = 15000, maxCount = 11},
			{id = 6558, chance = 8888, maxCount = 2},
			{name = "ruthless axe", chance = 1600}
		}
	}
}

mType:register(monster)




