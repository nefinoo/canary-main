local mType = Game.createMonsterType("Barbarian Headsplitter")
local monster = {}

monster.name = "Barbarian Headsplitter"
monster.description = "a Headsplitter"
monster.experience = 85000
monster.outfit = {
	lookType = 253,
	lookHead = 115,
	lookBody = 105,
	lookLegs = 119,
	lookFeet = 132,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 100
monster.maxHealth = 100
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
	{text = "I will regain my honor with your blood!", yell = false},
	{text = "Surrender is not option!", yell = false},
	{text = "Its you or me!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -50, maxDamage = -150},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -10, maxDamage = -60, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_INFERNALBOLT}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.loot = {
	{name = "gold coin", chance = 33333, maxCount = 30},
	{id = 2992, chance = 10000, maxCount = 6},
	{name = "viking helmet", chance = 10000},
	{name = "fur boots", chance = 10000},
	{name = "brass helmet", chance = 10000},
	{name = "knife", chance = 10000},
	{name = "viking helmet", chance = 10000},
	{name = "brown piece of cloth", chance = 10000},
	{id = 2920, chance = 10000},
	{name = "crystal sword", chance = 10000},
	{id = 3355, chance = 1000},
	{id = 3114, chance = 10000}
}

mType:register(monster)





