local mType = Game.createMonsterType("slick water elemental")
local monster = {}

monster.name = "Iceling"
monster.description = "an iceling"
monster.experience = 100000
monster.outfit = {
	lookType = 286,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 55000
monster.maxHealth = 55000
monster.runHealth = 1
monster.race = "blood"
monster.corpse = 7344
monster.speed = 300
monster.summonCost = 0

monster.changeTarget = {
	interval = 300,
	chance = 15
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
	staticAttackChance = 85,
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
	{text = "Blubb", yell = false},
	{text = "Splipsh Splash", yell = false}
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
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 55, attack = 55},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -100, maxDamage = -500, range = 6, radius = 1, target = true, shootEffect = CONST_ANI_SNOWBALL},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -100, maxDamage = -500, range = 4, radius = 1, target = true, shootEffect = CONST_ANI_SMALLICE}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 90, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 10},
	{id = 3673, chance = 50},
	{name = "experience scroll", chance = 2000},
	{id = 9743, chance = 2500}
}

mType:register(monster)



