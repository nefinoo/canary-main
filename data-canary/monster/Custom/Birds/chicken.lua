local mType = Game.createMonsterType("chicken")
local monster = {}

monster.name = "chicken"
monster.description = "a chicken"
monster.experience = 1000000
monster.outfit = {
	lookType = 111,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15
monster.maxHealth = 15
monster.runHealth = 15
monster.race = "blood"
monster.corpse = 6042
monster.speed = 200
monster.summonCost = 220

monster.changeTarget = {
	interval = 500,
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
	{text = "cluck cluck", yell = false},
	{text = "gokgoooook", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = 0}
}

monster.defenses = {
	defense = 2,
	armor = 1
}

monster.loot = {
	{id = 3606, chance = 20000, maxCount = 4},
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "worm", chance = 50000, maxCount = 18},
	{name = "chicken feather", chance = 2500},
	{name = "enchanted chicken wing", chance = 100}
}

mType:register(monster)




