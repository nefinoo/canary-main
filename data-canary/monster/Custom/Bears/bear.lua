local mType = Game.createMonsterType("bear")
local monster = {}

monster.name = "bear"
monster.description = "a bear"
monster.experience = 23000
monster.outfit = {
	lookType = 16,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 80
monster.maxHealth = 80
monster.runHealth = 15
monster.race = "blood"
monster.corpse = 5975
monster.speed = 176
monster.summonCost = 300

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
	{text = "grrrr", yell = false},
	{text = "groar", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 7},
	{type = COMBAT_DEATHDAMAGE , percent = -4}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 15, attack = 17}
}

monster.defenses = {
	defense = 6,
	armor = 6
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "ham", chance = 90000, maxCount = 4},
	{name = "honeycomb", chance = 5000},
	{name = "bear paw", chance = 5000}
}

mType:register(monster)





