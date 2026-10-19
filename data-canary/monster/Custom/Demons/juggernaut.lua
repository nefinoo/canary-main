local mType = Game.createMonsterType("juggernaut")
local monster = {}

monster.name = "juggernaut"
monster.description = "a juggernaut"
monster.experience = 4000000
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


monster.health = 6000
monster.maxHealth = 6000
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -288, maxDamage = -800},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -288, maxDamage = -375, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="speed", interval = 1000, chance = 12, speed = {min = 480, max = 480}, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 80},
	{name = "meat", chance = 20000, maxCount = 8},
	{name = "dragon ham", chance = 10000, maxCount = 3},
	{name = "dirty fur", chance = 10000},
	{name = "heavy mace", chance = 444},
	{name = "demonic essence", chance = 1429},
	{name = "soul orb", chance = 1333},
	{name = "dragon hammer", chance = 867},
	{name = "golden armor", chance = 433},
	{name = "golden legs", chance = 350},
	{name = "spiked squelcher", chance = 1100},
	{name = "mastermind shield", chance = 500},
	{name = "giant sword", chance = 1028},
	{name = "platinum coin", chance = 100000, maxCount = 8},
	{name = "platinum coin", chance = 70000, maxCount = 18},
	{id = 12413, chance = 8000},
	{id = 3399, chance = 175},
	{id = 8095, chance = 175},
	{id = 3408, chance = 175},
}

mType:register(monster)





