local mType = Game.createMonsterType("Purple Death")
local monster = {}

monster.name = "Purple Death"
monster.description = "purple death"
monster.experience = 2500000
monster.outfit = {
	lookType = 241,
	lookHead = 20,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 700000
monster.maxHealth = 700000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6343
monster.speed = 325
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
	{text = "Oh my, you forgot to put your pants on!", yell = false},
	{text = "Weeheeheeheehee!", yell = false},
	{text = "Its nothing but a dream!", yell = false},
	{text = "Give in!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = -24},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -22},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -4000, maxDamage = -9500},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -1500, maxDamage = -3000, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="poisonfield", interval = 1000, chance = 17, range = 7, radius = 3, target = true, shootEffect = CONST_ANI_POISON},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -1000, maxDamage = -3000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 75, maxDamage = 125, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 2
monster.summons = {
	{name = "Purple Death Summon", chance = 20, interval = 3000, max = 2}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 100},
	{id = 3115, chance = 20000, description2 = "bone"},
	{name = "shadow herb", chance = 10000, maxCount = 2, description2 = "shadow herb"},
	{name = "blank rune", chance = 5000, description2 = "blank rune"},
	{name = "soul orb", chance = 1538, description2 = "soul orb"},
	{name = "small emerald", chance = 2500, maxCount = 3, description2 = "small emerald"},
}

mType:register(monster)




