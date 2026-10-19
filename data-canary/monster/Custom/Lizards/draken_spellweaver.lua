local mType = Game.createMonsterType("Draken Spellweaver")
local monster = {}

monster.description = "a draken spellweaver"
monster.experience = 3750000
monster.outfit = {
	lookType = 340,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 618
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Zao Palace, Razachai, and Zzaion.",
}

monster.health = 900000
monster.maxHealth = 900000
monster.race = "blood"
monster.corpse = 10399
monster.speed = 168
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
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
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
	{ text = "Zzzzzooom!", yell = false },
	{ text = "Fissziss!", yell = false },
	{ text = "Kazzzzzzuuum!", yell = false },
}

monster.loot = {
	{ name = "weaver's wandtip", chance = 18450 },
	{ name = "small ruby", chance = 6640, maxCount = 5 },
	{ name = "draken sulphur", chance = 4610 },
	{ name = "luminous orb", chance = 2580 },
	{ name = "green gem", chance = 1290 },
	{ name = "zaoan shoes", chance = 1290 },
	{ name = "wand of inferno", chance = 1110 },
	{ name = "focus cape", chance = 740 },
	{ name = "spellweaver's robe", chance = 740 },
	{ name = "zaoan legs", chance = 550 },
	{ name = "zaoan robe", chance = 370 },
	{ name = "ring of the sky", chance = 180 },
	{ name = "bamboo leaves", chance = 180 },
	{ name = "harness", chance = 30 },
	{ name = "draken trophy", chance = 10 },
	
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
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -20306, maxDamage = -26398, length = 4, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -20306, maxDamage = -26398, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -20306, maxDamage = -263980, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -20306, maxDamage = -26398, radius = 4, effect = CONST_ME_POFF, target = true },
	{ name = "soulfire rune", interval = 2000, chance = 10, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -20306, maxDamage = -26398, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	mitigation = 1.35,
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_RED },
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
