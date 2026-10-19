local mType = Game.createMonsterType("dworc voodoomaster")
local monster = {}

monster.name = "dworc voodoomaster"
monster.description = "a dworc voodoomaster"
monster.experience = 50000
monster.outfit = {
	lookType = 214,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 80
monster.maxHealth = 80
monster.runHealth = 15
monster.race = "blood"
monster.corpse = 6055
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
	{text = "grak brrretz!", yell = false},
	{text = "grow truk grrrrr.", yell = false},
	{text = "prek tars, dekklep zurk.", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -8},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 22, attack = 13},
	{name ="combat", interval = 1000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -1, maxDamage = -39, range = 1, radius = 1, target = true},
	{name ="speed", interval = 1000, chance = 8, speed = {min = -800, max = -800}, duration = 5000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="drunk", interval = 1000, chance = 10, drunkenness = 25, duration = 10000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA},
	{name = "outfit", interval = 1000, chance = 9, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000, outfitMonster = "chicken" },
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -6, maxDamage = -18, radius = 6, target = false, effect = CONST_ME_POISONAREA},
	{name ="poisonfield", interval = 1000, chance = 13, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON}
}

monster.defenses = {
	defense = 8,
	armor = 3,
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_HEALING, minDamage = 3, maxDamage = 9, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 8, speed = {min = 200, max = 200}, duration = 4000, effect = CONST_ME_MAGIC_RED},
	{name ="invisible", interval = 1000, chance = 5, duration = 3000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "crystal coin", chance = 100000, maxCount = 12},
	{name = "meat", chance = 40000, maxCount = 2},
	{name = "wooden shield", chance = 10000},
	{name = "copper shield", chance = 4000},
	{name = "tusk shield", chance = 100},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 2853, chance = 100000, child = {
			{name = "tribal mask", chance = 50},
			{id = 3002, chance = 80},
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





