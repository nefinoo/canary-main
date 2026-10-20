local mType = Game.createMonsterType("quara predator")
local monster = {}

monster.name = "quara predator"
monster.description = "a quara predator"
monster.experience = 285000000
monster.outfit = {
	lookType = 20,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 105000
monster.maxHealth = 105000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6067
monster.speed = 520
monster.summonCost = 0

monster.changeTarget = {
	interval = 1000,
	chance = 30
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
	{text = "Rraaar!", yell = false},
	{text = "Rrrah!", yell = false}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 80, type = COMBAT_ENERGYDAMAGE, minDamage = -2600, maxDamage = -3400, range = 1, radius = 1, target = true},
	{name ="combat", interval = 3000, chance = 65, type = COMBAT_DEATHDAMAGE, minDamage = -1300, maxDamage = -1800, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ICETORNADO},
	{name ="combat", interval = 4000, chance = 60, type = COMBAT_ICEDAMAGE, minDamage = -1300, maxDamage = -2100, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_FIREWORK_BLUE}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="speed", interval = 10000, chance = 40, speed = {min = 210, max = 210}, duration = 20000, effect = CONST_ME_MAGIC_GREEN},
	{name ="combat", interval = 4000, chance = 30, type = COMBAT_HEALING, minDamage = 1200, maxDamage = 1800, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "salmon", chance = 2000},
	{name = "northern pike", chance = 2000},
	{name = "worm", chance = 5000, maxCount = 25},
	{name = "rainbow trout", chance = 11000},
	{name = "green perch", chance = 13000},
	{name = "platinum coin", chance = 100000, maxCount = 80},
	{name = "platinum coin", chance = 70000, maxCount = 100},
	{name = "experience scroll", chance = 3000, maxCount = 3},
	{id = 893, chance = 5}
}

mType:register(monster)





