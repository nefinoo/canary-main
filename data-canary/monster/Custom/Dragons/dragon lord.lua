local mType = Game.createMonsterType("dragon lord")
local monster = {}

monster.name = "dragon lord"
monster.description = "a dragon lord"
monster.experience = 2250000
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


monster.health = 2450
monster.maxHealth = 2450
monster.runHealth = 300
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -287, maxDamage = -374},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_FIREDAMAGE, minDamage = -287, maxDamage = -374, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 15, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_FIREDAMAGE, minDamage = -287, maxDamage = -374, length = 8, spread = 3, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 57, maxDamage = 93, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 30},
	{name = "dragon ham", chance = 20000, maxCount = 2},
	{name = "royal helmet", chance = 588},
	{name = "green mushroom", chance = 6666},
	{name = "red dragon leather", chance = 5000},
	{name = "gold coin", chance = 100000, maxCount = 25},
	{name = "small emerald", chance = 833, maxCount = 2},
	{name = "fire sword", chance = 1428},
	{name = "small sapphire", chance = 2222, maxCount = 2},
	{name = "tower shield", chance = 533},
	{name = "dragon slayer", chance = 333},
	{name = "dragon scale mail", chance = 900},
	{name = "dragon lance", chance = 409},
	{name = "red dragon scale", chance = 5000},
	{id = 12413, chance = 4000},
	{id = 3399, chance = 100},
	{id = 8095, chance = 100},
	{id = 3408, chance = 100},
}

mType:register(monster)





