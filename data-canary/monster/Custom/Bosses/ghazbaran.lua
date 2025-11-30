local mType = Game.createMonsterType("Ghazbaran")
local monster = {}

monster.name = "Ghazbaran"
monster.description = "Ghazbaran"
monster.experience = 650000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 123,
	lookLegs = 97,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 250000
monster.maxHealth = 250000
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -2884, maxDamage = -3750},
	{name ="melee", interval = 2000, chance = 100, minDamage = -2884, maxDamage = -3750},
	{name ="melee", interval = 3000, chance = 100, minDamage = -2884, maxDamage = -3750},
	{name ="combat", interval = 4000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, length = 8, spread = 0, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -2884, maxDamage = -3750, range = 14, radius = 5, target = false, effect = CONST_ME_POFF},
	{name ="combat", interval = 4000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -2884, maxDamage = -3750, range = 7, radius = 13, target = false, effect = CONST_ME_BLOCKHIT},
	{name ="combat", interval = 4000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -2884, maxDamage = -3750, radius = 14, target = false, effect = CONST_ME_LOSEENERGY},
	{name ="melee", interval = 3000, chance = 100, minDamage = -2884, maxDamage = -3750}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 4000, chance = 80, speed = {min = 440, max = 440}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 3
monster.summons = {
	{name = "deathslicer", chance = 20, interval = 1000, max = 3}
}

monster.loot = {
	{id = 6529, chance = 500},
	{name = "crystal coin", chance = 100000, maxCount = 20},
	{name = "demon armor", chance = 5000},
	{name = "demon legs", chance = 5000},
	{name = "experience scroll", chance = 3000},
	{name = "deadly wand", chance = 5},
	{name = "Huge Chunk of Crude Iron", chance = 250},
	{name = "flask of warrior's sweat", chance = 500},
	{name = "Damaged Steel Helmet", chance = 13000, unique = true },
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




