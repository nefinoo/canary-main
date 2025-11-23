local mType = Game.createMonsterType("stalker")
local monster = {}

monster.name = "stalker"
monster.description = "a stalker"
monster.experience = 90
monster.outfit = {
	lookType = 128,
	lookHead = 95,
	lookBody = 116,
	lookLegs = 95,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150
monster.maxHealth = 150
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 210
monster.summonCost = 0

monster.changeTarget = {
	interval = 20,
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
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 40, attack = 30},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -20, maxDamage = -30, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 10,
	armor = 14,
	{name ="invisible", interval = 1000, chance = 25, duration = 9000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 2853, chance = 100000, child = {
			{name = "blank rune", chance = 4000},
			{name = "obsidian lance", chance = 2000},
			{name = "brass legs", chance = 3333}
		}
	},
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "leather legs", chance = 6666}
}

mType:register(monster)



