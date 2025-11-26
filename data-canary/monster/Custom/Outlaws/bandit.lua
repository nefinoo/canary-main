local mType = Game.createMonsterType("bandit")
local monster = {}

monster.name = "bandit"
monster.description = "a bandit"
monster.experience = 65
monster.outfit = {
	lookType = 129,
	lookHead = 58,
	lookBody = 59,
	lookLegs = 45,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 245
monster.maxHealth = 245
monster.runHealth = 25
monster.race = "blood"
monster.corpse = 6080
monster.speed = 180
monster.summonCost = 450

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
	pushable = true,
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
	{text = "Your money or your life!", yell = false},
	{text = "Hand me your purse!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, skill = 47, attack = 40}
}

monster.defenses = {
	defense = 15,
	armor = 11
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 15},
	{name = "hatchet", chance = 6666},
	{id = 3274, chance = 5000},
	{name = "studded armor", chance = 20000},
	{name = "copper shield", chance = 6666},
	{name = "leather legs", chance = 10000},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 2853, chance = 100000, child = {
			{name = "white mushroom", chance = 20000, maxCount = 2}
		}
	}
}

mType:register(monster)




