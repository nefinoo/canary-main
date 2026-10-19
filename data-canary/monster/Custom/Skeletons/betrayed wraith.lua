local mType = Game.createMonsterType("betrayed wraith")
local monster = {}

monster.name = "betrayed wraith"
monster.description = "a betrayed wraith"
monster.experience = 3500
monster.outfit = {
	lookType = 233,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4200
monster.maxHealth = 4200
monster.runHealth = 250
monster.race = "blood"
monster.corpse = 6316
monster.speed = 310
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
	chance = 10,
	{text = "Rrrah!", yell = false},
	{text = "Gnarr!", yell = false},
	{text = "Tcharrr!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -350, length = 6, spread = 3, effect = CONST_ME_YELLOW_RINGS},
	{name ="speed", interval = 1000, chance = 25, speed = {min = -600, max = -600}, duration = 3000, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 150, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 4000, chance = 50, duration = 4000, effect = CONST_ME_MAGIC_RED},
	{name ="speed", interval = 1000, chance = 12, speed = {min = 360, max = 360}, duration = 30000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "morning star", chance = 6667},
	{name = "amulet of loss", chance = 900},
	{id = 2853, chance = 100000, child = {
			{id = 6558, chance = 2222},
			{name = "double axe", chance = 5000},
			{name = "fishbone", chance = 10000},
			{name = "skull helmet", chance = 1500},
			{name = "small diamond", chance = 2222, maxCount = 3},
			{name = "worm", chance = 20000, maxCount = 25}
		}
	}
}

mType:register(monster)




