local mType = Game.createMonsterType("braindeath")
local monster = {}

monster.name = "braindeath"
monster.description = "a braindeath"
monster.experience = 895
monster.outfit = {
	lookType = 256,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1225
monster.maxHealth = 1225
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6037
monster.speed = 270
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 5,
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
	{text = "You have disturbed my thoughts!", yell = false},
	{text = "Let me turn you into something more useful!", yell = false},
	{text = "Let me taste your brain!", yell = false},
	{text = "You will be punished!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 9},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 13},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 60, attack = 55},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -45, maxDamage = -250, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -80, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -70, maxDamage = -290, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -30, maxDamage = -70, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -75, maxDamage = -85, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -20, maxDamage = -340, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="speed", interval = 2000, chance = 10, speed = {min = -600, max = -600}, duration = 20000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 26,
	armor = 13,
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 0, maxDamage = 1, effect = CONST_ME_ENERGYHIT}
}

monster.maxSummons = 3
monster.summons = {
	{name = "Vampire", chance = 10, interval = 2000, max = 3}
}

monster.loot = {
	{name = "steel shield", chance = 6000},
	{name = "gold coin", chance = 100000, maxCount = 45},
	{name = "crystal mace", chance = 400},
	{name = "longsword", chance = 12000},
	{id = 3418, chance = 300},
	{name = "terra rod", chance = 1333, description2 = "Quagmire Rod"},
	{id = 3355, chance = 600},
	{name = "djinn blade", chance = 300},
	{id = 5898, chance = 1700, description2 = "Beholder Eye"},
	{id = 2853, chance = 80000, child = {
			{name = "two handed sword", chance = 6000},
			{id = 3059, chance = 1000},
			{name = "morning star", chance = 10000},
			{name = "gold coin", chance = 80000, maxCount = 32},
			{name = "gold coin", chance = 80000, maxCount = 90},
			{name = "clerical mace", chance = 5000},
			{name = "war hammer", chance = 1333}
		}
	}
}

mType:register(monster)




