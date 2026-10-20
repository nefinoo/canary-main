-- Frozen Hell | Caceria normal | Nivel recomendado: 850
-- Los sprites se basan en looktypes existentes; ajustar apariencia si el mapa requiere una distinta.
local mType = Game.createMonsterType("undead mage")
local monster = {}

monster.name = "undead mage"
monster.description = "a undead mage"
monster.experience = 28000000
monster.outfit = {lookType = 99, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = 0, lookMount = 0}
monster.health = 17000
monster.maxHealth = 17000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6028
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
	{name = "melee", interval = 2000, chance = 100, minDamage = -650, maxDamage = -850},
	{name = "combat", interval = 3000, chance = 50, type = COMBAT_DEATHDAMAGE, minDamage = -1200, maxDamage = -1500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name = "combat", interval = 4000, chance = 40, type = COMBAT_ENERGYDAMAGE, minDamage = -950, maxDamage = -1300, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA},
	{name = "combat", interval = 5000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -350, maxDamage = -550, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_BLUE},
}

monster.defenses = {
	defense = 25,
	armor = 26,
	{name = "combat", interval = 5000, chance = 25, type = COMBAT_HEALING, minDamage = 250, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 8},
	{name = "platinum coin", chance = 65000, maxCount = 13},
	{name = "experience scroll", chance = 1100},
	{name = "crystal coin", chance = 35000, maxCount = 1}, -- nivel 850+, premio monetario ocasional
	{name = "violet gem", chance = 2100},
	{id = 12413, chance = 14000},
	{id = 3366, chance = 900},
	{id = 3399, chance = 120},
	{id = 8095, chance = 220},
	{id = 3408, chance = 350},
}

mType:register(monster)
