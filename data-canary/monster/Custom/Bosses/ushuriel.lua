local mType = Game.createMonsterType("Ushuriel")
local monster = {}

monster.name = "Ushuriel"
monster.description = "Ushuriel"
monster.experience = Leviathan
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 95,
	lookLegs = 19,
	lookFeet = 112,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75000
monster.maxHealth = 75000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 350
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
	canPushCreatures = true,
	staticAttackChance = 85,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, minDamage = -1442, maxDamage = -1875},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -2884, maxDamage = -3750, length = 10, spread = 0, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, radius = 5, target = false, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 24, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, radius = 6, target = false, effect = CONST_ME_ICETORNADO},
	{name ="drunk", interval = 3000, chance = 38, drunkenness = 25, duration = 10000, radius = 6, target = false, effect = CONST_ME_SOUND_PURPLE},
	{name ="condition", interval = 2000, chance = 25, type = CONDITION_ENERGY, startDamage = 0, tick = 10000, minDamage = -2884, maxDamage = -3750, radius = 4, target = false, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 2400, maxDamage = 4500, effect = CONST_ME_MAGIC_GREEN},
	{name ="speed", interval = 1000, chance = 4, speed = {min = 400, max = 400}, duration = 7000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 8},
	{name = "platinum coin", chance = 70000, maxCount = 10},
	{name = "experience scroll", chance = 1000, maxCount = 1},	
	{name = "green gem", chance = 1850},
	{name = "blue gem", chance = 1750},
	{name = "green gem", chance = 1500},
	{name = "violet gem", chance = 750},
	{name = "demon helmet", chance = 750},
	{name = "demon legs", chance = 750},
	{name = "demon shield", chance = 750},
	{id = 6529, chance = 750}, -- soft boots
	{name = "Huge Chunk of Crude Iron", chance = 250},
	{name = "Damaged Steel Helmet", chance = 1300, unique = true },
	{name = "flask of warrior's sweat", chance = 500},	
	-- Reward Box
	{id = 50854, chance = 15},
}

mType:register(monster)




