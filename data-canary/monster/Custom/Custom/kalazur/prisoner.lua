local mType = Game.createMonsterType("prisoner")
local monster = {}

monster.name = "prisoner"
monster.description = "a prisoner"
monster.experience = 2500000
monster.outfit = {
	lookType = 232,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1500000
monster.maxHealth = 1500000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6310
monster.speed = 350
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
	chance = 30,
	{text = "Forgive Meeeee!", yell = false},
	{text = "Mouuuurn meeee!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -5000, maxDamage = -9400},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -1500, maxDamage = -8500, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_MAGIC_RED},
	{name ="speed", interval = 2000, chance = 20, speed = {min = -400, max = -400}, duration = 30000, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1100, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -10020, range = 7, radius = 6, target = false, effect = CONST_ME_YELLOW_RINGS}
}

monster.defenses = {
	defense = 35,
	armor = 25,
	{name ="speed", interval = 1000, chance = 35, speed = {min = 370, max = 370}, duration = 30000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100, description2 = "gold coin"},
	{name = "worm", chance = 20000, maxCount = 30, description2 = "worm"},
	{name = "rotten meat", chance = 20000, description2 = "rotten meat"},
	{name = "blank rune", chance = 10000, description2 = "blank rune"},
	{name = "legion helmet", chance = 6667, description2 = "legion helmet"},
	{id = 5806, chance = 1000, description2 = "silver goblet"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{name = "plate armor", chance = 3333, description2 = "plate armor"},
			{name = "scale armor", chance = 10000, description2 = "scale armor"},
			{name = "titan axe", chance = 800, description2 = "titan axe"},
			{name = "skeleton decoration", chance = 2000, description2 = "skeleton decoration"},
			{id = 5801, chance = 1538, description2 = "key ring"},
			{name = "stone skin amulet", chance = 2200, maxCount = 5, description2 = "stone skin amulet"}
		}
	}
}

mType:register(monster)




