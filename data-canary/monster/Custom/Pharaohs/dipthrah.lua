local mType = Game.createMonsterType("dipthrah")
local monster = {}

monster.name = "dipthrah"
monster.description = "a dipthrah"
monster.experience = 2900000
monster.outfit = {
	lookType = 87,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4200
monster.maxHealth = 4200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6031
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
	{text = "Come closer to learn the final lesson.", yell = false},
	{text = "You can't escape death forever.", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -800, condition = {type = CONDITION_POISON, startDamage = 65, interval = 4000}},
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -800, range = 1, radius = 1, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -500, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="speed", interval = 1000, chance = 15, speed = {min = -650, max = -650}, duration = 50000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="drunk", interval = 1000, chance = 12, drunkenness = 25, duration = 10000, radius = 7, target = false, effect = CONST_ME_LOSEENERGY},
	{name ="melee", interval = 3000, chance = 34, minDamage = -50, maxDamage = -600}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 100, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 4
monster.summons = {
	{name = "priestess", chance = 15, interval = 2000, max = 3}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "orb", chance = 2000},
	{name = "silver mace", chance = 100},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 70},
			{name = "scythe", chance = 10000},
			{name = "candy cane", chance = 4000, maxCount = 5},
			{name = "scarab shield", chance = 333},
			{name = "phoenix shield", chance = 200},
			{name = "griffin shield", chance = 1428},
			{name = "noble armor", chance = 1000},
			{name = "white dress", chance = 100},
			{name = "wand of cosmic energy", chance = 500},
			{name = "small ruby", chance = 4000, maxCount = 2},
			{name = "coconut", chance = 4000, maxCount = 4},
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "roll", chance = 4000, maxCount = 4}
		}
	}
}

mType:register(monster)





