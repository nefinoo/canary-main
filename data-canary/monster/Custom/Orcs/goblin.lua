local mType = Game.createMonsterType("goblin")
local monster = {}

monster.name = "goblin"
monster.description = "a goblin"
monster.experience = 25
monster.outfit = {
	lookType = 61,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50
monster.maxHealth = 50
monster.runHealth = 15
monster.race = "blood"
monster.corpse = 6002
monster.speed = 200
monster.summonCost = 290

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
	{text = "Me have him!", yell = false},
	{text = "Zig Zag! Gobo attack!", yell = false},
	{text = "Help! Goblinkiller!", yell = false},
	{text = "Bugga! Bugga!", yell = false},
	{text = "Me green, me mean!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 15, attack = 10},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_PHYSICALDAMAGE, minDamage = -15, maxDamage = -25, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SMALLSTONE}
}

monster.defenses = {
	defense = 8,
	armor = 6
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 10},
	{name = "machete", chance = 10000},
	{name = "leather helmet", chance = 10000},
	{name = "short sword", chance = 10000},
	{name = "leather armor", chance = 10000},
	{id = 2853, chance = 100000, child = {
			{name = "small axe", chance = 10000},
			{name = "small stone", chance = 20000, maxCount = 4},
			{id = 3578, chance = 20000, maxCount = 2},
			{id = 3115, chance = 10000},
			{id = 3120, chance = 10000},
			{name = "bone club", chance = 10000}
		}
	}
}

mType:register(monster)



