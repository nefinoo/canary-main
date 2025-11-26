local mType = Game.createMonsterType("fire devil")
local monster = {}

monster.name = "fire devil"
monster.description = "a fire devil"
monster.experience = 110
monster.outfit = {
	lookType = 40,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 200
monster.maxHealth = 200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5985
monster.speed = 190
monster.summonCost = 530

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
	targetDistance = 4,
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
	{text = "Hot, eh?", yell = false},
	{text = "Hell, oh hell!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 25},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 15}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -20, maxDamage = -50},
	{name ="combat", interval = 4000, chance = 12, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -90, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -20, maxDamage = -50, range = 7, radius = 2, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 15,
	armor = 13
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "meat", chance = 33333, maxCount = 3},
	{name = "necrotic rod", chance = 833},
	{id = 2920, chance = 20000},
	{id = 3307, chance = 10000},
	{name = "double axe", chance = 5000},
	{name = "cleaver", chance = 15000},
	{id = 2853, chance = 100000, child = {
			{name = "wand of inferno", chance = 1000},
			{name = "guardian shield", chance = 2857},
			{name = "blank rune", chance = 6666},
			{name = "brown bread", chance = 20000, maxCount = 2},
			{name = "small amethyst", chance = 1666, maxCount = 2},
			{name = "wand of dragonbreath", chance = 833}
		}
	}
}

mType:register(monster)




