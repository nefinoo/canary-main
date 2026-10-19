local mType = Game.createMonsterType("Fallen Angel")
local monster = {}

monster.name = "Fallen Angel"
monster.description = "the fallen angel."
monster.experience = 2000000000
monster.outfit = {
	lookType = 235,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10000000
monster.maxHealth = 10000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6348
monster.speed = 420
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 25
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
	staticAttackChance = 1,
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
	interval = 2200,
	chance = 50,
	{text = "Fear me!", yell = true},
	{text = "I will bring you down with me!", yell = true},
	{text = "You are forsaken!", yell = true}
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
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.attacks = {
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -15000, maxDamage = -20789, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 45,
	armor = 10,
	{name ="combat", interval = 1500, chance = 68, type = COMBAT_HEALING, minDamage = 20000, maxDamage = 25000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "worm", chance = 1, maxCount = 86}
}

mType:register(monster)





