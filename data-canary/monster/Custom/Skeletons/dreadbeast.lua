local mType = Game.createMonsterType("dreadbeast")
local monster = {}

monster.name = "Dreadbeast"
monster.description = "a dreadbeast"
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

monster.health = 515
monster.maxHealth = 515
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 3031
monster.speed = 200
monster.summonCost = 800

monster.changeTarget = {
	interval = 60000,
	chance = 10
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = -25},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 70},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -150, maxDamage = -250, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_YELLOWENERGY},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -150, maxDamage = -250, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_PURPLEENERGY}
}

monster.defenses = {
	defense = 36,
	armor = 34
}

monster.loot = {
}

mType:register(monster)



