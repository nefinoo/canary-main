local mType = Game.createMonsterType("warlock")
local monster = {}

monster.name = "warlock"
monster.description = "a warlock"
monster.experience = 950000
monster.outfit = {
	lookType = 130,
	lookHead = 19,
	lookBody = 71,
	lookLegs = 128,
	lookFeet = 128,
	lookAddons = 1,
	lookMount = 0
}

monster.raceId = 10
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Demona, Ghostland (Banshee Quest area), Temple of Xayepocax, Oasis Tomb, Kharos, Magician Quarter, \z
		beneath Fenrock, The Arcanum.",
}


monster.health = 3900
monster.maxHealth = 3900
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 220
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 10
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
	targetDistance = 4,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Even a rat is a better mage than you.", yell = false},
	{text = "Learn the secret of our magic! YOUR death!", yell = false},
	{text = "We don't like intruders!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -22, maxDamage = -65 },
	{ name = "combat", interval = 2000, chance = 65, type = COMBAT_ENERGYDAMAGE, minDamage = -38, maxDamage = -110, range = 5, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -35, maxDamage = -100, range = 5, radius = 2, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA },
	{ name = "combat", interval = 6000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -15, maxDamage = -45, range = 5, target = true },
	{ name = "speed", interval = 6000, chance = 10, speed = {min = -80, max = -80}, duration = 2000, range = 5, target = true, effect = CONST_ME_MAGIC_RED },
}

monster.defenses = {
	defense = 23,
	armor = 14,
	{ name = "combat", interval = 5000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 85, effect = CONST_ME_MAGIC_BLUE },
}

monster.maxSummons = 0
monster.summons = {}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 42 },
	{ name = "health potion", chance = 16000 },
	{ name = "mana potion", chance = 16000 },
	{ name = "strong health potion", chance = 22000 },
	{ name = "strong mana potion", chance = 32000 },
	{ name = "great health potion", chance = 7000 },
	{ name = "great mana potion", chance = 12000 },
	{ name = "great spirit potion", chance = 6000 },
	{ name = "cherry", chance = 40000, maxCount = 3 },
	{ name = "bread", chance = 25000, maxCount = 2 },
	{ name = "talon", chance = 3500 },
	{ name = "luminous orb", chance = 1000 },
	{ id = 3356, chance = 720 }, -- devil helmet
	{ id = 8060, chance = 500 }, -- master archer's armor
	{ id = 8863, chance = 580 }, -- yalahari leg piece
	{ id = 3428, chance = 660 }, -- tower shield
}

mType:register(monster)





