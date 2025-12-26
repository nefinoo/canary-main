local mType = Game.createMonsterType("Draken Elite")
local monster = {}

monster.description = "a draken elite"
monster.experience = 2050000
monster.outfit = {
	lookType = 362,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 672
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Razachai, including the Crystal Column chambers in the Inner Sanctum.",
}

monster.health = 176433
monster.maxHealth = 176433
monster.race = "blood"
monster.corpse = 11653
monster.speed = 166
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
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
	level = 3,
	color = 161,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "For ze emperor!", yell = false },
	{ text = "You will die zhouzandz deazhz!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 97220, maxCount = 187 },
	{ name = "platinum coin", chance = 49070, maxCount = 8 },
	{ name = "meat", chance = 34260, maxCount = 4 },
	{ name = "broken draken mail", chance = 25000 },
	{ name = "broken slicer", chance = 25000 },
	{ name = "ultimate health potion", chance = 12040, maxCount = 3 },
	{ name = "great mana potion", chance = 9260, maxCount = 3 },
	{ name = "draken sulphur", chance = 6480 },
	{ name = "draken wristbands", chance = 6480 },
	{ name = "small diamond", chance = 1850, maxCount = 2 },
	{ name = "zaoan legs", chance = 1850 },
	{ name = "magic sulphur", chance = 1850 },
	{ name = "draken boots", chance = 930 },
	{ name = "assassin dagger", chance = 930 },
	{ name = "twiceslicer", chance = 930 },
	{ name = "zaoan armor", chance = 650 },
	{ name = "zaoan sword", chance = 550 },
	{ name = "zaoan helmet", chance = 220 },
	{ name = "elite draken mail", chance = 110 },
	{ name = "blade of corruption", chance = 60 },
	{ name = "snake god's wristguard", chance = 40 },
	{ name = "cobra crown", chance = 0 },
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, minDamage = -4300, maxDamage = -5749 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -8653, maxDamage = -11249, length = 4, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -8653, maxDamage = -11249, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -8653, maxDamage = -11249, radius = 4, effect = CONST_ME_POFF, target = true },
	{ name = "soulfire rune", interval = 2000, chance = 10, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -8653, maxDamage = -11249, range = 7, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 60,
	armor = 60,
	mitigation = 1.60,
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
