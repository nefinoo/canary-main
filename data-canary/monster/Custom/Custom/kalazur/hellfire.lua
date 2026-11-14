local mType = Game.createMonsterType("hellfire")
local monster = {}

monster.name = "hellfire"
monster.description = "a hellfire"
monster.experience = 2500000000
monster.outfit = {
	lookType = 243,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 900000
monster.maxHealth = 900000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6324
monster.speed = 310
monster.summonCost = 0

monster.changeTarget = {
	interval = 30,
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
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -25},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -6000, maxDamage = -9000, condition = {type = CONDITION_FIRE, startDamage = 0, interval = 9000}, target = true},
	{name ="firefield", interval = 1000, chance = 16, range = 7, radius = 3, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -2000, maxDamage = -7000, length = 7, spread = 3, effect = false, target = false},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_FIREDAMAGE, minDamage = -3600, maxDamage = -6500, radius = 3, target = false, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.loot = {
}

mType:register(monster)





