local mType = Game.createMonsterType("Infernalist")
local monster = {}

monster.name = "Infernalist"
monster.description = "an infernalist"
monster.experience = 3000000
monster.outfit = {
	lookType = 130,
	lookHead = 78,
	lookBody = 76,
	lookLegs = 94,
	lookFeet = 115,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 1500000
monster.maxHealth = 1500000
monster.runHealth = 1150
monster.race = "blood"
monster.corpse = 6080
monster.speed = 260
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
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
	staticAttackChance = 95,
	targetDistance = 3,
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
	{text = "Feel the heat of battle!", yell = false},
	{text = "It's cooking time!", yell = false},
	{text = "Nothing will remain but your scorched bones!", yell = false},
	{text = "Some like it hot!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -0, maxDamage = -10000 },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -6500, maxDamage = -18000, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -9000, maxDamage = -18000, range = 7, radius = 3, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -5300, maxDamage = -12000, range = 7, radius = 3, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_TELEPORT, target = true },
	{ name = "firefield", interval = 2000, chance = 15, range = 7, radius = 3, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -15000, maxDamage = -25000, length = 8, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_PHYSICALDAMAGE, minDamage = -10000, maxDamage = -15000, radius = 2, effect = CONST_ME_EXPLOSIONAREA, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 21300, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "orange backpack", chance = 100},
	{name = "platinum coin", chance = 10000, maxCount = 10},
	{name = "experience scroll", chance = 1500},
	{id = 3006, chance = 2600 },
	{ name = "magic sulphur", chance = 600 },
}

mType:register(monster)




