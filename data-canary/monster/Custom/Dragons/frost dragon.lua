local mType = Game.createMonsterType("frost dragon")
local monster = {}

monster.name = "Frost Dragon"
monster.description = "a frost dragon"
monster.experience = 2300
monster.outfit = {
	lookType = 248,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1800
monster.maxHealth = 1800
monster.runHealth = 250
monster.race = "undead"
monster.corpse = 7091
monster.speed = 260
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 6
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
	staticAttackChance = 70,
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
	{text = "YOU WILL FREEZE!", yell = true},
	{text = "ZCHHHHH!", yell = true},
	{text = "I am so cool", yell = true},
	{text = "Chill out!.", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 68, attack = 120},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -80, maxDamage = -180, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_HITAREA},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -260, length = 7, spread = 3, effect = CONST_ME_POFF},
	{name ="melee", interval = 2000, chance = 19, minDamage = 0, maxDamage = -70},
	{name ="speed", interval = 4000, chance = 25, speed = {min = -600, max = -600}, duration = 50000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 80, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "dragon ham", chance = 33000},
	{name = "golden mug", chance = 1968},
	{id = 1973, chance = 5222},
	{name = "shard", chance = 2777},
	{name = "royal helmet", chance = 1200},
	{name = "ice rapier", chance = 1620},
	{id = 3361, chance = 855},
	{name = "power bolt", chance = 3500},
	{name = "green mushroom", chance = 8000},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 88888, maxCount = 63},
			{name = "small sapphire", chance = 1483},
			{name = "tower shield", chance = 2200},
			{id = 7441, chance = 2900},
			{name = "dragon slayer", chance = 885},
			{id = 3051, chance = 2333}
		}
	}
}

mType:register(monster)



