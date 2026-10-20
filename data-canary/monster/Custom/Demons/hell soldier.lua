-- Frozen Hell | Caceria normal | Nivel recomendado: 850
-- Los sprites se basan en looktypes existentes; ajustar apariencia si el mapa requiere una distinta.
local mType = Game.createMonsterType("hell soldier")
local monster = {}

monster.name = "hell soldier"
monster.description = "a hell soldier"
monster.experience = 26000000
monster.outfit = {lookType = 243, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = 0, lookMount = 0}
monster.health = 18500
monster.maxHealth = 18500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6324
monster.speed = 300
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
	canWalkOnFire = true,
	canWalkOnPoison = false
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_DEATHDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE, percent = -15},
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.attacks = {
	{name = "melee", interval = 2000, chance = 100, minDamage = -1150, maxDamage = -1500},
	{name = "combat", interval = 3000, chance = 45, type = COMBAT_FIREDAMAGE, minDamage = -850, maxDamage = -1150, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name = "combat", interval = 6000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -650, maxDamage = -900, radius = 2, target = false, effect = CONST_ME_HITAREA},
}

monster.defenses = {
	defense = 30,
	armor = 35
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 9},
	{name = "platinum coin", chance = 60000, maxCount = 12},
	{name = "experience scroll", chance = 1000},
	{name = "crystal coin", chance = 30000, maxCount = 1}, -- nivel 850+, premio monetario ocasional
	{name = "red gem", chance = 2100},
	{id = 12413, chance = 13500},
	{id = 3366, chance = 900},
	{id = 3399, chance = 350},
	{id = 8095, chance = 150},
	{id = 3408, chance = 120},
}

mType:register(monster)
