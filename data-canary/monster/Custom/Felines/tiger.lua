local mType = Game.createMonsterType("tiger")
local monster = {}

monster.name = "tiger"
monster.description = "a tiger"
monster.experience = 40
monster.outfit = {
	lookType = 125,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75
monster.maxHealth = 75
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6051
monster.speed = 240
monster.summonCost = 420

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	{type = COMBAT_ICEDAMAGE, percent = -8},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, skill = 42, attack = 15}
}

monster.defenses = {
	defense = 15,
	armor = 5,
	{name ="speed", interval = 1000, chance = 12, speed = {min = 567, max = 567}, duration = 3000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "ham", chance = 33333, maxCount = 2},
	{name = "meat", chance = 33333, maxCount = 3},
	{name = "worm", chance = 50000, maxCount = 10}
}

mType:register(monster)




