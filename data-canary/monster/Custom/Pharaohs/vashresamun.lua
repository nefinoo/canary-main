local mType = Game.createMonsterType("vashresamun")
local monster = {}

monster.name = "vashresamun"
monster.description = "a vashresamun"
monster.experience = 2950
monster.outfit = {
	lookType = 90,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4000
monster.maxHealth = 4000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6025
monster.speed = 340
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
	{text = "Come my maidens, we have visitors!", yell = false},
	{text = "Are you enjoying my music?", yell = false},
	{text = "If music is the food of death, drop dead.", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -80, maxDamage = -300, condition = {type = CONDITION_POISON, startDamage = 65, interval = 4000}},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -750, radius = 5, target = false, effect = CONST_ME_SOUND_PURPLE}
}

monster.defenses = {
	defense = 35,
	armor = 20,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 60, maxDamage = 450, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 12, speed = {min = 350, max = 350}, duration = 30000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 2
monster.summons = {
	{name = "banshee", chance = 20, interval = 2000, max = 2}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "orb", chance = 2000},
	{name = "silver mace", chance = 400},
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
			{name = "crystal mace", chance = 600},
			{name = "wand of cosmic energy", chance = 800},
			{name = "small ruby", chance = 4000, maxCount = 2},
			{name = "coconut", chance = 4000, maxCount = 4},
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "roll", chance = 4000, maxCount = 4}
		}
	}
}

mType:register(monster)



