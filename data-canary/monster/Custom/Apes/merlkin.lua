local mType = Game.createMonsterType("merlkin")
local monster = {}

monster.name = "merlkin"
monster.description = "a merlkin"
monster.experience = 2500000
monster.outfit = {
	lookType = 117,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 176433
monster.maxHealth = 176433
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6044
monster.speed = 200
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
	{text = "Ugh! Ugh! Ugh!", yell = false},
	{text = "Holy banana!", yell = false},
	{text = "Chakka! Chakka!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = 3},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -11249, maxDamage = -19037},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_FIREDAMAGE, minDamage = -11249, maxDamage = -19037, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 3000, chance = 50, type = COMBAT_ENERGYDAMAGE, minDamage = -11249, maxDamage = -190379, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT},
	{name ="poisonfield", interval = 1000, chance = 15, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY}
}

monster.defenses = {
	defense = 10,
	armor = 16,
	{ name = "combat", interval = 4000, chance = 50, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 19000, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 50},
	{name = "wand of decay", chance = 1538},
	{name = "orange", chance = 10000, maxCount = 5},
	{name = "ape fur", chance = 1000, maxCount = 2},
	{name = "banana staff", chance = 1333, unique = true},
}

mType:register(monster)




