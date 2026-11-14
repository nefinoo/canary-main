local mType = Game.createMonsterType("giant frostbeast")
local monster = {}

monster.name = "giant frostbeast"
monster.description = "a giant frostbeast"
monster.experience = 4500000000
monster.outfit = {
	lookType = 265,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1200000
monster.maxHealth = 1200000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 0
monster.speed = 820
monster.summonCost = 0

monster.changeTarget = {
	interval = 500,
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
	interval = 1500,
	chance = 10,
	{text = "Freee Meeeee!", yell = false},
	{text = "You no be here, you go, you go!", yell = false},
	{text = "Thy blood will quench the soil's thirst!", yell = false},
	{text = "Your existence will end here!", yell = false}
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
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -11000, maxDamage = -12000},
	{name ="combat", interval = 1500, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -4500, maxDamage = -7000, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_ENCHANTEDSPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 18,
	armor = 7,
	{name ="speed", interval = 4000, chance = 40, speed = {min = 0, max = 0}, duration = 0, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.loot = {
}

mType:register(monster)





