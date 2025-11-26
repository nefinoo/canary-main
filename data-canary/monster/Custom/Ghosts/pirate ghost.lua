local mType = Game.createMonsterType("pirate ghost")
local monster = {}

monster.name = "pirate ghost"
monster.description = "a pirate ghost"
monster.experience = 250
monster.outfit = {
	lookType = 196,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 275
monster.maxHealth = 275
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6071
monster.speed = 230
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
	pushable = true,
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
	{text = "Yooh Ho Hooh Ho!", yell = false},
	{text = "Hell is waiting for You!", yell = false},
	{text = "It's alive!", yell = false},
	{text = "The curse! Aww the curse!", yell = false},
	{text = "You will not get my treasure!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -50},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -95, condition = {type = CONDITION_POISON, startDamage = 1, interval = 4000}},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -30, maxDamage = -78, radius = 1, target = false, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -1, maxDamage = -65, range = 7, radius = 2, target = true, effect = CONST_ME_SOUND_RED}
}

monster.defenses = {
	defense = 25,
	armor = 20,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 40, maxDamage = 70, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 52000, maxCount = 45},
	{name = "red robe", chance = 666},
	{name = "dirty cape", chance = 6666},
	{id = 3121, chance = 4000},
	{id = 3049, chance = 666},
	{name = "spike sword", chance = 800},
	{id = 2814, chance = 1000},
	{name = "bandana", chance = 916}
}

mType:register(monster)




