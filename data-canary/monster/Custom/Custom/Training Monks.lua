local mType = Game.createMonsterType("Training Monks")
local monster = {}

monster.name = "Training Monks"
monster.description = "a Training Monk, go through the portal for more!"
monster.experience = 0
monster.outfit = {
	lookType = 57,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10000000
monster.maxHealth = 10000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 3128
monster.speed = 0
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = false,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
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
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1}
}

monster.defenses = {
	defense = 0,
	armor = 0
}

monster.loot = {
	{id = 2815, chance = 10000},
	{id = 2853, chance = 100000, child = {
			{id = 2914, chance = 6666},
			{id = 3050, chance = 1428},
			{id = 3289, chance = 3333},
			{name = "bread", chance = 20000, maxCount = 3}
		}
	},
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "leather armor", chance = 10000},
	{name = "sandals", chance = 6666}
}

mType:register(monster)



