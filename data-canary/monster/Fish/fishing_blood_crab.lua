-- Frozen Hell Fishing - normal encounter (level 650), balanced independently of standard hunts.
local mType = Game.createMonsterType("Fishing Blood Crab")
local monster = {}

monster.name = "Fishing Blood Crab"
monster.description = "a blood crab"
monster.experience = 52000000
monster.outfit = {
	lookType = 200,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 22000
monster.maxHealth = 22000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6075
monster.speed = 210
monster.summonCost = 505

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
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
	{name ="melee", interval = 1000, chance = 100, minDamage = -370, maxDamage = -780}
}

monster.defenses = {
	defense = 15,
	armor = 10
}

monster.loot = {
	{ id = 3578, chance = 36000, maxCount = 4 },
	{ id = 3579, chance = 36500, maxCount = 3 },
	{ id = 3580, chance = 15100 },
	{ id = 3581, chance = 17000 },
	{ id = 7159, chance = 7700 },
	{ id = 7158, chance = 3500 },
	{ name = "fish fin", chance = 4000 },
	{ name = "small sapphire", chance = 1300 },
	{ name = "platinum coin", chance = 30000, maxCount = 3 },
	{ name = "experience scroll", chance = 200 }
}

mType:register(monster)





