local mType = Game.createMonsterType("water elemental")
local monster = {}

monster.name = "water elemental"
monster.description = "a water elemental"
monster.experience = 36000000
monster.outfit = {
	lookType = 286,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 12000
monster.maxHealth = 12000
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -749, maxDamage = -974, condition = { type = CONDITION_POISON, totalDamage = 1200, interval = 4000 } },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_DROWNDAMAGE, minDamage = -380, maxDamage = -700, range = 7, radius = 2, effect = CONST_ME_LOSEENERGY, target = true },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -380, maxDamage = -700, range = 7, shootEffect = CONST_ANI_SMALLICE, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 35, minDamage = -380, maxDamage = -700, radius = 5, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 22,
	armor = 20,
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 1500, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "experience scroll", chance = 7500},
	{id = 3578, chance = 57430, maxCount = 20},--fish
	{name = "salmon", chance = 39430, maxCount = 10},
	{id = 3581, chance = 8000, maxCount = 2},
	{name = "small diamond", chance = 75000, maxCount = 3},
	{name = "gold coin", chance = 100000, maxCount = 90},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "platinum coin", chance = 64000, maxCount = 12},
	{name = "platinum coin", chance = 44000, maxCount = 15},
}

mType:register(monster)





