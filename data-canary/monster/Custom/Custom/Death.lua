local mType = Game.createMonsterType("Death")
local monster = {}

monster.name = "Death"
monster.description = "death"
monster.experience = 30000000
monster.outfit = {
	lookType = 300,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7000000
monster.maxHealth = 7000000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 8955
monster.speed = 500
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 100
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
	interval = 2000,
	chance = 100,
	{text = "bllalllblalaaa gaaaa", yell = true},
	{text = "bllalllblalaaa gaaaa", yell = true}
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
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -2},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -1000, maxDamage = -5000},
	{name ="combat", interval = 1000, chance = 70, type = COMBAT_ENERGYDAMAGE, minDamage = -2000, maxDamage = -3000, length = 4, spread = 3, effect = CONST_ME_PURPLEENERGY},
	{name ="combat", interval = 1000, chance = 80, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -1000, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS}
}

monster.defenses = {
	defense = 50,
	armor = 60,
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 12000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
}

mType:register(monster)




