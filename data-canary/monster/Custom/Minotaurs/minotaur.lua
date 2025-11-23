local mType = Game.createMonsterType("minotaur")
local monster = {}

monster.name = "minotaur"
monster.description = "a minotaur"
monster.experience = 50
monster.outfit = {
	lookType = 25,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 100
monster.maxHealth = 100
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5969
monster.speed = 170
monster.summonCost = 330

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
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
	{text = "Kaplar!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 25, attack = 15}
}

monster.defenses = {
	defense = 11,
	armor = 11
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 28},
	{name = "chain armor", chance = 10000},
	{id = 3274, chance = 10000},
	{name = "leather legs", chance = 10000},
	{id = 3457, chance = 10000},
	{name = "minotaur leather", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "chain helmet", chance = 10000},
			{name = "gold coin", chance = 20000, maxCount = 5},
			{name = "brass helmet", chance = 10000},
			{name = "plate shield", chance = 10000},
			{name = "mace", chance = 10000},
			{name = "bronze amulet", chance = 2500}
		}
	}
}

mType:register(monster)



