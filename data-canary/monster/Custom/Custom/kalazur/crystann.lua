local mType = Game.createMonsterType("crystann")
local monster = {}

monster.name = "crystann"
monster.description = "crystann"
monster.experience = 16000000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 123,
	lookLegs = 97,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10000000
monster.maxHealth = 10000000
monster.runHealth = 3500
monster.race = "undead"
monster.corpse = 6068
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 10000,
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
	interval = 5000,
	chance = 30,
	{text = "COME HERE AND DIE!", yell = false},
	{text = "COME AND GIVE ME SOME AMUSEMENT!", yell = true},
	{text = "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", yell = true},
	{text = "I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!", yell = true},
	{text = "FLAWLESS VICTORY!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -19000, maxDamage = -28910},
	{name ="melee", interval = 2000, chance = 40, minDamage = -12500, maxDamage = -15000},
	{name ="melee", interval = 3000, chance = 64, minDamage = -1200, maxDamage = -5000},
	{name ="combat", interval = 4000, chance = 60, type = COMBAT_ENERGYDAMAGE, minDamage = -1000, maxDamage = -8000, length = 8, spread = 0, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 3000, chance = 60, type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -4800, range = 14, radius = 5, target = false, effect = CONST_ME_POFF},
	{name ="combat", interval = 4000, chance = 65, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -6500, range = 7, radius = 13, target = false, effect = CONST_ME_BLOCKHIT},
	{name ="combat", interval = 4000, chance = 68, type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -6000, radius = 14, target = false, effect = CONST_ME_LOSEENERGY},
	{name ="melee", interval = 3000, chance = 65, minDamage = -2000, maxDamage = -7500}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 3000, maxDamage = 8000, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 4000, chance = 80, speed = {min = 440, max = 440}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 3
monster.summons = {
	{name = "Deathslicer", chance = 20, interval = 4000, max = 3}
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 12, description2 = "crystal coin"},
	{name = "mastermind shield", chance = 18000, description2 = "mastermind shield"},
	{id = 6299, chance = 12000, description2 = "death ring"},
	{name = "Morgaroth's heart", chance = 7000, description2 = "Morgaroth's heart"},
	{name = "grey backpack", chance = 100000, description2 = "grey backpack", child = {
			{name = "demonbone", chance = 6000, description2 = "demonbone"},
			{name = "giant sword", chance = 60000, description2 = "giant sword"},
			{name = "boots of haste", chance = 14033, description2 = "boots of haste"}
		}
	}
}

mType:register(monster)



