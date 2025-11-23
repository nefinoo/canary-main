local mType = Game.createMonsterType("Deathwalker")
local monster = {}

monster.name = "Deathwalker"
monster.description = "a deathwalker"
monster.experience = 20000000
monster.outfit = {
	lookType = 232,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6000000
monster.maxHealth = 6000000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6310
monster.speed = 500
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 100
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
	interval = 2000,
	chance = 100,
	{text = "Blaalblala blaaaa", yell = true},
	{text = "Blaalblala blaaaa", yell = true}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -1000, maxDamage = -4000},
	{name ="combat", interval = 1000, chance = 60, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -2000, radius = 4, target = false, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -1200, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS}
}

monster.defenses = {
	defense = 50,
	armor = 60,
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_HEALING, minDamage = 9000, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
}

mType:register(monster)



