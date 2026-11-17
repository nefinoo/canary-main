-- Frozen Hell Fishing - normal encounter (level 500), balanced independently of standard hunts.
local mType = Game.createMonsterType("Fishing Water Elemental")
local monster = {}

monster.name = "Fishing Water Elemental"
monster.description = "a water elemental"
monster.experience = 40300000
monster.outfit = {
	lookType = 286,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 17500
monster.maxHealth = 17500
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 9582
monster.speed = 450
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -260, maxDamage = -620, condition = { type = CONDITION_POISON, totalDamage = 1200, interval = 4000 } },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_DROWNDAMAGE, minDamage = -140, maxDamage = -310, range = 7, radius = 2, effect = CONST_ME_LOSEENERGY, target = true },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -140, maxDamage = -310, range = 7, shootEffect = CONST_ANI_SMALLICE, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 35, minDamage = -100, maxDamage = -220, radius = 5, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 22,
	armor = 20,
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 120, maxDamage = 240, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{ id = 3578, chance = 38000, maxCount = 4 },
	{ id = 3579, chance = 33000, maxCount = 3 },
	{ id = 3580, chance = 13300 },
	{ id = 3581, chance = 15000 },
	{ id = 7159, chance = 6600 },
	{ id = 7158, chance = 2800 },
	{ name = "fish fin", chance = 3200 },
	{ name = "small sapphire", chance = 1040 },
	{ name = "platinum coin", chance = 24000, maxCount = 3 },
	{ name = "experience scroll", chance = 150 }
}

mType:register(monster)





