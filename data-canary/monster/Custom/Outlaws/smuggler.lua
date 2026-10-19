local mType = Game.createMonsterType("smuggler")
local monster = {}

monster.name = "smuggler"
monster.description = "a smuggler"
monster.experience = 48
monster.outfit = {
	lookType = 134,
	lookHead = 95,
	lookBody = 0,
	lookLegs = 113,
	lookFeet = 115,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 130
monster.maxHealth = 130
monster.runHealth = 18
monster.race = "blood"
monster.corpse = 6080
monster.speed = 210
monster.summonCost = 390

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
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
	{text = "I will silence you forever!", yell = false},
	{text = "You saw something you shouldn't!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -12},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 23, attack = 19}
}

monster.defenses = {
	defense = 13,
	armor = 10
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "brass armor", chance = 10000},
	{name = "leather helmet", chance = 10000},
	{name = "leather legs", chance = 10000},
	{name = "ham", chance = 20000, maxCount = 2},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 2853, chance = 100000, child = {
			-- {id = 3350, chance = 6666},
			-- {name = "arrow", chance = 10000, maxCount = 15},
			-- {id = 3449, chance = 10000, maxCount = 5},
			{name = "small ruby", chance = 3333, maxCount = 2},
			{name = "orange", chance = 6666, maxCount = 4},
			{name = "roll", chance = 6666, maxCount = 4},
			-- {id = 2920, chance = 20000},
			{name = "brass legs", chance = 3333},
			{name = "green tunic", chance = 2222},
			{name = "dragon necklace", chance = 2500}
		}
	}
}

mType:register(monster)




