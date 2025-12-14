local mType = Game.createMonsterType("undead dragon")
local monster = {}

monster.name = "undead dragon"
monster.description = "a undead dragon"
monster.experience = 65000
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 45000
monster.maxHealth = 45000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6306
monster.speed = 300
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	chance = 10,
	{text = "FEEEED MY ETERNAL HUNGER!", yell = true},
	{text = "I SENSE LIFE", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 8},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -2730, maxDamage = -3500},
	{name ="melee", interval = 4000, chance = 20, minDamage = -2730, maxDamage = -3500},
	{name ="combat", interval = 3000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -2730, maxDamage = -3500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -2730, maxDamage = -3500, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 23, type = COMBAT_PHYSICALDAMAGE, minDamage = -2730, maxDamage = -3500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -2730, maxDamage = -3500, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -2730, maxDamage = -3500, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -2730, maxDamage = -3500, length = 8, spread = 3, effect = CONST_ME_MAGIC_GREEN},
	{name ="condition", interval = 1000, chance = 20, type = CONDITION_BLEEDING, startDamage = 0, tick = 5000, length = 8, spread = 3, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 35,
	armor = 5
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "platinum coin", chance = 35000, maxCount = 3},
	{id = 3121, chance = 15000},
	{name = "broadsword", chance = 20000},
	{name = "broadsword", chance = 3000},
	{name = "broadsword", chance = 8000},
	{name = "broadsword", chance = 800},
	{name = "broadsword", chance = 1000},
	{name = "broadsword", chance = 4000},
	{id = 2853, chance = 100000, child = {
			{name = "demonic essence", chance = 1818},
			{name = "soul orb", chance = 1538},
			{name = "broadsword", chance = 4000},
			{name = "power bolt", chance = 4000, maxCount = 15}
		}
	}
}

mType:register(monster)




