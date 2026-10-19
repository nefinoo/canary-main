local mType = Game.createMonsterType("minotaur guard")
local monster = {}

monster.name = "minotaur guard"
monster.description = "a minotaur guard"
monster.experience = 160
monster.outfit = {
	lookType = 29,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 185
monster.maxHealth = 185
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5983
monster.speed = 190
monster.summonCost = 550

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
	{text = "Kirll Karrrl!", yell = false},
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
	{name ="melee", interval = 2000, chance = 100, skill = 50, attack = 35}
}

monster.defenses = {
	defense = 25,
	armor = 15
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "meat", chance = 70000, maxCount = 3},
	{name = "double axe", chance = 5000},
	{name = "leather legs", chance = 10000},
	{name = "minotaur leather", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{id = 3274, chance = 6666},
			{name = "fishing rod", chance = 5000},
			{name = "chain legs", chance = 5000},
			{name = "chain helmet", chance = 10000},
			{name = "brass armor", chance = 2500},
			{name = "battle shield", chance = 10000}
		}
	}
}

mType:register(monster)




