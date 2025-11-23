local mType = Game.createMonsterType("pirate buccaneer")
local monster = {}

monster.name = "pirate Buccaneer"
monster.description = "a pirate buccaneer"
monster.experience = 250
monster.outfit = {
	lookType = 97,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 425
monster.maxHealth = 425
monster.runHealth = 50
monster.race = "blood"
monster.corpse = 6080
monster.speed = 230
monster.summonCost = 595

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
	{text = "Give up!", yell = false},
	{text = "Hiyaa", yell = false},
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
	{type = COMBAT_PHYSICALDAMAGE, percent = -11},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 25},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -7}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -10, maxDamage = -160},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -80, range = 4, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGKNIFE}
}

monster.defenses = {
	defense = 23,
	armor = 25
}

monster.loot = {
	{name = "gold coin", chance = 40000, maxCount = 43},
	{id = 2920, chance = 6666},
	{name = "sabre", chance = 2057},
	{name = "plate armor", chance = 1000},
	{name = "worn leather boots", chance = 10045},
	{name = "pirate shirt", chance = 5000},
	{name = "rum flask", chance = 1666},
	{name = "pirate backpack", chance = 100000, child = {
			{id = 5090, chance = 1666},
			{id = 5792, chance = 3333},
			{id = 3264, chance = 6666},
			{name = "peg leg", chance = 5000},
			{name = "eye patch", chance = 5000},
			{name = "hook", chance = 5000}
		}
	}
}

mType:register(monster)



