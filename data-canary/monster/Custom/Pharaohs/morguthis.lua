local mType = Game.createMonsterType("morguthis")
local monster = {}

monster.name = "morguthis"
monster.description = "a morguthis"
monster.experience = 3000
monster.outfit = {
	lookType = 90,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4800
monster.maxHealth = 4800
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6025
monster.speed = 320
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
	illusionable = false,
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
	{text = "Vengeance!", yell = false},
	{text = "You will make a fine trophy.", yell = false},
	{text = "Come and fight me, cowards!", yell = false},
	{text = "I am the supreme warrior!", yell = false},
	{text = "Let me hear the music of battle.", yell = false},
	{text = "Anotherone to bite the dust!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 52},
	{type = COMBAT_EARTHDAMAGE, percent = -15},
	{type = COMBAT_FIREDAMAGE, percent = 60},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 62},
	{type = COMBAT_HOLYDAMAGE , percent = -22},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -150, maxDamage = -900, condition = {type = CONDITION_POISON, startDamage = 65, interval = 4000}},
	{name ="combat", interval = 3000, chance = 7, type = COMBAT_LIFEDRAIN, minDamage = -55, maxDamage = -550, range = 1, radius = 1, target = true},
	{name ="speed", interval = 1000, chance = 25, speed = {min = -650, max = -650}, duration = 50000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -40, maxDamage = -400, radius = 3, target = false, effect = CONST_ME_HITAREA},
	{name ="combat", interval = 3000, chance = 7, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -500, radius = 3, target = false, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 25,
	armor = 35,
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_HEALING, minDamage = 200, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 7, speed = {min = 1201, max = 1201}, duration = 5000, effect = CONST_ME_MAGIC_RED},
	{name ="invisible", interval = 2000, chance = 10, duration = 4000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 3
monster.summons = {
	{name = "hero", chance = 100, interval = 2000, max = 3}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "orb", chance = 2000},
	{name = "hammer of wrath", chance = 450},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 70},
			{name = "scythe", chance = 10000},
			{name = "candy cane", chance = 4000, maxCount = 5},
			{name = "scarab shield", chance = 900},
			{name = "phoenix shield", chance = 200},
			{name = "griffin shield", chance = 400},
			{name = "noble armor", chance = 300},
			{name = "white dress", chance = 100},
			{name = "ravager's axe", chance = 300},
			{name = "wand of cosmic energy", chance = 800},
			{name = "small ruby", chance = 4000, maxCount = 2},
			{name = "coconut", chance = 4000, maxCount = 4},
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "roll", chance = 4000, maxCount = 4}
		}
	}
}

mType:register(monster)



