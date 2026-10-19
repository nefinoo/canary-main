local mType = Game.createMonsterType("Skeleton Warrior")
local monster = {}

monster.name = "Skeleton Warrior"
monster.description = "a skeleton warrior"
monster.experience = 65000
monster.outfit = {
	lookType = 298,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 45
monster.maxHealth = 45
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 5972
monster.speed = 180
monster.summonCost = 350

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = false,
	canPushCreatures = false,
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
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -10, maxDamage = -40},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -5, maxDamage = -10, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 9,
	armor = 2
}

monster.loot = {
	{name = "gold coin", chance = 90000, maxCount = 15},
	{id = 3115, chance = 3333},
	{id = 2853, chance = 100000, child = {
			{name = "mace", chance = 10000},
			{name = "brass shield", chance = 5000},
			{name = "white mushroom", chance = 90000, maxCount = 3},
			{id = 3115, chance = 2789}
		}
	}
}

mType:register(monster)





