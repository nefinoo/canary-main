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
	-- Plate Set: progresion mejorada
	{ name = "plate armor", chance = 7200 },
	{ name = "plate legs", chance = 7200 },
	{ name = "steel helmet", chance = 7600 },
	{ name = "bonelord shield", chance = 7200 },
	-- Knight Set
	{ name = "knight armor", chance = 2730 },
	{ name = "knight legs", chance = 2470 },
	{ name = "knight axe", chance = 2000 },
	{ name = "devil helmet", chance = 1780 },
	{ name = "tower shield", chance = 1600 },
	-- Crown Set: muy raro
	{ name = "crown armor", chance = 260 },
	{ name = "crown legs", chance = 260 },
	{ name = "crown helmet", chance = 340 },
	{ name = "crown shield", chance = 250 },
	{ id = 3055, chance = 2100 }, -- Platinum Amulet (Crown Set)
	-- Fire Sword / Fire Axe / Dragonbone Staff: armas raras
	{ name = "fire sword", chance = 1200 },
	{ name = "fire axe", chance = 950 },
	{ name = "dragonbone staff", chance = 1200 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1280 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 250 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





