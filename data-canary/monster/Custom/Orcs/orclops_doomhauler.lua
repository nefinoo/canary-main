local mType = Game.createMonsterType("Orclops Doomhauler")
local monster = {}

monster.description = "an orclops doomhauler"
monster.experience = 15000
monster.outfit = {
	lookType = 934,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 1314
monster.Bestiary = {
	class = "Giant",
	race = BESTY_RACE_GIANT,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Desecrated Glade, Edron Orc Cave",
}


monster.health = 1100
monster.maxHealth = 1100
monster.race = "blood"
monster.corpse = 25078
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Me mash!", yell = false },
	{ text = "GRRRRR!", yell = true },
	{ text = "Muhahaha!", yell = false },
	{ text = "Me strong, you weak!", yell = false },
}

monster.loot = {
	{ id = 12413, chance = 2000 }, -- bolsa de items de addon aleatorios (2.000%)
	{ name = "gold coin", chance = 100000, maxCount = 150 },
	{ name = "ham", chance = 45000, maxCount = 3 },
	{ name = "health potion", chance = 3500 },
	{ name = "mana potion", chance = 3000 },
	{ name = "plate armor", chance = 500 }, -- Frozen Hell: 0.500%
	{ name = "plate legs", chance = 500 }, -- Frozen Hell: 0.500%
	{ name = "steel helmet", chance = 500 }, -- Frozen Hell: 0.500%
	{ name = "bonelord shield", chance = 500 }, -- Frozen Hell: 0.500%
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -5, maxDamage = -56 },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -4, maxDamage = -28, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = true },
	-- curse
	{ name = "condition", type = CONDITION_CURSED, interval = 2000, chance = 5, minDamage = -1, maxDamage = -3, radius = 4, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_EXPLOSIONAREA, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 35,
	mitigation = 1.32,
	{ name = "speed", interval = 2000, chance = 10, speedChange = 336, effect = CONST_ME_MAGIC_RED, target = false, duration = 2000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 30 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

