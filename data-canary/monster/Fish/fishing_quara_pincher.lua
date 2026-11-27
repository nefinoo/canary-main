-- Frozen Hell: exclusivo de Fishing (nivel 1750); no altera las criaturas de caza comunes.
local mType = Game.createMonsterType("Fishing Quara Pincher")
local monster = {}

monster.name = "Fishing Quara Pincher"
monster.description = "a quara pincher"
monster.experience = 410000000
monster.outfit = {
	lookType = 77,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 37000
monster.maxHealth = 37000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6063
monster.speed = 540
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 30
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
	{text = "Clank clank!", yell = false},
	{text = "Clap!", yell = false},
	{text = "Crrrk! Crrrk!", yell = false}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -650, maxDamage = -1500, range = 1, radius = 1, target = true},
	{name ="speed", interval = 6000, chance = 15, speed = {min = -250, max = -250}, duration = 3500, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 25,
	armor = 18
}

monster.loot = {
	{ id = 3579, chance = 37600, maxCount = 5 },
	{ id = 3580, chance = 26400 },
	{ id = 3581, chance = 28200 },
	{ id = 7159, chance = 25000, maxCount = 2 },
	{ id = 7158, chance = 17400, maxCount = 2 },
	{ name = "fish fin", chance = 14400, maxCount = 2 },
	{ name = "small diamond", chance = 6800 },
	{ name = "platinum coin", chance = 50000, maxCount = 9 },
	{ name = "experience scroll", chance = 300 }
}

mType:register(monster)





