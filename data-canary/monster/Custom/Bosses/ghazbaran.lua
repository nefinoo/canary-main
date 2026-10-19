local mType = Game.createMonsterType("Ghazbaran")
local monster = {}

monster.name = "Ghazbaran"
monster.description = "Ghazbaran"
monster.experience = 200000000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 123,
	lookLegs = 97,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75000
monster.maxHealth = 75000
monster.runHealth = 3500
monster.race = "blood"
monster.corpse = 6068
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 50,
	chance = 20
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
	staticAttackChance = 98,
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
	interval = 2200,
	chance = 30,
	{text = "COME AND GIVE ME SOME AMUSEMENT!", yell = true},
	{text = "COME HERE AND DIE!", yell = true},
	{text = "FLAWLESS VICTORY!", yell = true},
	{text = "I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!", yell = true},
	{text = "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", yell = true}
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
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, minDamage = -1442, maxDamage = -1875},
	{name ="melee", interval = 1500, chance = 100, minDamage = -1442, maxDamage = -1875},
	{name ="melee", interval = 1500, chance = 100, minDamage = -1442, maxDamage = -1875},
	{name ="combat", interval = 4000, chance = 45, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, length = 8, spread = 0, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, range = 14, radius = 5, target = false, effect = CONST_ME_POFF},
	{name ="combat", interval = 4000, chance = 45, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, range = 7, radius = 13, target = false, effect = CONST_ME_BLOCKHIT},
	{name ="combat", interval = 4000, chance = 45, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, radius = 14, target = false, effect = CONST_ME_LOSEENERGY},
	{name ="melee", interval = 1500, chance = 100, minDamage = -1442, maxDamage = -1875},
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_HEALING, minDamage = 2400, maxDamage = 4500, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 4000, chance = 80, speed = {min = 440, max = 440}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 3
monster.summons = {
	{name = "deathslicer", chance = 20, interval = 1000, max = 3}
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





