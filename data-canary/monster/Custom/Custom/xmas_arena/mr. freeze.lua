local mType = Game.createMonsterType("mr. freeze")
local monster = {}

monster.name = "mr. freeze"
monster.description = "mr. freeze"
monster.experience = 9000000000
monster.outfit = {
	lookType = 248,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4000000
monster.maxHealth = 4000000
monster.runHealth = 250
monster.race = "undead"
monster.corpse = 0
monster.speed = 560
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 6
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
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
	interval = 5000,
	chance = 10,
	{text = "YOU WILL FREEZE!", yell = true},
	{text = "ZCHHHHH!", yell = true},
	{text = "I am so cool", yell = true},
	{text = "Chill out!.", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = -25},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -10000, maxDamage = -20000},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -8000, maxDamage = -18000, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_HITAREA},
	{name ="combat", interval = 1500, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -2600, length = 7, spread = 3, effect = CONST_ME_POFF},
	{name ="melee", interval = 2000, chance = 19, minDamage = -1000, maxDamage = -7000},
	{name ="paralyze", interval = 5000, chance = 30, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 25000, maxDamage = 50000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
}

mType:register(monster)





