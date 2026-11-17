-- Frozen Hell Fishing - normal encounter (level 350), balanced independently of standard hunts.
local mType = Game.createMonsterType("Fishing Crab")
local monster = {}

monster.name = "Fishing Crab"
monster.description = "a crab"
monster.experience = 10000000
monster.outfit = {
	lookType = 112,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 12000
monster.maxHealth = 12000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6039
monster.speed = 180
monster.summonCost = 305

monster.changeTarget = {
	interval = 2000,
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
	{text = "crab crab!", yell = false}
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
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, minDamage = -170, maxDamage = -460 },
}

monster.defenses = {
	defense = 5,
	armor = 5
}

monster.loot = {
	{ id = 3578, chance = 40000, maxCount = 3 },
	{ id = 3579, chance = 29500, maxCount = 2 },
	{ id = 3580, chance = 11500 },
	{ id = 3581, chance = 13000 },
	{ id = 7159, chance = 5500 },
	{ id = 7158, chance = 2100 },
	{ name = "fish fin", chance = 2400 },
	{ name = "small sapphire", chance = 780 },
	{ name = "platinum coin", chance = 18000, maxCount = 2 },
	{ name = "experience scroll", chance = 100 }
}

mType:register(monster)





