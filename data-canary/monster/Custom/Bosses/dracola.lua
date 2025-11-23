local mType = Game.createMonsterType("dracola")
local monster = {}

monster.name = "dracola"
monster.description = "a dracola"
monster.experience = 7750
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15850
monster.maxHealth = 15850
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6307
monster.speed = 410
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
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
	interval = 2000,
	chance = 5,
	{text = "DEATH CAN'T STOP MY HUNGER!", yell = true}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 85, attack = 85},
	{name ="melee", interval = 2000, chance = 20, minDamage = -300, maxDamage = -395},
	{name ="combat", interval = 3000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -800, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -120, maxDamage = -390, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 23, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -180, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -600, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -685, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -600, length = 8, spread = 3, effect = CONST_ME_MAGIC_GREEN},
	{name ="condition", interval = 1000, chance = 20, type = CONDITION_DROWN, startDamage = 0, tick = 5000, length = 8, spread = 3, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 39,
	armor = 40
}

monster.loot = {
	{name = "platinum coin", chance = 20000, maxCount = 8},
	{name = "demonic essence", chance = 1000, maxCount = 4},
	{name = "dracola's eye", chance = 100000}
}

mType:register(monster)



