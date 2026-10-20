-- Frozen Hell | Caceria normal | Nivel recomendado: 1800
-- Fase 13: variante compartida por nombre; confirmar otros spawns del mapa.
local mType = Game.createMonsterType("undead dragon")
local monster = {}

monster.name = "undead dragon"
monster.description = "a undead dragon"
monster.experience = 145000000
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 72000
monster.maxHealth = 72000
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

monster.attacks = {
	{name = "melee", interval = 2000, chance = 100, minDamage = -1350, maxDamage = -1750},
	{name = "melee", interval = 5000, chance = 25, minDamage = -1850, maxDamage = -2350},
	{name = "combat", interval = 3500, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -1400, maxDamage = -1800, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name = "combat", interval = 5000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -1050, maxDamage = -1400, range = 7, radius = 3, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name = "combat", interval = 5000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -1200, maxDamage = -1600, length = 6, spread = 2, effect = CONST_ME_FIREAREA},
	{name = "combat", interval = 5000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -1450, length = 6, spread = 2, effect = CONST_ME_POISONAREA},
	{name = "combat", interval = 4000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -1450, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
}

monster.defenses = {
	defense = 42,
	armor = 38
}

monster.loot = {
	-- Frozen Hell: level ~1800 solo hunt, weapons from quests remain quest-exclusive.
	-- Consistent currency + materials; equipment is rare, not an alternate quest farm.
	{name = "crystal coin", chance = 80000, maxCount = 2},
	{name = "platinum coin", chance = 100000, maxCount = 10},
	{name = "platinum coin", chance = 50000, maxCount = 15},
	{name = "demonic essence", chance = 11000},
	{name = "experience scroll", chance = 2500, maxCount = 2},
	{name = "small diamond", chance = 40000, maxCount = 3},
	{name = "green gem", chance = 1500},
	{name = "yellow gem", chance = 3000},
	{name = "iron ore", chance = 10000, maxCount = 3},
	{name = "red piece of cloth", chance = 2006},
	{id = 3082, chance = 5500},
	{id = 5925, chance = 2500},
	-- Legacy healing-food supplements; fishing remains the principal food source.
	{name = "salmon", chance = 10000, maxCount = 2},
	{id = 3581, chance = 4500},
	-- Very rare loot from the earlier Demon tier (no level-500 quest weapons).
	{name = "demon helmet", chance = 150},
	{name = "demon armor", chance = 100},
	{name = "demon legs", chance = 130},
	{name = "demon shield", chance = 400},
	{name = "magic plate armor", chance = 300},
	{id = 6529, chance = 30}, -- soft boots
}

mType:register(monster)





