local mType = Game.createMonsterType("quara pincher")
local monster = {}

monster.name = "quara pincher"
monster.description = "a quara pincher"
monster.experience = 85000
monster.outfit = {
	lookType = 77,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 45000
monster.maxHealth = 45000
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
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -3000, maxDamage = -6500, range = 1, radius = 1, target = true},
	{name ="speed", interval = 1000, chance = 30, speed = {min = -850, max = -850}, duration = 4000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 25,
	armor = 18
}

monster.loot = {
	{name = "salmon", chance = 2000},
	{name = "northern pike", chance = 2000},
	{name = "worm", chance = 5000, maxCount = 25},
	{name = "fish fin", chance = 2000},
	{name = "rainbow trout", chance = 2000},
	{name = "green perch", chance = 2000},
	{name = "platinum coin", chance = 100000, maxCount = 60},
	{name = "platinum coin", chance = 70000, maxCount = 100},
	{name = "experience scroll", chance = 3000, maxCount = 2},
	{id = 893, chance = 5}
}

mType:register(monster)




