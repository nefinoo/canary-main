local mType = Game.createMonsterType("pirate Corsair")
local monster = {}

monster.name = "pirate Corsair"
monster.description = "a pirate corsair"
monster.experience = 350
monster.outfit = {
	lookType = 98,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 675
monster.maxHealth = 675
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 230
monster.summonCost = 775

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
	{type = COMBAT_EARTHDAMAGE, percent = 32},
	{type = COMBAT_FIREDAMAGE, percent = -17},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = -8}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -170},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -70, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGSTAR},
	{name ="melee", interval = 1000, chance = 30, minDamage = 0, maxDamage = 0}
}

monster.defenses = {
	defense = 20,
	armor = 25
}

monster.loot = {
	{name = "gold coin", chance = 40000, maxCount = 74},
	{name = "sabre", chance = 10321},
	{name = "piggy bank", chance = 833},
	{name = "dark armor", chance = 1333},
	{name = "dark shield", chance = 1000},
	{name = "pirate hat", chance = 909},
	{name = "pirate shirt", chance = 5000},
	{name = "pirate backpack", chance = 100000, child = {
			{id = 5090, chance = 1666},
			{name = "pirate boots", chance = 450},
			{id = 5792, chance = 3333},
			{id = 3264, chance = 6666},
			{name = "eye patch", chance = 5000}
		}
	}
}

mType:register(monster)




