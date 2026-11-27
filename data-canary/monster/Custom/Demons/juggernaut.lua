local mType = Game.createMonsterType("juggernaut")
local monster = {}

monster.name = "juggernaut"
monster.description = "a juggernaut"
monster.experience = 625000
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


monster.health = 2650
monster.maxHealth = 2650
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6336
monster.speed = 280
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = -15},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -42, maxDamage = -135},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -25, maxDamage = -115, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK}
}

monster.defenses = {
	defense = 15,
	armor = 20,
	{ name = "speed", interval = 1000, chance = 12, speed = { min = 480, max = 480 }, duration = 4000, effect = CONST_ME_MAGIC_RED },
}

monster.loot = {
	{ name = "experience scroll", chance = 65 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	-- Oro y consumibles nivel 69
	{ name = "gold coin", chance = 90000, maxCount = 95 },
	{ name = "meat", chance = 45000, maxCount = 3 },
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 4500 },
	{ name = "strong mana potion", chance = 5000 },
	-- Materiales de addon originales
	{ name = "dirty fur", chance = 10000 },
	{ name = "demonic essence", chance = 1429 },
	{ name = "soul orb", chance = 1333 },
	{ id = 12413, chance = 11500 },
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
	-- Armas nivel 30
	{ id = 3347, chance = 4200 }, -- hunting spear
	-- Armas nivel 50
	{ id = 7378, chance = 3200 }, -- royal spear
}

mType:register(monster)





