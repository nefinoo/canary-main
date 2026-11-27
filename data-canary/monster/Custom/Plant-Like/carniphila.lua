local mType = Game.createMonsterType("carniphila")
local monster = {}

monster.name = "carniphila"
monster.description = "a carniphila"
monster.experience = 1800000
monster.outfit = {
	lookType = 120,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5000
monster.maxHealth = 5000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6047
monster.speed = 250
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	targetDistance = 1,
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
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 7},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -75, maxDamage = -185, condition = {type = CONDITION_POISON, startDamage = 25, interval = 4000}},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_EARTHDAMAGE, minDamage = -65, maxDamage = -155, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON},
	{name ="speed", interval = 4000, chance = 10, speed = {min = -150, max = -150}, duration = 3000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON},
	{name ="combat", interval = 3000, chance = 18, type = COMBAT_EARTHDAMAGE, minDamage = -85, maxDamage = -215, radius = 3, target = false, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 20,
	armor = 20
}

monster.loot = {
	{ name = "experience scroll", chance = 79 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	{ name = "gold coin", chance = 90000, maxCount = 165 },
	{ name = "corncob", chance = 890 },
	{ name = "dark mushroom", chance = 7692 },
	{ name = "sling herb", chance = 446, maxCount = 2 },
	{ name = "shadow herb", chance = 880 },
	{ name = "seeds", chance = 490 },
	{ name = "carniphila seeds", chance = 4166 },
	{ name = "carrot on a stick", chance = 1700 },
	-- Curacion, recursos y addon bag (nivel 100-200)
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 10000 },
	{ name = "strong health potion", chance = 7000 },
	{ name = "strong mana potion", chance = 7000 },
	{ name = "great health potion", chance = 2500 },
	{ name = "great mana potion", chance = 2500 },
	{ name = "great spirit potion", chance = 1200 },
	{ id = 12413, chance = 11900 },
	-- Set inicial por vocacion
	{ id = 7463, chance = 7600 },
	{ id = 7464, chance = 7296 },
	{ id = 7458, chance = 8132 },
	{ id = 3550, chance = 7296 },
	{ id = 8072, chance = 7200 }, -- Spellbook of Enlightenment
	-- Set 2: Mage
	{ id = 22085, chance = 3100 },
	{ id = 22087, chance = 2914 },
	{ id = 7462, chance = 2263 },
	{ id = 8073, chance = 2139 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1333 }, -- Set 2 boots
	-- Set 3: Mage (nivel 100)
	{ id = 3573, chance = 1300 },
	{ id = 3567, chance = 950 },
	{ id = 645, chance = 1100 },
	{ id = 32619, chance = 1450 },
	{ id = 8075, chance = 1100 },
	-- Armas nivel 30
	{ id = 3065, chance = 4300 }, -- terra rod
	{ id = 3073, chance = 4300 }, -- wand of cosmic energy
	-- Armas nivel 50
	{ id = 3067, chance = 3300 }, -- hailstorm rod
	{ id = 3071, chance = 3300 }, -- wand of inferno
}

mType:register(monster)





