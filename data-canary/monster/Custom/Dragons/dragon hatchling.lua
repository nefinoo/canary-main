local mType = Game.createMonsterType("dragon hatchling")
local monster = {}

monster.name = "dragon hatchling"
monster.description = "a dragon hatchling"
monster.experience = 185
monster.outfit = {
	lookType = 271,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 380
monster.maxHealth = 380
monster.runHealth = 80
monster.race = "blood"
monster.corpse = 7621
monster.speed = 170
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
	interval = 5000,
	chance = 50,
	{text = "Fchu?", yell = false},
	{text = "Rooawwrr", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -6},
	{type = COMBAT_EARTHDAMAGE, percent = 60},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 30, attack = 28},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_FIREDAMAGE, minDamage = -10, maxDamage = -60, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_LIFEDRAIN, minDamage = -20, maxDamage = -40, length = 8, spread = 3, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 38,
	armor = 25,
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_HEALING, minDamage = 8, maxDamage = 33, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "health potion", chance = 5000},
	{name = "dragon ham", chance = 5000},
	{name = "gold coin", chance = 100000, maxCount = 26},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 25}
		}
	}
}

mType:register(monster)



