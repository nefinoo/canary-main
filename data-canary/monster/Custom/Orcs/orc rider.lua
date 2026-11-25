local mType = Game.createMonsterType("orc rider")
local monster = {}

monster.name = "orc rider"
monster.description = "a orc rider"
monster.experience = 3600
monster.outfit = {
	lookType = 4,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 4
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Orc Fort, Orc Peninsula, near Dark Cathedral, Zao Orc Land.",
}


monster.health = 115
monster.maxHealth = 115
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6010
monster.speed = 90
monster.summonCost = 0

monster.changeTarget = {
	interval = 200,
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
	{text = "Grrrrrrr", yell = false},
	{text = "Orc arga Huummmak!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -6, maxDamage = -30 },
}

monster.defenses = {
	defense = 5,
	armor = 3,
	{name ="speed", interval = 4000, chance = 10, speed = {min = 35, max = 35}, duration = 2000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 16 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 12000 },
	{ name = "meat", chance = 40000, maxCount = 2 },
	{ name = "orc tooth", chance = 2000 },
	{ name = "warwolf fur", chance = 9410 },
	{ name = "orc leather", chance = 9760 },
}

mType:register(monster)





