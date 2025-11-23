local mType = Game.createMonsterType("ushuriel")
local monster = {}

monster.name = "Ushuriel"
monster.description = "Ushuriel"
monster.experience = 1000000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 95,
	lookLegs = 19,
	lookFeet = 112,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500000
monster.maxHealth = 500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 350
monster.summonCost = 0

monster.changeTarget = {
	interval = 20,
	chance = 8
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
	{name ="melee", interval = 2000, chance = 100, skill = 400, attack = 400},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -2000, length = 10, spread = 0, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_DEATHDAMAGE, minDamage = -30, maxDamage = -2000, radius = 5, target = false, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -1000, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -500, maxDamage = -1000, radius = 6, target = false, effect = CONST_ME_ICETORNADO},
	{name ="drunk", interval = 3000, chance = 50, drunkenness = 25, duration = 10000, radius = 6, target = false, effect = CONST_ME_SOUND_PURPLE},
	{name ="condition", interval = 2000, chance = 100, type = CONDITION_ENERGY, startDamage = 0, tick = 10000, minDamage = -2000, maxDamage = -3000, radius = 4, target = false, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, effect = CONST_ME_MAGIC_GREEN},
	{name ="speed", interval = 1000, chance = 4, speed = {min = 400, max = 400}, duration = 7000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 20},
	{id = 3046, chance = 50000},
	{name = "crown shield", chance = 500},
	{id = 3410, chance = 5000},
	{name = "vampire shield", chance = 5000},
	{name = "experience scroll", chance = 3000},
	{id = 9743, chance = 2500}
}

mType:register(monster)



