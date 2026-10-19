local mType = Game.createMonsterType("Cold Hard One")
local monster = {}

monster.name = "Cold Hard One"
monster.description = "Cold Hard One"
monster.experience = 15000000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 85,
	lookLegs = 85,
	lookFeet = 85,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5000000
monster.maxHealth = 5000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 500
monster.summonCost = 0

monster.changeTarget = {
	interval = 1000,
	chance = 15
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
	interval = 1,
	chance = 5,
	{text = "BITCHES COME!", yell = true},
	{text = "DEATH SHALL REIGN UPON YOU!", yell = true},
	{text = "WHAT A BUNCH OF HOES...", yell = true}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -700, maxDamage = -2000},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -700, maxDamage = -1200, range = 7, radius = 7, target = true, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ENERGYHIT},
	{name ="melee", interval = 2000, chance = 100, minDamage = -250, maxDamage = -400},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -2000, maxDamage = -3000, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -480, range = 7, radius = 5, target = false, effect = CONST_ME_MAGIC_GREEN},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -500, range = 7, radius = 13, target = false, effect = CONST_ME_SOUND_RED},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -450, radius = 14, target = false, effect = CONST_ME_LOSEENERGY},
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -200}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 25000, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 4000, chance = 80, speed = {min = 440, max = 440}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 3
monster.summons = {
	{name = "Ice Golem", chance = 30, interval = 1000, max = 3}
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 100},
	{name = "crystal coin", chance = 100000, maxCount = 100},
	{name = "crystal coin", chance = 100000, maxCount = 100},
	{name = "blue note", chance = 100000},
	{name = "frozen starlight", chance = 100000},
	{name = "candy cane", chance = 100000, maxCount = 100},
	{id = 3158, chance = 100000},
	{id = 5801, chance = 100000},
	{name = "beach backpack", chance = 100000, child = {
			{name = "demon helmet", chance = 100000},
			{name = "demon armor", chance = 100000},
			{name = "demon legs", chance = 100000},
			{id = 3410, chance = 100000},
			{name = "camouflage bag", chance = 100000},
			{name = "pirate bag", chance = 100000},
			{name = "beach bag", chance = 100000},
			{name = "fur bag", chance = 100000}
		}
	}
}

mType:register(monster)




