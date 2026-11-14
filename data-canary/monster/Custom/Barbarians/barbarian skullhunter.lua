local mType = Game.createMonsterType("Barbarian Skullhunter")
local monster = {}

monster.name = "Barbarian Skullhunter"
monster.description = "a Skullhunter"
monster.experience = 85000
monster.outfit = {
	lookType = 254,
	lookHead = 0,
	lookBody = 77,
	lookLegs = 77,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 135
monster.maxHealth = 135
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 270
monster.summonCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
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
	staticAttackChance = 70,
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
	interval = 2000,
	chance = 5,
	{text = "You will become my trophy.", yell = false},
	{text = "Fight harder, coward.", yell = false},
	{text = "Show that you are a worthy opponent.", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 4},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -13},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -7}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -30, maxDamage = -80}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.loot = {
	{name = "gold coin", chance = 33333, maxCount = 30},
	{name = "knife", chance = 10000},
	{name = "brass helmet", chance = 10000},
	{id = 2920, chance = 10000},
	{id = 3052, chance = 333},
	{name = "ragnir helmet", chance = 900},
	{name = "crystal sword", chance = 100}
}

mType:register(monster)





