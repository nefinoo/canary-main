local mType = Game.createMonsterType("dragon lord")
local monster = {}

monster.name = "dragon lord"
monster.description = "a dragon lord"
monster.experience = 2100
monster.outfit = {
	lookType = 39,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1900
monster.maxHealth = 1900
monster.runHealth = 300
monster.race = "blood"
monster.corpse = 5984
monster.speed = 240
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
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "ZCHHHHH", yell = true},
	{text = "YOU WILL BURN!", yell = true}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 90},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -80, maxDamage = -250},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -180, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 15, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_FIREDAMAGE, minDamage = -70, maxDamage = -250, length = 8, spread = 3, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 57, maxDamage = 93, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "dragon ham", chance = 20000, maxCount = 2},
	{name = "golden mug", chance = 1818},
	{id = 2842, chance = 3333},
	{name = "broadsword", chance = 5000},
	{name = "royal helmet", chance = 588},
	{id = 3361, chance = 333},
	{name = "royal spear", chance = 2000, maxCount = 2},
	{id = 3449, chance = 2500, maxCount = 5},
	{name = "power bolt", chance = 2222, maxCount = 10},
	{name = "green mushroom", chance = 6666},
	{name = "red dragon leather", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "small emerald", chance = 833, maxCount = 2},
			{name = "fire sword", chance = 1428},
			{name = "small sapphire", chance = 2222, maxCount = 2},
			{name = "tower shield", chance = 1333},
			{name = "dragon slayer", chance = 1033},
			{name = "dragon lance", chance = 909},
			{name = "red dragon scale", chance = 5000}
		}
	}
}

mType:register(monster)



