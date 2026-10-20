-- Frozen Hell | Caceria normal | Nivel recomendado: 1800
-- Fase 13: variante compartida por nombre; confirmar otros spawns del mapa.
local mType = Game.createMonsterType("undead dragon")
local monster = {}

monster.name = "undead dragon"
monster.description = "a undead dragon"
monster.experience = 118000000
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
	-- Equipo de quests lvl100 no aparece en loot normal: solo armas comunes y materiales.
	{name = "crystal coin", chance = 35000, maxCount = 2},
	{name = "demonic essence", chance = 11000},
	{name = "platinum coin", chance = 100000, maxCount = 10},
	{name = "platinum coin", chance = 50000, maxCount = 15},
	{name = "experience scroll", chance = 2500, maxCount = 2},
	{id = 7366, chance = 100},
	{id = 7426, chance = 100}, 
	{id = 7420, chance = 100}, 
	{id = 3296, chance = 100},
	{id = 7437, chance = 100},
	{ name = "red piece of cloth", chance = 2006 },
	{id = 3082, chance = 5500},
	{id = 5925, chance = 2500},
	{name = "demonic essence", chance = 1818},
	
}

mType:register(monster)





