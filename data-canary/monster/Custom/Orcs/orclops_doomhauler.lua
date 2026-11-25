local mType = Game.createMonsterType("Orclops Doomhauler")
local monster = {}

monster.description = "an orclops doomhauler"
monster.experience = 16000
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


monster.health = 320
monster.maxHealth = 320
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
	runHealth = 0,
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
	{ name = "gold coin", chance = 100000, maxCount = 50 },
	{ name = "health potion", chance = 35000 },
	{ name = "mana potion", chance = 35000 },
	{ name = "red mushroom", chance = 55000, maxCount = 3 },
	{ id = 3078, chance = 20000 }, -- mysterious fetish
	{ id = 23811, chance = 300 }, -- reinvigorating seeds
	{ id = 24380, chance = 20000 }, -- bone toothpick
	{ id = 24381, chance = 4900 }, -- beetle carapace
	{ id = 24382, chance = 1800, maxCount = 2 }, -- bug meat
	{ id = 17828, chance = 15290, maxCount = 3 }, -- pair of iron fists
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -12, maxDamage = -48 },
	{ name = "combat", interval = 3000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -6, maxDamage = -26, range = 5, shootEffect = CONST_ANI_LARGEROCK, target = true },
	-- curse
	{ name = "condition", type = CONDITION_CURSED, interval = 4000, chance = 5, minDamage = -1, maxDamage = -2, radius = 4, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_EXPLOSIONAREA, target = true },
}

monster.defenses = {
	defense = 10,
	armor = 6,
	mitigation = 0.25,
	{ name = "speed", interval = 2000, chance = 10, speedChange = 35, effect = CONST_ME_MAGIC_RED, target = false, duration = 2000 },
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

