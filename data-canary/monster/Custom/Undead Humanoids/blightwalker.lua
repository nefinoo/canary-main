local mType = Game.createMonsterType("blightwalker")
local monster = {}

monster.name = "blightwalker"
monster.description = "a blightwalker"
monster.experience = 3350000
monster.outfit = {
	lookType = 246,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8900
monster.maxHealth = 8900
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6354
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
	{text = "I can see you decaying!", yell = false},
	{text = "Let me taste your mortality!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = 40},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 60},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 33},
	{type = COMBAT_HOLYDAMAGE , percent = -30},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450},
	{name ="combat", interval = 1500, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -105, maxDamage = -155, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SMALLSTONE},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -140, maxDamage = -220, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 75, maxDamage = 125, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "bunch of wheat", chance = 5000, maxCount = 3},
	{id = 2920, chance = 10000},
	{id = 3115, chance = 6666},
	{name = "blank rune", chance = 2222},
	{name = "honeycomb", chance = 1100},
	{id = 2853, chance = 100000, child = {
			{id = 3274, chance = 2000},
			{name = "leather legs", chance = 2500},
			{name = "demonic essence", chance = 2222, maxCount = 2},
			{name = "soul orb", chance = 1667},
			{name = "skull staff", chance = 909},
			{name = "scythe", chance = 5000}
		}
	}
}

mType:register(monster)





