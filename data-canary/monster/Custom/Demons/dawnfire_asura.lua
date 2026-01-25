local mType = Game.createMonsterType("Dawnfire Asura")
local monster = {}

monster.description = "a dawnfire asura"
monster.experience = 11000000
monster.outfit = {
	lookType = 150,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 78,
	lookFeet = 79,
	lookAddons = 1,
	lookMount = 0,
}

monster.raceId = 1134
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Asura Palace.",
}

monster.health = 1250000
monster.maxHealth = 1250000
monster.race = "blood"
monster.corpse = 21987
monster.speed = 140
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	staticAttackChance = 80,
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
	{ text = "May the flames consume you!", yell = false },
	{ text = "Encounter the flames of destiny!", yell = false },
	{ text = "Fire and destruction!", yell = false },
}

monster.loot = {
	{ id = 3033, chance = 3140, maxCount = 1 }, -- small amethyst
	{ id = 3028, chance = 2930, maxCount = 1 }, -- small diamond
	{ id = 3032, chance = 3530, maxCount = 1 }, -- small emerald
	{ id = 3030, chance = 5760, maxCount = 1 }, -- small ruby
	{ id = 9057, chance = 2840, maxCount = 1 }, -- small topaz
	{ id = 3041, chance = 220 }, -- blue gem
	{ id = 6499, chance = 10660 }, -- demonic essence
	{ id = 21974, chance = 1230 }, -- golden lotus brooch
	{ id = 3078, chance = 1160 }, -- mysterious fetish
	{ id = 3574, chance = 2190 }, -- mystic turban
	{ id = 21975, chance = 11110 }, -- peacock feather fan
	{ id = 5911, chance = 2340 }, -- red piece of cloth
	{ id = 3016, chance = 800 }, -- ruby necklace
	{ id = 5944, chance = 14560 }, -- soul orb
	
	{name = "platinum coin", chance = 100000, maxCount = 75},
	{name = "platinum coin", chance = 100000, maxCount = 100},
	{name = "crystal coin", chance = 50000, maxCount = 3},
	{name = "experience scroll", chance = 3200, maxCount = 3},
	-- weapons lvl 1000
	{id = 7368, chance = 500},
	{id = 895, chance = 500}, 
	{id = 7390, chance = 500}, 
	{id = 7415, chance = 500},
	{id = 3303, chance = 500},
	-- weapons lvl 500	
	{id = 7366, chance = 600},
	{id = 7426, chance = 600}, 
	{id = 7420, chance = 600}, 
	{id = 3296, chance = 600},
	{id = 7437, chance = 600},
	-- weapons lvl 100
	{name = "magic sword", chance = 800},
	{ id = 3319, chance = 800 }, 
	{ id = 3309, chance = 800 }, 
	{id = 3341, chance = 800},
	{name = "throwing star", chance = 800},
	
	--demon green set
	{id = 37607, chance = 150},
	{id = 37608, chance = 150},
	{id = 37609, chance = 150},
	{id = 37610, chance = 150},
	{id = 7368, chance = 150},
	
	{name = "demon helmet", chance = 1000},
	{name = "demon legs", chance = 1000},
	{name = "demon shield", chance = 1000},
	{id = 6529, chance = 1000}, -- soft boots
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -22499, maxDamage = -38075 },
	{ name = "combat", interval = 3700, chance = 17, type = COMBAT_LIFEDRAIN, minDamage = -38075, maxDamage = -50000, length = 8, spread = 0, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "combat", interval = 3200, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -38075, maxDamage = -50000, radius = 4, range = 5, target = true, effect = CONST_ME_MORTAREA },
	{ name = "combat", interval = 2700, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -38075, maxDamage = -50000, range = 3, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "speed", interval = 2000, chance = 20, speedChange = -800, radius = 1, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_SLEEP, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 55,
	armor = 48,
	mitigation = 1.46,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 15000, maxDamage = 25000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = 320, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
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
