local mType = Game.createMonsterType("scarab")
local monster = {}

monster.name = "scarab"
monster.description = "a scarab"
monster.experience = 120000
monster.outfit = {
	lookType = 83,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 320
monster.maxHealth = 320
monster.runHealth = 80
monster.race = "blood"
monster.corpse = 6024
monster.speed = 170
monster.summonCost = 395

monster.changeTarget = {
	interval = 2000,
	chance = 0
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
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 7},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -10, maxDamage = -70},
	{name ="poisonfield", interval = 800, chance = 40, radius = 1, target = false, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 15,
	armor = 12,
	{name ="speed", interval = 1000, chance = 5, speed = {min = 250, max = 250}, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 80000, maxCount = 50},
	{id = 2853, chance = 100000, child = {
			{name = "meat", chance = 20000, maxCount = 3},
			{name = "arrow", chance = 20000, maxCount = 4},
			{name = "daramian mace", chance = 2500},
			{name = "heavy machete", chance = 2500},
			{name = "scarab coin", chance = 1000},
			{name = "small emerald", chance = 2000, maxCount = 2},
			{name = "small amethyst", chance = 2000, maxCount = 3}
		}
	}
}

mType:register(monster)





