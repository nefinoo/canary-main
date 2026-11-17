local mType = Game.createMonsterType("nightwish")
local monster = {}

monster.name = "nightwish"
monster.description = "nightwish"
monster.experience = 16000000000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 78,
	lookLegs = 15,
	lookFeet = 81,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 20000000
monster.maxHealth = 10000000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6068
monster.speed = 340
monster.summonCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 8
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
	staticAttackChance = 85,
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
	{text = "Annihilation!", yell = true}
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
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -18000, maxDamage = -25000},
	{name ="combat", interval = 1500, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -10000, maxDamage = -15000, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -8600, maxDamage = -12500, radius = 4, target = true, effect = CONST_ME_YELLOW_RINGS},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -8600, maxDamage = -12500, radius = 3, target = false, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 55,
	armor = 60,
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 20000, effect = CONST_ME_MAGIC_GREEN},
	{name ="speed", interval = 1000, chance = 4, speed = {min = 500, max = 500}, duration = 5000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 7889, chance = 100000}
}

mType:register(monster)





