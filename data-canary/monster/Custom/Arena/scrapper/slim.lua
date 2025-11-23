local mType = Game.createMonsterType("slim")
local monster = {}

monster.name = "Slim"
monster.description = "slim"
monster.experience = 580
monster.outfit = {
	lookType = 101,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1025
monster.maxHealth = 1025
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 7349
monster.speed = 200
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
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
	staticAttackChance = 78,
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
	{text = "Zhroozzzzs.", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -6},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -54, maxDamage = -170},
	{name ="poisonfield", interval = 1000, chance = 50, shootEffect = CONST_ANI_POISON},
	{name ="combat", interval = 3049, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -10, maxDamage = -50, effect = CONST_ME_HITAREA}
}

monster.defenses = {
	defense = 38,
	armor = 36
}

monster.loot = {
}

mType:register(monster)



