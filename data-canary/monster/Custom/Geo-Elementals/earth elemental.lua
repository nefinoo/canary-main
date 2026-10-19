local mType = Game.createMonsterType("earth elemental")
local monster = {}

monster.name = "earth elemental"
monster.description = "an earth elemental"
monster.experience = 450000
monster.outfit = {
	lookType = 301,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 650
monster.maxHealth = 650
monster.runHealth = 1
monster.race = "undead"
monster.corpse = 8933
monster.speed = 330
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 50
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
	canPushCreatures = false,
	staticAttackChance = 80,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 70, attack = 75},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -25, maxDamage = -195, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK},
	{name ="condition", interval = 1000, chance = 10, type = CONDITION_POISON, startDamage = 0, tick = 4000, minDamage = 0, maxDamage = -260, length = 6, spread = 0, effect = CONST_ME_GROUNDSHAKER},
	{name ="speed", interval = 2000, chance = 20, speed = {min = -450, max = -450}, duration = 4000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 44},
	{name = "earth arrow", chance = 6000, maxCount = 3},
	{name = "small stone", chance = 9000, maxCount = 9},
	{name = "seeds", chance = 1000, maxCount = 2}
}

mType:register(monster)





