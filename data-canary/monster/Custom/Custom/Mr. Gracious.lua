local mType = Game.createMonsterType("Mr. Gracious")
local monster = {}

monster.name = "Mr. Gracious"
monster.description = "Mr. Gracious"
monster.experience = 100000000
monster.outfit = {
	lookType = 22,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 35000000
monster.maxHealth = 35000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6017
monster.speed = 180
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 60
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
	interval = 3000,
	chance = 50,
	{text = "Please leve me alone, I didn't do anything to you!", yell = true},
	{text = "That hurt!", yell = true},
	{text = "Why are you hitting me?", yell = true}
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
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
}

monster.defenses = {
	defense = 2,
	armor = 1
}

monster.loot = {
	{name = "meat", chance = 50, maxCount = 25},
	{name = "ham", chance = 50, maxCount = 50}
}

mType:register(monster)



