local mType = Game.createMonsterType("orc shaman")
local monster = {}

monster.name = "orc shaman"
monster.description = "a orc shaman"
monster.experience = 3500
monster.outfit = {
	lookType = 6,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 6
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Edron Orc Cave, Temple of Xayepocax, below Point of No Return in Outlaw Camp, Venore Orc Cave, \z
		Maze of Lost Souls, Orc Fort, north west of Thais, Elvenbane, Plains Of Havoc, Foreigner Quarter, Zao Orc Land.",
}


monster.health = 100
monster.maxHealth = 100
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5978
monster.speed = 80
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
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{text = "Huumans stinkk!", yell = false}
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
	{type = COMBAT_HOLYDAMAGE , percent = 25},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -2, maxDamage = -14 },
	{name ="combat", interval = 2000, chance = 45, type = COMBAT_ENERGYDAMAGE, minDamage = -4, maxDamage = -14, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -4, maxDamage = -12, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 3,
	armor = 2,
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_HEALING, minDamage = 5, maxDamage = 10, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 15 },
	{ name = "health potion", chance = 8000 },
	{ name = "mana potion", chance = 18000 },
	{ name = "corncob", chance = 35000, maxCount = 2 },
	{ name = "orc tooth", chance = 2100 },
	{ name = "broken shamanic staff", chance = 10300 },
	{ name = "shamanic hood", chance = 6860 },
	{ name = "orc leather", chance = 10300 },
}

mType:register(monster)





