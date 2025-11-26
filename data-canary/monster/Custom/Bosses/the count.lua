local mType = Game.createMonsterType("the count")
local monster = {}

monster.name = "the count"
monster.description = "the count"
monster.experience = 1750
monster.outfit = {
	lookType = 287,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4600
monster.maxHealth = 4600
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 8937
monster.speed = 370
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 10
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 130, attack = 135},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -300, radius = 4, target = false, effect = CONST_ME_SMALLCLOUDS}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 100, maxDamage = 195, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 3000, chance = 30, duration = 6000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 1
monster.summons = {
	{name = "banshee", chance = 50, interval = 4000, max = 1}
}

monster.loot = {
	{name = "gold coin", chance = 40000, maxCount = 98},
	{id = 7924, chance = 100000},
	{name = "war hammer", chance = 2300}
}

mType:register(monster)




