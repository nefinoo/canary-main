local mType = Game.createMonsterType("enlightened of the cult")
local monster = {}

monster.name = "enlightened of the cult"
monster.description = "a enlightened of the cult"
monster.experience = 500
monster.outfit = {
	lookType = 193,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 700
monster.maxHealth = 700
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 220
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
	staticAttackChance = 50,
	targetDistance = 5,
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
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = -7},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -30, maxDamage = -120},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_LIFEDRAIN, minDamage = -30, maxDamage = -140, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="drunk", interval = 1000, chance = 15, drunkenness = 25, duration = 10000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_PHYSICALDAMAGE, minDamage = -70, maxDamage = -185, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA}
}

monster.defenses = {
	defense = 20,
	armor = 15,
	{name ="invisible", interval = 2000, chance = 15, duration = 6000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 2
monster.summons = {
	{name = "Crypt Shambler", chance = 100, interval = 2000, max = 2},
	{name = "Ghost", chance = 100, interval = 2000, max = 2}
}

monster.loot = {
	{name = "gold coin", chance = 47831, maxCount = 82},
	{name = "cape", chance = 5000},
	{name = "wand of inferno", chance = 1111},
	{id = 5801, chance = 909},
	{id = 3051, chance = 1000},
	{name = "platinum amulet", chance = 909},
	{id = 7426, chance = 1009},
	{id = 7991, chance = 400},
	{id = 2853, chance = 100000, child = {
			{name = "piggy bank", chance = 1333},
			{id = 6087, chance = 1428},
			{name = "pirate voodoo doll", chance = 555},
			{name = "small sapphire", chance = 1538, maxCount = 2},
			{name = "skull staff", chance = 500},
			{name = "protection amulet", chance = 1000},
			{id = 5669, chance = 400}
		}
	}
}

mType:register(monster)



