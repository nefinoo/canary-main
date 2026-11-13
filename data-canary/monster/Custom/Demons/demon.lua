local mType = Game.createMonsterType("demon")
local monster = {}

monster.name = "demon"
monster.description = "a demon"
monster.experience = 525000
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


monster.health = 1800
monster.maxHealth = 1800
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5995
monster.speed = 280
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
	staticAttackChance = 40,
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -32, maxDamage = -95},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -5, maxDamage = -40, range = 7, radius = 1, target = true},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -30, maxDamage = -100, range = 7, radius = 7, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 10, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 3000, chance = 18, type = COMBAT_ENERGYDAMAGE, minDamage = -30, maxDamage = -105, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 38,
	armor = 32,
	{ name = "combat", interval = 4000, chance = 8, type = COMBAT_HEALING, minDamage = 20, maxDamage = 45, effect = CONST_ME_MAGIC_BLUE },
	{ name = "speed", interval = 1000, chance = 10, speed = { min = 200, max = 200 }, duration = 12000, effect = CONST_ME_MAGIC_RED },
}

monster.maxSummons = 2
monster.summons = {
	{name = "fire elemental", chance = 10, interval = 1000, max = 2}
}

monster.loot = {
	{ name = "experience scroll", chance = 55 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	-- Oro y consumibles nivel 69
	{ name = "gold coin", chance = 90000, maxCount = 85 },
	{ name = "fire mushroom", chance = 35000, maxCount = 3 },
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 4500 },
	{ name = "strong mana potion", chance = 5000 },
	-- Materiales de addon originales
	{ name = "talon", chance = 4000, maxCount = 4 },
	{ name = "demonic essence", chance = 1429 },
	{ name = "demon horn", chance = 800 },
	{ id = 12413, chance = 12000 },
	-- Plate Set: progresion mejorada
	{ name = "plate armor", chance = 7700 },
	{ name = "plate legs", chance = 7400 },
	{ name = "steel helmet", chance = 8100 },
	{ name = "bonelord shield", chance = 7400 },
	-- Knight Set
	{ name = "knight armor", chance = 3200 },
	{ name = "knight legs", chance = 2800 },
	{ name = "knight axe", chance = 2500 },
	{ name = "devil helmet", chance = 2300 },
	{ name = "tower shield", chance = 2200 },
	-- Crown Set: muy raro
	{ name = "crown armor", chance = 300 },
	{ name = "crown legs", chance = 300 },
	{ name = "crown helmet", chance = 350 },
	{ name = "crown shield", chance = 260 },
	{ id = 3055, chance = 1600 }, -- Platinum Amulet (Crown Set)
	-- Fire Sword / Fire Axe / Dragonbone Staff: armas raras
	{ name = "fire sword", chance = 1300 },
	{ name = "fire axe", chance = 1150 },
	{ name = "dragonbone staff", chance = 1300 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1800 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 260 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





