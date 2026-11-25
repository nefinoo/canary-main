local mType = Game.createMonsterType("giant spider")
local monster = {}

monster.name = "giant spider"
monster.description = "a giant spider"
monster.experience = 850000
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


monster.health = 3400
monster.maxHealth = 3400
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -42, maxDamage = -132 },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_EARTHDAMAGE, minDamage = -35, maxDamage = -95, range = 5, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA },
}

monster.defenses = {
	defense = 25,
	armor = 16,
	{ name = "speed", interval = 6000, chance = 10, speed = {min = 50, max = 50}, duration = 3000, effect = CONST_ME_MAGIC_RED },
}

monster.maxSummons = 0
monster.summons = {}
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 36 },
	{ name = "health potion", chance = 16000 },
	{ name = "mana potion", chance = 16000 },
	{ name = "strong health potion", chance = 24000 },
	{ name = "strong mana potion", chance = 24000 },
	{ name = "great health potion", chance = 8000 },
	{ name = "great mana potion", chance = 8000 },
	{ name = "great spirit potion", chance = 5000 },
	{ name = "meat", chance = 45000, maxCount = 3 },
	{ name = "ham", chance = 35000, maxCount = 2 },
	{ name = "spider silk", chance = 10000 },
}

mType:register(monster)





