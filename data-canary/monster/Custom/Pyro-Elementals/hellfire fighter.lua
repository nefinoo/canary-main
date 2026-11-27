local mType = Game.createMonsterType("hellfire fighter")
local monster = {}

monster.name = "hellfire fighter"
monster.description = "a hellfire fighter"
monster.experience = 1500000
monster.outfit = {
	lookType = 243,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 295
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Pits of Inferno, Demon Forge, Fury Dungeon.",
}


monster.health = 4650
monster.maxHealth = 4650
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6324
monster.speed = 260
monster.summonCost = 0

monster.changeTarget = {
	interval = 3000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -80, maxDamage = -190},
	{name ="firefield", interval = 4000, chance = 5, range = 7, radius = 2, target = false, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 22, type = COMBAT_FIREDAMAGE, minDamage = -65, maxDamage = -165, range = 5, radius = 1, target = true, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="melee", interval = 2000, chance = 10, minDamage = -40, maxDamage = -90}
}

monster.defenses = {
	defense = 20,
	armor = 18
}

monster.loot = {
	{ name = "experience scroll", chance = 74 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	-- Oro y consumibles: transicion nivel 100-200
	{ name = "gold coin", chance = 90000, maxCount = 140 },
	{ name = "ham", chance = 40000, maxCount = 3 },
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 6000 },
	{ name = "strong mana potion", chance = 6000 },
	{ name = "great health potion", chance = 2000 },
	{ name = "great mana potion", chance = 2000 },
	{ name = "great spirit potion", chance = 1000 },
	-- Materiales de addon originales
	{ name = "soul orb", chance = 2222 },
	{ id = 12413, chance = 11500 },
	-- Set inicial por vocacion
	{ id = 7463, chance = 6707 },
	{ id = 7464, chance = 6438 },
	{ id = 7458, chance = 7176 },
	{ id = 3550, chance = 6438 },
	{ id = 8072, chance = 6700 }, -- Spellbook of Enlightenment
	-- Set 2: Mage
	{ id = 22085, chance = 2550 },
	{ id = 22087, chance = 2397 },
	{ id = 7462, chance = 1862 },
	{ id = 8073, chance = 1759 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1096 }, -- Set 2 boots
	-- Set 3: Mage (nivel 100)
	{ id = 3573, chance = 1100 },
	{ id = 3567, chance = 800 },
	{ id = 645, chance = 950 },
	{ id = 32619, chance = 1200 },
	{ id = 8075, chance = 950 },
	-- Armas nivel 30
	{ id = 3065, chance = 4100 }, -- terra rod
	{ id = 3073, chance = 4100 }, -- wand of cosmic energy
	-- Armas nivel 50
	{ id = 3067, chance = 3100 }, -- hailstorm rod
	{ id = 3071, chance = 3100 }, -- wand of inferno
}

mType:register(monster)





