local mType = Game.createMonsterType("quara mantassin scout")
local monster = {}

monster.name = "quara mantassin scout"
monster.description = "a quara mantassin scout"
monster.experience = 100
monster.outfit = {
	lookType = 72,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 220
monster.maxHealth = 220
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6064
monster.speed = 270
monster.summonCost = 480

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
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
	{text = "Zuerk Pachak!", yell = false},
	{text = "Shrrrr", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 60, attack = 55}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="invisible", interval = 1000, chance = 30, duration = 5000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "shrimp", chance = 20000, maxCount = 5},
	{name = "fish fin", chance = 2000},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "two handed sword", chance = 1818},
	{id = 2853, chance = 100000, child = {
			{name = "fish fin", chance = 3333},
			{id = 3114, chance = 4000},
			{id = 3049, chance = 1250},
			{name = "small sapphire", chance = 1400}
		}
	}
}

mType:register(monster)



