local mType = Game.createMonsterType("outlawed warrior")
local monster = {}

monster.name = "outlawed warrior"
monster.description = "an outlawed warrior"
monster.experience = 5500
monster.outfit = {
	lookType = 69,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4200
monster.maxHealth = 4200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6007
monster.speed = 350
monster.summonCost = 0

monster.changeTarget = {
	interval = 350,
	chance = 10
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
	canPushItems = false,
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
	interval = 5000,
	chance = 10,
	{text = "Hail Durin!", yell = false}
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
	{ name = "melee", interval = 1000, chance = 100, minDamage = -518, maxDamage = -674 },
}

monster.defenses = {
	defense = 10,
	armor = 8,
	{name ="speed", interval = 2000, chance = 20, speed = {min = 350, max = 350}, duration = 10000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "small diamond", chance = 75000, maxCount = 3},
	{name = "yellow gem", chance = 25000},
	{name = "platinum coin", chance = 25000, maxCount = 3},
	{name = "boots of haste", chance = 1250},
	{name = "magic sword", chance = 100},
	{ id = 3319, chance = 100 }, --stonecutter
	{ id = 3309, chance = 100 }, --thunder hammer
	{name = "magic plate armor", chance = 250},
	{name = "mastermind shield", chance = 250},
	{name = "experience scroll", chance = 500},
	{ name = "iron ore", chance = 1400 },
}

mType:register(monster)




