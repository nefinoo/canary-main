local mType = Game.createMonsterType("blood crab")
local monster = {}

monster.name = "blood crab"
monster.description = "a blood crab"
monster.experience = 46500000
monster.outfit = {
	lookType = 200,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 18000
monster.maxHealth = 18000
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
	{name ="melee", interval = 1000, chance = 100, minDamage = -1350, maxDamage = -1600}
}

monster.defenses = {
	defense = 15,
	armor = 10
}

monster.loot = {
	{name = "experience scroll", chance = 10000},
	{id = 3578, chance = 60430, maxCount = 20},--fish
	{name = "salmon", chance = 42430, maxCount = 10},
	{id = 3581, chance = 10000, maxCount = 2},
	{name = "small diamond", chance = 75000, maxCount = 3},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "platinum coin", chance = 64000, maxCount = 15},
	{name = "platinum coin", chance = 44000, maxCount = 15},
}

mType:register(monster)





