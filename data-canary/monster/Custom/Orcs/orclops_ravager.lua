local mType = Game.createMonsterType("Orclops Ravager")
local monster = {}

monster.description = "an orclops ravager"
monster.experience = 13000
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

monster.health = 260
monster.maxHealth = 260
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
	runHealth = 0,
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
	{ name = "gold coin", chance = 100000, maxCount = 40 },
	{ name = "health potion", chance = 30000 },
	{ name = "mana potion", chance = 30000 },
	{ name = "red mushroom", chance = 50000, maxCount = 3 },
	{ id = 3078, chance = 50320 }, -- mysterious fetish
	{ id = 23811, chance = 6000 }, -- reinvigorating seeds
	{ id = 24380, chance = 4900 }, -- bone toothpick
	{ id = 24381, chance = 1800 }, -- beetle carapace
	{ id = 24382, chance = 12750 }, -- bug meat
	{ id = 17828, chance = 910 }, -- pair of iron fists
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -10, maxDamage = -44 },
	{ name = "combat", interval = 3000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -6, maxDamage = -22, range = 5, shootEffect = CONST_ANI_LARGEROCK, target = true },
}

monster.defenses = {
	defense = 9,
	armor = 5,
	mitigation = 0.25,
	{ name = "speed", interval = 2000, chance = 10, speedChange = 35, effect = CONST_ME_MAGIC_RED, target = false, duration = 2000 },
	{ name = "combat", interval = 5000, chance = 20, type = COMBAT_HEALING, minDamage = 10, maxDamage = 18, effect = CONST_ME_MAGIC_BLUE, target = false },
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

