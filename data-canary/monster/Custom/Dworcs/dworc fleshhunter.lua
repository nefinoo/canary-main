local mType = Game.createMonsterType("dworc fleshhunter")
local monster = {}

monster.name = "dworc fleshhunter"
monster.description = "a dworc fleshhunter"
monster.experience = 35
monster.outfit = {
	lookType = 215,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 85
monster.maxHealth = 85
monster.runHealth = 8
monster.race = "blood"
monster.corpse = 6058
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
	{text = "Grak brrretz!", yell = false},
	{text = "Grow truk grrrrr.", yell = false},
	{text = "Prek tars, dekklep zurk.", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 25, attack = 17, condition = {type = CONDITION_POISON, startDamage = 20, interval = 4000}},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_PHYSICALDAMAGE, minDamage = -5, maxDamage = -15, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGKNIFE}
}

monster.defenses = {
	defense = 8,
	armor = 3
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "crystal coin", chance = 100000, maxCount = 12},
	{name = "meat", chance = 40000, maxCount = 2},
	{name = "wooden shield", chance = 10000},
	{name = "copper shield", chance = 4000},
	{id = 7366, chance = 50, maxCount = 3},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 2853, chance = 100000, child = {
			{name = "didgeridoo", chance = 500},
			{name = "sabre", chance = 6666},
			{name = "chain armor", chance = 5000},
			{name = "machete", chance = 5000},
			{name = "studded club", chance = 5000},
			{name = "piece of draconian steel", chance = 500},
			{id = 2875, chance = 20000}
		}
	}
}

mType:register(monster)




