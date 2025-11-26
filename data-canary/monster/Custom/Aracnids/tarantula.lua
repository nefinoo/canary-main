local mType = Game.createMonsterType("tarantula")
local monster = {}

monster.name = "tarantula"
monster.description = "a tarantula"
monster.experience = 310
monster.outfit = {
	lookType = 219,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 225
monster.maxHealth = 225
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6060
monster.speed = 280
monster.summonCost = 485

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
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 40, attack = 38, condition = {type = CONDITION_POISON, startDamage = 30, interval = 4000}},
	{name ="poisonfield", interval = 1000, chance = 20, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 17,
	armor = 15,
	{name ="speed", interval = 1000, chance = 13, speed = {min = 334, max = 334}, duration = 5000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "gold coin", chance = 100000, maxCount = 25},
	{name = "brass legs", chance = 20000},
	{name = "plate armor", chance = 2500},
	{name = "knight armor", chance = 100},
	{name = "worm", chance = 50000, maxCount = 10}
}

mType:register(monster)




