local mType = Game.createMonsterType("Draken Warmaster")
local monster = {}

monster.description = "a draken warmaster"
monster.experience = 4350000000
monster.outfit = {
	lookType = 334,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 617
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Zao Palace, Chazorai, Razzachai, and Zzaion.",
}

monster.health = 900000
monster.maxHealth = 900000
monster.race = "blood"
monster.corpse = 10190
monster.speed = 162
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Attack aggrezzively! Dezztroy zze intruderzz!", yell = false },
	{ text = "Hizzzzzz!", yell = false },
}

monster.loot = {
	{ name = "bone shoulderplate", chance = 12840 },
	{ name = "zaoan halberd", chance = 8930 },
	{ name = "warmaster's wristguards", chance = 7020 },
	{ name = "zaoan shoes", chance = 2610 },
	{ name = "tower shield", chance = 2310 },
	{ name = "small ruby", chance = 1810, maxCount = 5 },
	{ name = "zaoan legs", chance = 1300 },
	{ name = "zaoan armor", chance = 600 },
	{ name = "drakinata", chance = 600 },
	{ name = "ring of the sky", chance = 220 },
	{name = "platinum coin", chance = 100000, maxCount = 28},
	{name = "platinum coin", chance = 100000, maxCount = 30},
	{name = "platinum coin", chance = 35000, maxCount = 34},
	{name = "experience scroll", chance = 3200, maxCount = 3},
	{id = 37607, chance = 150},
	{id = 37608, chance = 150},
	{id = 37609, chance = 150},
	{id = 37610, chance = 150},	
	{name = "demon helmet", chance = 800},
	{name = "demon legs", chance = 800},
	{name = "demon shield", chance = 800},
	{id = 6529, chance = 800}, -- soft boots
	{id = 50854, chance = 15},	
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, minDamage = -11999, maxDamage = -20306 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -20306, maxDamage = -26398, length = 4, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 55,
	{ name = "combat", interval = 4000, chance = 50, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 19000, effect = CONST_ME_MAGIC_GREEN, target = false },

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
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

