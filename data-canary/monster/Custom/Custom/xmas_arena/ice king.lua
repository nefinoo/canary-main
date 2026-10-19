local mType = Game.createMonsterType("ice king")
local monster = {}

monster.name = "ice king"
monster.description = "the ice king"
monster.experience = 8500000000
monster.outfit = {
	lookType = 261,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3500000
monster.maxHealth = 3500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 0
monster.speed = 520
monster.summonCost = 0

monster.changeTarget = {
	interval = 300,
	chance = 5
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
	staticAttackChance = 50,
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
	chance = 5,
	{text = "Chrr.", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -10000, maxDamage = -18000},
	{name ="combat", interval = 1500, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -5000, maxDamage = -7500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -500, maxDamage = -1100, range = 1, radius = 3, target = false, effect = CONST_ME_HITAREA}
}

monster.defenses = {
	defense = 26,
	armor = 25
}

monster.loot = {
}

mType:register(monster)





