local mType = Game.createMonsterType("pirate skeleton")
local monster = {}

monster.name = "pirate skeleton"
monster.description = "a pirate skeleton"
monster.experience = 1500000000
monster.outfit = {
	lookType = 195,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 185000
monster.maxHealth = 185000
monster.runHealth = 20
monster.race = "blood"
monster.corpse = 6070
monster.speed = 230
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
	pushable = true,
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
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -7500, maxDamage = -11000}
}

monster.defenses = {
	defense = 19,
	armor = 18
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 10},
	{name = "platinum coin", chance = 75000, maxCount = 15},
	{name = "platinum coin", chance = 50000, maxCount = 18},
	{name = "experience scroll", chance = 2800, maxCount = 3},
	{ name = "hook", chance = 520 },
	{ name = "eye patch", chance = 530 },
	{ name = "peg leg", chance = 520 },
	{name = "green gem", chance = 1850},
	{name = "blue gem", chance = 1750},
	{name = "green gem", chance = 1500},
	{name = "violet gem", chance = 750},
	{name = "demon helmet", chance = 750},
	{name = "demon legs", chance = 750},
	{name = "demon shield", chance = 750},
	{id = 6529, chance = 750}, -- soft boots
	-- Reward Box
	{id = 50854, chance = 15},
}

mType:register(monster)





