local mType = Game.createMonsterType("Unblessed Spirit")
local monster = {}

monster.name = "Unblessed Spirit"
monster.description = "an unblessed spirit."
monster.experience = 500000000
monster.outfit = {
	lookType = 48,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500000
monster.maxHealth = 500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5993
monster.speed = 420
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25
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
	canPushCreatures = true,
	staticAttackChance = 1,
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
	interval = 2000,
	chance = 50,
	{text = "I have fallen!", yell = true},
	{text = "Whooo!", yell = true}
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
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.attacks = {
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -3000, range = 7, radius = 1, target = true, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_MANADRAIN, minDamage = -10000, maxDamage = -12000, range = 3, radius = 1, target = true, effect = CONST_ME_MAGIC_GREEN}
}

monster.defenses = {
	defense = 45,
	armor = 10
}

monster.loot = {
	{name = "worm", chance = 1, maxCount = 37}
}

mType:register(monster)





