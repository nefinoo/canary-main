local mType = Game.createMonsterType("Lizard Chosen")
local monster = {}

monster.description = "a lizard chosen"
monster.experience = 3750000000
monster.outfit = {
	lookType = 344,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 620
monster.Bestiary = {
	class = "Reptile",
	race = BESTY_RACE_REPTILE,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Temple of Equilibrium (Zao) Hidden stairs, Fire Dragon Dojo, Corruption Hole, Razzachai.",
}

monster.health = 900000
monster.maxHealth = 900000
monster.race = "blood"
monster.corpse = 10371
monster.speed = 136
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 50,
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
	{ text = "Grzzzzzzz!", yell = false },
	{ text = "Kzzzzzzz!", yell = false },
	{ text = "Garrrblarrrrzzzz!", yell = false },
}

monster.loot = {
	{ name = "small diamond", chance = 2550, maxCount = 5 },
	{ name = "tower shield", chance = 1100 },
	{ name = "lizard leather", chance = 2000 },
	{ name = "lizard scale", chance = 980, maxCount = 3 },
	{ name = "zaoan armor", chance = 980 },
	{ name = "zaoan helmet", chance = 140 },
	{ name = "zaoan shoes", chance = 810 },
	{ name = "zaoan legs", chance = 940 },
	{ name = "spiked iron ball", chance = 9890 },
	{ name = "corrupted flag", chance = 3350 },
	{ name = "cursed shoulder spikes", chance = 5800 },
	{ name = "scale of corruption", chance = 2870 },
	{name = "platinum coin", chance = 100000, maxCount = 20},
	{name = "platinum coin", chance = 100000, maxCount = 25},
	{name = "platinum coin", chance = 35000, maxCount = 30},
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
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 20, minDamage = -20306, maxDamage = -26398, length = 3, spread = 2, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -20306, maxDamage = -26398, radius = 3, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -20306, maxDamage = -26398, length = 8, spread = 3, effect = CONST_ME_GREEN_RINGS, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 28,
	mitigation = 0.94,
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

