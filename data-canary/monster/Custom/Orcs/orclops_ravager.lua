local mType = Game.createMonsterType("Orclops Ravager")
local monster = {}

monster.description = "an orclops ravager"
monster.experience = 10000
monster.outfit = {
	lookType = 935,
	lookHead = 94,
	lookBody = 1,
	lookLegs = 80,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 1320
monster.Bestiary = {
	class = "Giant",
	race = BESTY_RACE_GIANT,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Desecrated Glade",
}

monster.health = 900
monster.maxHealth = 900
monster.race = "blood"
monster.corpse = 25074
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
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Crushing! Smashing! Ripping! Yeah!!", yell = false },
	{ text = "It's clobberin time!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 120 },
	{ name = "ham", chance = 40000, maxCount = 3 },
	{ name = "health potion", chance = 3000 },
	{ name = "mana potion", chance = 3000 },
	{ name = "plate armor", chance = 10 }, -- Frozen Hell: 0.010%
	{ name = "plate legs", chance = 10 }, -- Frozen Hell: 0.010%
	{ name = "steel helmet", chance = 10 }, -- Frozen Hell: 0.010%
	{ name = "bonelord shield", chance = 5 }, -- Frozen Hell: 0.005%
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -5, maxDamage = -58 },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -5, maxDamage = -30, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 35,
	mitigation = 1.24,
	{ name = "speed", interval = 2000, chance = 10, speedChange = 336, effect = CONST_ME_MAGIC_RED, target = false, duration = 2000 },
	{ name = "combat", interval = 2000, chance = 17, type = COMBAT_HEALING, minDamage = 80, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

