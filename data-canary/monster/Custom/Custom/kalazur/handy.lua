local mType = Game.createMonsterType("handy")
local monster = {}

monster.name = "handy"
monster.description = "handy"
monster.experience = 2500000
monster.outfit = {
	lookType = 230,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1750000
monster.maxHealth = 1750000
monster.runHealth = 3100
monster.race = "blood"
monster.corpse = 6312
monster.speed = 450
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
	staticAttackChance = 70,
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
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -10000, maxDamage = -15000},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_MANADRAIN, minDamage = -4500, maxDamage = -8000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_BLUE},
	{name ="drunk", interval = 1000, chance = 12, drunkenness = 25, duration = 10000, range = 1, radius = 1, target = true}
}

monster.defenses = {
	defense = 35,
	armor = 25,
	{name ="speed", interval = 3000, chance = 12, speed = {min = 380, max = 380}, duration = 8000, effect = CONST_ME_MAGIC_RED},
	{name ="invisible", interval = 4000, chance = 50, duration = 6000, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 25000, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 35, speed = {min = 370, max = 370}, duration = 30000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "handmaiden's protector", chance = 35000}
}

mType:register(monster)




