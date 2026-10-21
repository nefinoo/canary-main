-- Frozen Hell | Caceria normal | Nivel recomendado: 1800
-- Fase 13: variante compartida por nombre; confirmar otros spawns del mapa.
local mType = Game.createMonsterType("undead dragon")
local monster = {}

monster.name = "undead dragon"
monster.description = "a undead dragon"
monster.experience = 188000000
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 105000
monster.maxHealth = 105000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6306
monster.speed = 320
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
	{text = "FEEEED MY ETERNAL HUNGER!", yell = true},
	{text = "I SENSE LIFE", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 25},
	{type = COMBAT_FIREDAMAGE, percent = 35},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 8},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

-- Frozen Hell / Knight progression: Undead Dragon
monster.attacks = {
	{name = "melee", interval = 1500, chance = 100, minDamage = -1500, maxDamage = -2050},
	{name = "combat", interval = 3500, chance = 65, type = COMBAT_DEATHDAMAGE, minDamage = -1700, maxDamage = -2300, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name = "combat", interval = 4000, chance = 65, type = COMBAT_FIREDAMAGE, minDamage = -1550, maxDamage = -2050, length = 6, spread = 2, effect = CONST_ME_FIREAREA},
	{name = "combat", interval = 4500, chance = 45, type = COMBAT_EARTHDAMAGE, minDamage = -1450, maxDamage = -1950, range = 7, radius = 2, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 42,
	armor = 38
}

-- Frozen Hell: common NPC resale drops plus extremely rare old-set pieces.
monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 6},
	{name = "platinum coin", chance = 100000, maxCount = 30},
	{name = "experience scroll", chance = 2000},
	{name = "demonic essence", chance = 10000},
	{name = "magic plate armor", chance = 550},
	{name = "demon shield", chance = 650},
	{name = "small diamond", chance = 45000, maxCount = 4},
	{name = "green gem", chance = 2500},
	{name = "violet gem", chance = 1400},
	{name = "iron ore", chance = 15000, maxCount = 4},
	{name = "red dragon scale", chance = 15000, maxCount = 3},
	{name = "green dragon scale", chance = 15000, maxCount = 3},
	{id = 3399, chance = 70},
	{id = 8095, chance = 70},
	{id = 3408, chance = 70},
	{id = 8864, chance = 3}, -- Yalahari mask, 0.003%; usable from level 2500
}

mType:register(monster)





