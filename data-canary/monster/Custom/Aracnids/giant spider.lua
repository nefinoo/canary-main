local mType = Game.createMonsterType("giant spider")
local monster = {}

monster.name = "giant spider"
monster.description = "a giant spider"
monster.experience = 1700000
monster.outfit = {
	lookType = 38,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 38
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Plains of Havoc, Point of no Return in Outlaw Camp, Ghostlands, Hellgate, \z
	Mintwallin Secret Laboratory, Mad Mage Room deep below Ancient Temple, Mount Sternum Undead Cave, \z
	Green Claw Swamp, Maze of Lost Souls, Crusader Helmet Quest in the Dwarf Mines, Mushroom Gardens, \z
	west Drillworm Caves, Edron Hero Cave, Edron Orc Cave, on a hill near Drefia, \z
	on a hill north-west of Ankrahmun (inaccessible), Forbidden Lands, Deeper Banuta, Malada, Ramoa, \z
	 Arena and Zoo Quarter, second floor up of Cemetery Quarter, beneath Fenrock, Vengoth Castle, \z
	 Vandura Mountain, in a cave in Robson Isle, Chyllfroest, Spider Caves, second floor of Krailos Spider Lair, Caverna Exanima.",
}


monster.health = 1720
monster.maxHealth = 1720
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5977
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
	canWalkOnPoison = true
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
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -30},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -201, maxDamage = -261},
	{name ="poisonfield", interval = 1000, chance = 17, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="speed", interval = 1000, chance = 6, speed = {min = 310, max = 310}, duration = 20000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 2
monster.summons = {
	{name = "poison spider", chance = 30, interval = 1000, max = 2}
}

monster.loot = {
	-- {id = 3053, chance = 700},
	{name = "gold coin", chance = 100000, maxCount = 50},
	{name = "plate armor", chance = 4000},
	{name = "platinum amulet", chance = 2000},
	{id = 5879, chance = 5000},
	{name = "gold coin", chance = 100000, maxCount = 40},
	{name = "steel helmet", chance = 5000},
	{name = "knight armor", chance = 2000},
	{name = "knight legs", chance = 1800},
	{id = 12413, chance = 4000},
	{id = 3399, chance = 100},
	{id = 8095, chance = 100},
	{id = 3408, chance = 100},
}

mType:register(monster)





