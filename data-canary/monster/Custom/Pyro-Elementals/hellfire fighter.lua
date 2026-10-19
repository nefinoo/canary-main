local mType = Game.createMonsterType("hellfire fighter")
local monster = {}

monster.name = "hellfire fighter"
monster.description = "a hellfire fighter"
monster.experience = 5000000
monster.outfit = {
	lookType = 243,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 295
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Pits of Inferno, Demon Forge, Fury Dungeon.",
}


monster.health = 8000
monster.maxHealth = 8000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6324
monster.speed = 260
monster.summonCost = 0

monster.changeTarget = {
	interval = 30,
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
	canWalkOnFire = true,
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
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -288, maxDamage = -420},
	{name ="firefield", interval = 3000, chance = 30, range = 7, radius = 4, target = false, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -288, maxDamage = -375, range = 5, radius = 1, target = true, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="melee", interval = 1000, chance = 25, minDamage = -288, maxDamage = -375}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.loot = {
	{name = "small diamond", chance = 15000},
	{name = "blank rune", chance = 13500},
	{id = 3264, chance = 12500},
	{name = "fire sword", chance = 3550},
	{name = "fire axe", chance = 700},
	{name = "demonbone amulet", chance = 1666},
	{name = "small ruby", chance = 8888, maxCount = 4},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "wand of inferno", chance = 3111},
	{name = "burnt scroll", chance = 20000},
	{name = "soul orb", chance = 2222},
	{name = "magma coat", chance = 500},
	{id = 12413, chance = 7000},
	{id = 3399, chance = 165},
	{id = 8095, chance = 165},
	{id = 3408, chance = 165},
}

mType:register(monster)





