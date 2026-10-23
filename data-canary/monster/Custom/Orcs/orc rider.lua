local mType = Game.createMonsterType("orc rider")
local monster = {}

monster.name = "orc rider"
monster.description = "a orc rider"
monster.experience = 180000
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


monster.health = 180
monster.maxHealth = 180
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6010
monster.speed = 340
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
	{name ="melee", interval = 2000, chance = 100, skill = 20, attack = 20}
}

monster.defenses = {
	defense = 20,
	armor = 9,
	{name ="speed", interval = 1000, chance = 7, speed = {min = 900, max = 900}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "obsidian lance", chance = 2000},
	{name = "orcish axe", chance = 2500},
	{name = "battle shield", chance = 6666},
	{name = "gold coin", chance = 20000},
	{id = 3012, chance = 10000},
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "meat", chance = 50000, maxCount = 3},
	{id = 12413, chance = 2000},
}

mType:register(monster)





