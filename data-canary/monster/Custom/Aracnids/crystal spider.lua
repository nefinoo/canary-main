local mType = Game.createMonsterType("crystal spider")
local monster = {}

monster.name = "Crystal Spider"
monster.description = "a crystal spider"
monster.experience = 900
monster.outfit = {
	lookType = 263,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1250
monster.maxHealth = 1250
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 7344
monster.speed = 340
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
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
	canPushCreatures = false,
	staticAttackChance = 60,
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
	interval = 2000,
	chance = 5,
	{text = "Screeech!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -50, maxDamage = -240, condition = {type = CONDITION_POISON, startDamage = 20, interval = 4000}},
	{name ="speed", interval = 2000, chance = 20, speed = {min = -850, max = -850}, duration = 8000, range = 7, radius = 7, target = false, effect = CONST_ME_POFF},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -60, maxDamage = -150, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="speed", interval = 3000, chance = 40, speed = {min = 380, max = 380}, duration = 80000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 95},
	{name = "plate armor", chance = 3333},
	{name = "knight armor", chance = 1428},
	{name = "steel helmet", chance = 3555},
	{name = "crystal mace", chance = 1111},
	{name = "platinum amulet", chance = 1222},
	{name = "sapphire hammer", chance = 1777},
	{id = 2853, chance = 100000, child = {
			{name = "crystal sword", chance = 1555},
			{name = "knight legs", chance = 1000},
			{name = "sniper arrow", chance = 1777, maxCount = 7},
			{name = "shard", chance = 1333}
		}
	}
}

mType:register(monster)



