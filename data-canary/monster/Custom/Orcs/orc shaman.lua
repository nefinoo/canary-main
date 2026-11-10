local mType = Game.createMonsterType("orc shaman")
local monster = {}

monster.name = "orc shaman"
monster.description = "a orc shaman"
monster.experience = 3000
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


monster.health = 125
monster.maxHealth = 125
monster.runHealth = 15
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
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = -5},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 25},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 20, attack = 13},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_ENERGYDAMAGE, minDamage = -3, maxDamage = -16, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_FIREDAMAGE, minDamage = -3, maxDamage = -18, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 10,
	armor = 8,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 27, maxDamage = 43, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 4
monster.summons = {
	{name = "snake", chance = 25, interval = 1000, max = 4}
}

monster.loot = {
	{ name = "plate armor", chance = 100 }, -- Frozen Hell stage Orc equipment
	{ name = "plate legs", chance = 100 }, -- Frozen Hell stage Orc equipment
	{ name = "steel helmet", chance = 100 }, -- Frozen Hell stage Orc equipment
	{ name = "bonelord shield", chance = 100 }, -- Frozen Hell stage Orc equipment
	{ id = 12413, chance = 500 }, -- bolsa de items de addon aleatorios (0.500%)
	{ name = "gold coin", chance = 80000, maxCount = 9 },
	{ name = "meat", chance = 25000, maxCount = 2 },
	{ name = "health potion", chance = 1000 },
	{ name = "mana potion", chance = 1800 },
}

mType:register(monster)





