local mType = Game.createMonsterType("Ghastly Dragon")
local monster = {}

monster.description = "a ghastly dragon"
monster.experience = 3750000
monster.outfit = {
	lookType = 351,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 643
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Ghastly Dragon Lair, Corruption Hole, Razachai including the Inner Sanctum, Zao Palace, Deeper Banuta single spawn, Chyllfroest.",
}

monster.health = 900000
monster.maxHealth = 900000
monster.race = "undead"
monster.corpse = 10445
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 366,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
}

monster.light = {
	level = 4,
	color = 119,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "EMBRACE MY GIFTS!", yell = true },
	{ text = "I WILL FEAST ON YOUR SOUL!", yell = true },
}

monster.loot = {
	{ name = "small emerald", chance = 41210, maxCount = 5 },
	{ name = "undead heart", chance = 21610 },
	{ name = "zaoan halberd", chance = 16580 },
	{ name = "demonic essence", chance = 10550 },
	{ name = "terra boots", chance = 10050 },
	{ name = "twin hooks", chance = 9550 },
	{ name = "ghastly dragon head", chance = 7540 },
	{ name = "soul orb", chance = 7040 },
	{ name = "terra legs", chance = 4520 },
	{ name = "jade hat", chance = 1010 },
	{ name = "zaoan armor", chance = 1010 },
	{ name = "guardian boots", chance = 1010 },
	{ name = "drakinata", chance = 1010 },
	{ name = "spellweaver's robe", chance = 500 },
	{ name = "zaoan shoes", chance = 980 },
	{ name = "zaoan legs", chance = 970 },
	{ name = "shiny stone", chance = 830 },
	{ name = "zaoan helmet", chance = 230 },
	{ name = "zaoan sword", chance = 120 },
	
	{name = "platinum coin", chance = 100000, maxCount = 30},
	{name = "platinum coin", chance = 100000, maxCount = 80},
	{name = "crystal coin", chance = 35000, maxCount = 2},
	{name = "experience scroll", chance = 3200, maxCount = 3},
	-- weapons lvl 1000
	{id = 7368, chance = 350},
	{id = 895, chance = 350}, 
	{id = 7390, chance = 350}, 
	{id = 7415, chance = 350},
	{id = 3303, chance = 350},
	-- weapons lvl 500	
	{id = 7366, chance = 450},
	{id = 7426, chance = 450}, 
	{id = 7420, chance = 450}, 
	{id = 3296, chance = 450},
	{id = 7437, chance = 450},
	-- weapons lvl 100
	{name = "magic sword", chance = 550},
	{ id = 3319, chance = 550 }, 
	{ id = 3309, chance = 550 }, 
	{id = 3341, chance = 550},
	{name = "throwing star", chance = 550},
	
	--demon green set
	{id = 37607, chance = 150},
	{id = 37608, chance = 150},
	{id = 37609, chance = 150},
	{id = 37610, chance = 150},
	{id = 7368, chance = 150},
	
	{name = "demon helmet", chance = 800},
	{name = "demon legs", chance = 800},
	{name = "demon shield", chance = 800},
	{id = 6529, chance = 800}, -- soft boots
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, minDamage = -11999, maxDamage = -20306 },
	{ name = "ghastly dragon curse", interval = 2000, chance = 5, range = 5, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -8653, maxDamage = -11249, range = 5, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -8653, maxDamage = -11249, range = 7, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "ghastly dragon wave", interval = 2000, chance = 10, minDamage = -120, maxDamage = -250, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -8653, maxDamage = -11249, radius = 4, effect = CONST_ME_MORTAREA, target = false },
	{ name = "speed", interval = 2000, chance = 20, speedChange = -800, range = 7, effect = CONST_ME_SMALLCLOUDS, target = true, duration = 30000 },
}

monster.defenses = {
	defense = 35,
	armor = 30,
	mitigation = 1.24,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
