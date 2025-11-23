local mType = Game.createMonsterType("great battlesmith")
local monster = {}

monster.name = "Great Battlesmith"
monster.description = "a Great Battlesmith"
monster.experience = 70000
monster.outfit = {
	lookType = 304,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 100000
monster.maxHealth = 100000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 9743
monster.speed = 300
monster.summonCost = 0

monster.changeTarget = {
	interval = 420,
	chance = 1
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
	interval = 2200,
	chance = 75,
	{text = "MWAHAHAHAH", yell = true},
	{text = "Rawr!", yell = false}
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
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -600, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -500, maxDamage = -600, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -600, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 45,
	armor = 10,
	{name ="combat", interval = 2300, chance = 75, type = COMBAT_HEALING, minDamage = 1337, maxDamage = 1337, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 4200, chance = 50, speed = {min = 250, max = 250}, duration = 10000, effect = CONST_ME_MAGIC_GREEN}
}

monster.loot = {
}

mType:register(monster)



