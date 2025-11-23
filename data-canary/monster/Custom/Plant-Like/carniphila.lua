local mType = Game.createMonsterType("carniphila")
local monster = {}

monster.name = "carniphila"
monster.description = "a carniphila"
monster.experience = 150
monster.outfit = {
	lookType = 120,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 255
monster.maxHealth = 255
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
	{name ="melee", interval = 2000, chance = 100, skill = 40, attack = 40, condition = {type = CONDITION_POISON, startDamage = 95, interval = 4000}},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -60, maxDamage = -90, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON},
	{name ="speed", interval = 1000, chance = 34, speed = {min = -850, max = -850}, duration = 30000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -40, maxDamage = -130, radius = 3, target = false, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 10,
	armor = 26
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "meat", chance = 33333, maxCount = 5},
	{name = "ham", chance = 20000, maxCount = 4},
	{name = "brass armor", chance = 5000},
	{name = "iron helmet", chance = 4000},
	{name = "red robe", chance = 500},
	{name = "worm", chance = 50000, maxCount = 10}
}

mType:register(monster)



