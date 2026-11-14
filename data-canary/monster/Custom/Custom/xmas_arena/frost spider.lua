local mType = Game.createMonsterType("frost spider")
local monster = {}

monster.name = "frost spider"
monster.description = "a frost spider"
monster.experience = 7500000000
monster.outfit = {
	lookType = 263,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3000000
monster.maxHealth = 3000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 0
monster.speed = 520
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
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
	canPushCreatures = false,
	staticAttackChance = 60,
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
	chance = 5,
	{text = "Screeech!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -12000, maxDamage = -15000, condition = {type = CONDITION_POISON, startDamage = 2000, interval = 4000}},
	{name ="paralyze", interval = 5000, chance = 30, range = 1, radius = 7, target = false, effect = CONST_ME_POFF},
	{name ="combat", interval = 2000, chance = 65, type = COMBAT_ENERGYDAMAGE, minDamage = -6000, maxDamage = -15000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="speed", interval = 3000, chance = 40, speed = {min = 780, max = 780}, duration = 80000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
}

mType:register(monster)





