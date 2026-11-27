local mType = Game.createMonsterType("demon")
local monster = {}

monster.name = "demon"
monster.description = "a demon"
monster.experience = 1400000
monster.outfit = {
	lookType = 35,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 35
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Hero Cave, Ferumbras' Citadel, Goroma, Ghostlands Warlock area unreachable, Liberty Bay hidden underground passage unreachable, Razachai, deep in Pits of Inferno (found in every throneroom except Verminor's), deep Formorgar Mines, Demon Forge, Alchemist Quarter, Magician Quarter, Chyllfroest, Oramond Dungeon, Abandoned Sewers, Hell Hub and Halls of Ascension.",
}


monster.health = 4500
monster.maxHealth = 4500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5995
monster.speed = 260
monster.summonCost = 0

monster.changeTarget = {
	interval = 300,
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
	{text = "CHAMEK ATH UTHUL ARAK!", yell = true},
	{text = "I SMELL FEEEEEAAAR!", yell = true},
	{text = "MUHAHAHAHA!", yell = true},
	{text = "Your resistance is futile!", yell = false},
	{text = "Your soul will be mine!", yell = false}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -75, maxDamage = -175},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -10, maxDamage = -50, range = 7, radius = 1, target = true},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -150, range = 7, radius = 7, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 3000, chance = 5, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -60, maxDamage = -160, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 20,
	armor = 18,
	{ name = "combat", interval = 4000, chance = 8, type = COMBAT_HEALING, minDamage = 20, maxDamage = 45, effect = CONST_ME_MAGIC_BLUE },
	{ name = "speed", interval = 4000, chance = 20, speed = { min = 100, max = 100 }, duration = 5000, effect = CONST_ME_MAGIC_RED },
}

monster.maxSummons = 1
monster.summons = {
	{name = "fire elemental", chance = 15, interval = 5000, max = 1}
}

monster.loot = {
	{ name = "experience scroll", chance = 70 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	-- Oro y consumibles: transicion nivel 100-200
	{ name = "gold coin", chance = 90000, maxCount = 130 },
	{ name = "fire mushroom", chance = 35000, maxCount = 3 },
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 6000 },
	{ name = "strong mana potion", chance = 6000 },
	{ name = "great health potion", chance = 2000 },
	{ name = "great mana potion", chance = 2000 },
	{ name = "great spirit potion", chance = 1000 },
	-- Materiales de addon originales
	{ name = "talon", chance = 4000, maxCount = 4 },
	{ name = "demonic essence", chance = 1429 },
	{ name = "demon horn", chance = 800 },
	{ id = 12413, chance = 12000 },
	-- Set inicial por vocacion
	{ id = 3357, chance = 6600 },
	{ id = 3557, chance = 6336 },
	{ id = 3351, chance = 7062 },
	{ id = 3554, chance = 6336 },
	-- Set 2: Knight
	{ id = 3397, chance = 2480 },
	{ id = 3398, chance = 2331 },
	{ id = 3396, chance = 1810 },
	-- Botas de progresion por set
	{ id = 4033, chance = 1066 }, -- Set 2 boots
	-- Escudos de progresion y Set 3: nivel 100
	{ id = 3428, chance = 6500 },
	{ id = 3419, chance = 2000 },
	{ id = 875, chance = 1050 },
	{ id = 21167, chance = 750 },
	{ id = 21168, chance = 900 },
	{ id = 21169, chance = 1150 },
	{ id = 14088, chance = 900 },
	-- Armas nivel 30
	{ id = 3280, chance = 4000 }, -- fire sword
	{ id = 3318, chance = 4000 }, -- knight axe
	{ id = 3324, chance = 4000 }, -- skull staff
	-- Armas nivel 50
	{ id = 3295, chance = 3000 }, -- bright sword
	{ id = 7456, chance = 3000 }, -- noble axe
	{ id = 3333, chance = 3000 }, -- crystal mace
}

mType:register(monster)





