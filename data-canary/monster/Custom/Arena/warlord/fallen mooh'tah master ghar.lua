local mType = Game.createMonsterType("fallen mooh'tah master ghar")
local monster = {}

monster.name = "Fallen Mooh'tah Master Ghar"
monster.description = "fallen mooh'tah master ghar"
monster.experience = 4400
monster.outfit = {
	lookType = 29,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8000
monster.maxHealth = 8000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 7349
monster.speed = 190
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
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 78,
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
	{text = "I will finish you!", yell = false},
	{text = "You are no match for a master of the Mooh'Tha!", yell = false},
	{text = "I might be fallen but you will fall before me!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -525, condition = { type = CONDITION_POISON, totalDamage = 18, interval = 4000 } },
	{ name = "combat", interval = 6000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -80, maxDamage = -300, length = 8, spread = 0, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 3000, chance = 45, type = COMBAT_FIREDAMAGE, minDamage = -80, maxDamage = -400, radius = 5, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 4000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -80, maxDamage = -270, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 4500, chance = 40, minDamage = -10, maxDamage = -200, range = 10, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "combat", interval = 5000, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -60, maxDamage = -300, length = 8, spread = 0, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 33,
	armor = 30,
}

monster.loot = {
}

mType:register(monster)



