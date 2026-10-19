local mType = Game.createMonsterType("pirate cutthroat")
local monster = {}

monster.name = "pirate cutthroat"
monster.description = "a pirate cutthroat"
monster.experience = 175000
monster.outfit = {
	lookType = 96,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 325
monster.maxHealth = 325
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 230
monster.summonCost = 495

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
	canPushItems = true,
	canPushCreatures = false,
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
	{text = "Give up!", yell = false},
	{text = "Hiyaa!", yell = false},
	{text = "Plundeeeeer!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 18},
	{type = COMBAT_FIREDAMAGE, percent = -9},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -11},
	{type = COMBAT_HOLYDAMAGE , percent = 17},
	{type = COMBAT_DEATHDAMAGE , percent = -7}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -145},
	{name ="combat", interval = 1500, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -90, range = 1, radius = 1, target = true, effect = CONST_ME_EXPLOSIONHIT}
}

monster.defenses = {
	defense = 23,
	armor = 25
}

monster.loot = {
	{name = "gold coin", chance = 50000, maxCount = 53},
	{name = "scale armor", chance = 10000},
	{name = "pirate knee breeches", chance = 6666},
	{name = "pirate shirt", chance = 5000},
	{name = "light shovel", chance = 2500},
	{name = "rum flask", chance = 2500},
	{name = "pirate bag", chance = 100000, child = {
			{id = 5090, chance = 1666},
			{name = "steel shield", chance = 4000},
			{id = 5792, chance = 3333},
			{id = 3264, chance = 6666},
			{name = "peg leg", chance = 5000},
			{name = "eye patch", chance = 5000},
			{name = "hook", chance = 5000}
		}
	}
}

mType:register(monster)





