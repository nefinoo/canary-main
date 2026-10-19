local mType = Game.createMonsterType("apprentice sheng")
local monster = {}

monster.name = "apprentice sheng"
monster.description = "apprentice sheng"
monster.experience = 100
monster.outfit = {
	lookType = 23,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 95
monster.maxHealth = 95
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5981
monster.speed = 170
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{text = "I will protect the secrets of my master!", yell = false},
	{text = "This isle will become ours alone!", yell = false},
	{text = "Kaplar!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -10 },
	{ name = "energyfield", interval = 1000, chance = 8, range = 7, radius = 1, shootEffect = CONST_ANI_ENERGY, target = true },
	{ name = "combat", interval = 1000, chance = 14, type = COMBAT_ENERGYDAMAGE, minDamage = 0, maxDamage = -25, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -45, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 13,
	armor = 12,
	--	mitigation = ???,
	{ name = "combat", interval = 4000, chance = 15, type = COMBAT_HEALING, minDamage = 10, maxDamage = 20, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.maxSummons = 2
monster.summons = {
	{name = "hyena", chance = 100, interval = 10500, max = 2}
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 20},
	{id = 2920, chance = 10000},
	{name = "leather helmet", chance = 8000},
	{name = "leather legs", chance = 8000},
	{name = "minotaur leather", chance = 100000},
	{id = 2853, chance = 100000, child = {
			{name = "combat knife", chance = 10000},
			{name = "carrot of doom", chance = 20000, maxCount = 5},
			{id = 3998, chance = 10000},
			{name = "heavy magic missile rune", chance = 2857},
			{name = "taurus mace", chance = 1000}
		}
	}
}

mType:register(monster)




