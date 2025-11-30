local mType = Game.createMonsterType("warlock")
local monster = {}

monster.name = "warlock"
monster.description = "a warlock"
monster.experience = 3575
monster.outfit = {
	lookType = 130,
	lookHead = 19,
	lookBody = 71,
	lookLegs = 128,
	lookFeet = 128,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 3500
monster.maxHealth = 3500
monster.runHealth = 800
monster.race = "blood"
monster.corpse = 6080
monster.speed = 220
monster.summonCost = 0

monster.changeTarget = {
	interval = 20,
	chance = 30
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
	{text = "Even a rat is a better mage than you.", yell = false},
	{text = "Learn the secret of our magic! YOUR death!", yell = false},
	{text = "We don't like intruders!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -202, maxDamage = -263},
	{name ="combat", interval = 1000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -85, maxDamage = -263, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_MANADRAIN, minDamage = -75, maxDamage = -263, range = 7, radius = 1, target = true},
	{name ="speed", interval = 1000, chance = 12, speed = {min = -600, max = -600}, duration = 40000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 45, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -263, range = 7, radius = 3, target = true, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 20, range = 7, radius = 2, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -165, maxDamage = -263, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT},
	{name ="speed", interval = 6000, chance = 10, speed = {min = -600, max = -600}, duration = 20000, range = 5, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 30,
	armor = 25,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 300, maxDamage = 450, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 5000, chance = 50, duration = 5000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 1
monster.summons = {
	{name = "stone golem", chance = 10, interval = 1000, max = 1}
}

monster.loot = {
	{name = "red tome", chance = 400},
	{id = 2853, chance = 100000, child = {
			{name = "candlestick", chance = 15000},
			{name = "ring of the sky", chance = 150},
			{name = "small sapphire", chance = 1400, maxCount = 2},
			{name = "gold coin", chance = 80000, maxCount = 50},
			{name = "mind stone", chance = 2500},
			{name = "poison dagger", chance = 5000},
			{name = "skull staff", chance = 1428},
			{name = "golden armor", chance = 588},
			{id = 7991, chance = 2000},
			{name = "cherry", chance = 20000, maxCount = 4},
			{name = "dark mushroom", chance = 6666, maxCount = 5},
			-- {id = 2793, chance = 6666, maxCount = 2}
		}
	},
	{name = "piggy bank", chance = 1400},
	{id = 3007, chance = 1000},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "talon", chance = 1100, maxCount = 2},
	-- {id = 3051, chance = 3000},
	{id = 3509, chance = 10000},
	{name = "bread", chance = 11000}
}

mType:register(monster)




