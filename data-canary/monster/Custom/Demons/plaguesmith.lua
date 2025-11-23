local mType = Game.createMonsterType("plaguesmith")
local monster = {}

monster.name = "plaguesmith"
monster.description = "a plaguesmith"
monster.experience = 3350
monster.outfit = {
	lookType = 247,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8250
monster.maxHealth = 8250
monster.runHealth = 500
monster.race = "blood"
monster.corpse = 6516
monster.speed = 260
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
	interval = 3000,
	chance = 30,
	{text = "You are looking a bit feverish today!", yell = false},
	{text = "Hachoo!", yell = false},
	{text = "Cough Cough!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, minDamage = -50, maxDamage = -500},
	{name ="melee", interval = 2000, chance = 20, minDamage = -60, maxDamage = -150},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -350, length = 4, spread = 3, effect = CONST_ME_YELLOW_RINGS},
	{name ="speed", interval = 2000, chance = 20, speed = {min = -800, max = -800}, duration = 30000, range = 1, radius = 1, target = true, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 75, maxDamage = 125, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 19, speed = {min = 400, max = 400}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{id = 3120, chance = 20000},
	{name = "dirty cape", chance = 10000},
	{name = "crowbar", chance = 3333},
	{name = "hammer of wrath", chance = 666},
	{id = 2853, chance = 100000, child = {
			{id = 3361, chance = 2333},
			{name = "steel boots", chance = 788},
			{name = "battle hammer", chance = 6667},
			{name = "steel shield", chance = 10000},
			{name = "soul orb", chance = 1538},
			{id = 15827, chance = 2000},
			{id = 3093, chance = 2222}
		}
	}
}

mType:register(monster)



