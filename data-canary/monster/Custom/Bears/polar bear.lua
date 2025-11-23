local mType = Game.createMonsterType("polar bear")
local monster = {}

monster.name = "polar bear"
monster.description = "a polar bear"
monster.experience = 28
monster.outfit = {
	lookType = 42,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 85
monster.maxHealth = 85
monster.runHealth = 5
monster.race = "blood"
monster.corpse = 5987
monster.speed = 156
monster.summonCost = 315

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
	{text = "Grrrrrr", yell = false},
	{text = "GROARRR!", yell = true}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -3},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 7},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 19, attack = 18}
}

monster.defenses = {
	defense = 10,
	armor = 7
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "ham", chance = 90000, maxCount = 4},
	{name = "meat", chance = 80000, maxCount = 3}
}

mType:register(monster)



