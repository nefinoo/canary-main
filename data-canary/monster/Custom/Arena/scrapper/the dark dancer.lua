local mType = Game.createMonsterType("The Dark Dancer")
local monster = {}

monster.name = "The Dark Dancer"
monster.description = "the dark dancer"
monster.experience = 435
monster.outfit = {
	lookType = 58,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 855
monster.maxHealth = 855
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 7349
monster.speed = 170
monster.summonCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
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
	staticAttackChance = 78,
	targetDistance = 5,
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
	chance = 5,
	{text = "I hope you like my voice!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 22}
}

monster.attacks = {
	{name ="condition", interval = 2000, chance = 100, type = CONDITION_POISON, startDamage = -11, tick = 4000, minDamage = -55, maxDamage = -99},
	{name ="combat", interval = 3000, chance = 70, type = COMBAT_PHYSICALDAMAGE, minDamage = -60, maxDamage = -95, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 6000, chance = 90, type = COMBAT_PHYSICALDAMAGE, minDamage = -60, maxDamage = -95, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="speed", interval = 3500, chance = 35, speed = {min = 0, max = 0}, duration = 10000, range = 5, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 4000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -2, maxDamage = -110, range = 5, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 12,
	armor = 11,
	{name ="combat", interval = 2000, chance = 45, type = COMBAT_HEALING, minDamage = 75, maxDamage = 135, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 3000, chance = 50, duration = 5000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 3
monster.summons = {
	{name = "Ghoul", chance = 20, interval = 2000, max = 3}
}

monster.loot = {
}

mType:register(monster)




