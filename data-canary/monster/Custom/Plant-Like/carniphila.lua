local mType = Game.createMonsterType("carniphila")
local monster = {}

monster.name = "carniphila"
monster.description = "a carniphila"
monster.experience = 1500000
monster.outfit = {
	lookType = 120,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 2550
monster.maxHealth = 2550
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6047
monster.speed = 240
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
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
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 7},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 80, attack = 80, condition = {type = CONDITION_POISON, startDamage = 95, interval = 4000}},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -160, maxDamage = -190, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON},
	{name ="speed", interval = 1000, chance = 34, speed = {min = -850, max = -850}, duration = 30000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -830, radius = 3, target = false, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 10,
	armor = 26
}

monster.loot = {
	{ name = "gold coin", chance = 90000, maxCount = 40 },
	{ name = "corncob", chance = 890 },
	{ name = "dark mushroom", chance = 7692 },
	{ name = "sling herb", chance = 446, maxCount = 2 },
	{ name = "shadow herb", chance = 880 },
	{ name = "seeds", chance = 490 },
	{ name = "carniphila seeds", chance = 4166 },
	{ name = "carrot on a stick", chance = 1700 },
}

mType:register(monster)





