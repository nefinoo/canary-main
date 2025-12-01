local mType = Game.createMonsterType("Wyrm")
local monster = {}

monster.name = "Wyrm"
monster.description = "a wyrm"
monster.experience = 12000000
monster.outfit = {
	lookType = 291,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1000000
monster.maxHealth = 1000000
monster.runHealth = 1
monster.race = "blood"
monster.corpse = 8113
monster.speed = 300
monster.summonCost = 0

monster.changeTarget = {
	interval = 6000,
	chance = 50
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
	staticAttackChance = 50,
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
	chance = 5,
	{text = "GROOOOAAAAAAAAR!", yell = false},
	{text = "GRRR!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
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
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -4000, range = 1, radius = 1, target = true},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -3000, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_HITAREA},
	{name ="condition", interval = 2000, chance = 75, type = CONDITION_ENERGY, startDamage = 0, tick = 10000, minDamage = -2000, maxDamage = -5000, range = 1, radius = 3, target = false, length = 10, spread = 0, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -4000, maxDamage = -5000, range = 1, radius = 1, target = true, length = 7, spread = 3, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 31,
	armor = 30,
	{name ="combat", interval = 2000, chance = 65, type = COMBAT_HEALING, minDamage = 25000, maxDamage = 30000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "salmon", chance = 2000},
	{name = "northern pike", chance = 2000},
	{name = "worm", chance = 5000, maxCount = 25},
	{name = "rainbow trout", chance = 2000},
	{name = "green perch", chance = 2000},
	{name = "assassin star", chance = 5},
	{name = "justice seeker", chance = 5},
	{name = "experience scroll", chance = 3000},
	-- {id = 893, chance = 5},
	{name = "deadly wand", chance = 5}
}

mType:register(monster)




