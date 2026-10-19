-- Frozen Hell | Caceria normal | Nivel recomendado: 650
-- Los sprites se basan en looktypes existentes; ajustar apariencia si el mapa requiere una distinta.
local mType = Game.createMonsterType("deathwalker")
local monster = {}

monster.name = "deathwalker"
monster.description = "a deathwalker"
monster.experience = 17500000
monster.outfit = {lookType = 232, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = 0, lookMount = 0}
monster.health = 14500
monster.maxHealth = 14500
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6310
monster.speed = 270
monster.summonCost = 0
monster.changeTarget = {interval = 5000, chance = 8}

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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_DEATHDAMAGE, percent = 40},
	{type = COMBAT_HOLYDAMAGE, percent = -20},
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.attacks = {
	{name = "melee", interval = 2000, chance = 100, minDamage = -1050, maxDamage = -1350},
	{name = "combat", interval = 4000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -750, maxDamage = -1100, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name = "combat", interval = 4000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -480, maxDamage = -720, range = 5, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
}

monster.defenses = {
	defense = 26,
	armor = 30
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 6},
	{name = "platinum coin", chance = 50000, maxCount = 7},
	{name = "experience scroll", chance = 850},
	{name = "violet gem", chance = 1750},
	{id = 12413, chance = 12000},
	{id = 3366, chance = 850},
	{id = 3399, chance = 120},
	{id = 8095, chance = 120},
	{id = 3408, chance = 120},
}

mType:register(monster)
