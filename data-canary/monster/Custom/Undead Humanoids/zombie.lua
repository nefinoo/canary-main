local mType = Game.createMonsterType("zombie")
local monster = {}

monster.name = "Zombie"
monster.description = "a zombie"
monster.experience = 280
monster.outfit = {
	lookType = 311,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500
monster.maxHealth = 500
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 9875
monster.speed = 180
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
	illusionable = false,
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
	{text = "Mst.... klll....", yell = false},
	{text = "Whrrrr... ssss.... mmm.... grrrrl", yell = false},
	{text = "Dnnnt... cmmm... clsrrr....", yell = false},
	{text = "Httt.... hmnnsss...", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -40},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -120},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -45, range = 1, radius = 1, target = true}
}

monster.defenses = {
	defense = 10,
	armor = 15
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10, description2 = "worms"},
	{name = "gold coin", chance = 100000, maxCount = 52, description2 = "gps"},
	{id = 2853, chance = 100000, child = {
			{name = "halberd", chance = 2857, description2 = "battle hammer"},
			{name = "mace", chance = 10000, description2 = "mace"},
			{name = "steel helmet", chance = 5000, description2 = "steel helmet"},
			{id = 2920, chance = 20000, description2 = "torch"},
			{name = "mana potion", chance = 4000, description2 = "mana potion"},
			{id = 9808, chance = 3000, description2 = "rusty armor"},
			{id = 3052, chance = 2000, description2 = "life ring"}
		}
	}
}

mType:register(monster)



