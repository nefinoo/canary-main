local mType = Game.createMonsterType("dragon lord")
local monster = {}

monster.name = "dragon lord"
monster.description = "a dragon lord"
monster.experience = 1000000
monster.outfit = {
	lookType = 39,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 39
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Ankrahmun Dragon Lairs, Banshee Quest final room (level 60+ to open the door), \z
	Deeper Cyclopolis past the Dragon Spawn (level 30+ to open the door), Draconia, Edron Dragon Lair, \z
	Fibula Dungeon (level 50+ to open the door), Maze of Lost Souls (level 30+ to open the door), \z
	Pits of Inferno Dragon Lair, Dragon Lord hole in Plains of Havoc, Carlin Dragon Lair, \z
	Thais Dragon Lair, Goroma Dragon Lairs, Hot Spot, Venore Dragon Lair, Arena and Zoo Quarter(Yalahar), \z
	beneath Fenrock, Darashia Dragon Lair, Razachai, Dragonblaze Peaks, Ferumbras Citadel, Fury Dungeon, \z
	Lower Spike, Krailos Steppe.",
}


monster.health = 4400
monster.maxHealth = 4400
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5984
monster.speed = 240
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
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "ZCHHHHH", yell = true},
	{text = "YOU WILL BURN!", yell = true}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -48, maxDamage = -155 },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -135, range = 5, radius = 2, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA },
	{ name = "combat", interval = 3000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -45, maxDamage = -120, length = 5, spread = 2, effect = CONST_ME_FIREAREA },
}

monster.defenses = {
	defense = 29,
	armor = 19,
	{ name = "combat", interval = 5000, chance = 20, type = COMBAT_HEALING, minDamage = 65, maxDamage = 110, effect = CONST_ME_MAGIC_BLUE },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 44 },
	{ name = "health potion", chance = 16000 },
	{ name = "mana potion", chance = 16000 },
	{ name = "strong health potion", chance = 28000 },
	{ name = "strong mana potion", chance = 28000 },
	{ name = "great health potion", chance = 10000 },
	{ name = "great mana potion", chance = 10000 },
	{ name = "great spirit potion", chance = 7000 },
	{ name = "dragon ham", chance = 60000, maxCount = 2 },
	{ name = "red dragon leather", chance = 5000 },
	{ name = "red dragon scale", chance = 5000 },
	{ id = 3573, chance = 1050 }, -- Set 3: Mage
	{ id = 3567, chance = 700 }, -- Set 3: Mage
	{ id = 645, chance = 850 }, -- Set 3: Mage
	{ id = 8075, chance = 950 }, -- Set 3: Mage
	{ id = 32619, chance = 700 }, -- Set 3: Mage boots
}

mType:register(monster)





