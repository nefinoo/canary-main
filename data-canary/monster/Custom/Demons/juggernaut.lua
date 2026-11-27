local mType = Game.createMonsterType("juggernaut")
local monster = {}

monster.name = "juggernaut"
monster.description = "a juggernaut"
monster.experience = 1650000
monster.outfit = {
	lookType = 244,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 296
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Deep in Pits of Inferno (Apocalypse's throne room), The Dark Path, The Blood Halls, \z
	The Vats, The Hive, The Shadow Nexus, a room deep in Formorgar Mines, Roshamuul Prison, \z
	Oramond Dungeon, Grounds of Destruction and Halls of Ascension.",
}


monster.health = 4800
monster.maxHealth = 4800
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6336
monster.speed = 270
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
	{text = "WAHHHH!", yell = false},
	{text = "RAAARRR!", yell = false},
	{text = "GRRRRRR!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -90, maxDamage = -230},
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -150, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK}
}

monster.defenses = {
	defense = 22,
	armor = 19,
	{ name = "speed", interval = 4000, chance = 20, speed = { min = 100, max = 100 }, duration = 5000, effect = CONST_ME_MAGIC_RED },
}

monster.loot = {
	{ name = "experience scroll", chance = 78 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	-- Oro y consumibles: transicion nivel 100-200
	{ name = "gold coin", chance = 90000, maxCount = 155 },
	{ name = "meat", chance = 45000, maxCount = 3 },
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 6000 },
	{ name = "strong mana potion", chance = 6000 },
	{ name = "great health potion", chance = 2000 },
	{ name = "great mana potion", chance = 2000 },
	{ name = "great spirit potion", chance = 1000 },
	-- Materiales de addon originales
	{ name = "dirty fur", chance = 10000 },
	{ name = "demonic essence", chance = 1429 },
	{ name = "soul orb", chance = 1333 },
	{ id = 12413, chance = 12500 },
	-- Set inicial por vocacion
	{ id = 3404, chance = 7000 },
	{ id = 3560, chance = 6720 },
	{ id = 3403, chance = 7490 },
	{ id = 9017, chance = 6720 },
	-- Set 2: Paladin
	{ id = 3381, chance = 2750 },
	{ id = 3382, chance = 2585 },
	{ id = 3385, chance = 2007 },
	{ id = 3419, chance = 1898 },
	-- Botas de progresion por set
	{ id = 21981, chance = 1182 }, -- Set 2 boots
	-- Escudos de progresion y Set 3: nivel 100
	{ id = 3428, chance = 7000 },
	{ id = 10385, chance = 1150 },
	{ id = 10384, chance = 850 },
	{ id = 10387, chance = 1000 },
	{ id = 10386, chance = 1250 },
	{ id = 14088, chance = 1000 },
	-- Armas nivel 30
	{ id = 3347, chance = 4200 }, -- hunting spear
	-- Armas nivel 50
	{ id = 7378, chance = 3200 }, -- royal spear
}

mType:register(monster)





