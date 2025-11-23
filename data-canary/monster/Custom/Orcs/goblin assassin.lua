local mType = Game.createMonsterType("goblin assassin")
local monster = {}

monster.name = "Goblin Assassin"
monster.description = "a goblin assassin"
monster.experience = 52
monster.outfit = {
	lookType = 296,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75
monster.maxHealth = 75
monster.runHealth = 15
monster.race = "blood"
monster.corpse = 6002
monster.speed = 220
monster.summonCost = 360

monster.changeTarget = {
	interval = 10000,
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
	{text = "Goblin Powahhh!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 5},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -15},
	{name ="drunk", interval = 5000, chance = 15, drunkenness = 25, duration = 10000, shootEffect = CONST_ANI_POISON},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_PHYSICALDAMAGE, minDamage = -15, maxDamage = -25, range = 6, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGKNIFE}
}

monster.defenses = {
	defense = 0,
	armor = 1,
	{name ="invisible", interval = 7500, chance = 10, duration = 5000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 9},
	{id = 3578, chance = 20000},
	{id = 3120, chance = 10000},
	{name = "leather helmet", chance = 10000},
	{id = 3115, chance = 10000},
	{id = 2853, chance = 100000, child = {
			{name = "small stone", chance = 20000, maxCount = 3},
			{name = "bone club", chance = 10000},
			{name = "short sword", chance = 10000},
			{name = "small axe", chance = 10000},
			{name = "dagger", chance = 10000}
		}
	}
}

mType:register(monster)



