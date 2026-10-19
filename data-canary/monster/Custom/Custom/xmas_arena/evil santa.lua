local mType = Game.createMonsterType("evil santa")
local monster = {}

monster.name = "evil santa"
monster.description = "evil santa"
monster.experience = 15000000000
monster.outfit = {
	lookType = 160,
	lookHead = 0,
	lookBody = 132,
	lookLegs = 94,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5000000
monster.maxHealth = 5000000
monster.runHealth = 250
monster.race = "undead"
monster.corpse = 0
monster.speed = 760
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 6
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
	{text = "YOU WILL FREEZE!", yell = true},
	{text = "ZCHHHHH!", yell = true},
	{text = "I am so cool", yell = true},
	{text = "Chill out!.", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = -25},
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
	{name ="melee", interval = 1000, chance = 100, minDamage = -15000, maxDamage = -30000},
	{name ="combat", interval = 1500, chance = 75, type = COMBAT_ICEDAMAGE, minDamage = -8000, maxDamage = -18000, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_ICEATTACK},
	{name ="combat", interval = 1800, chance = 50, type = COMBAT_DROWNDAMAGE, minDamage = -10000, maxDamage = -26000, length = 7, spread = 0, effect = CONST_ME_ICEATTACK},
	{name ="combat", interval = 2000, chance = 29, type = COMBAT_DROWNDAMAGE, minDamage = -4000, maxDamage = -7000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_ICEATTACK},
	{name ="drunk", interval = 2000, chance = 45, drunkenness = 25, duration = 30000, range = 7, radius = 1, target = true, effect = CONST_ME_ICEATTACK}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 25000, maxDamage = 50000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
}

mType:register(monster)





