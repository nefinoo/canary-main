local mType = Game.createMonsterType("poacher")
local monster = {}

monster.name = "Poacher"
monster.description = "a poacher"
monster.experience = 70
monster.outfit = {
	lookType = 129,
	lookHead = 115,
	lookBody = 119,
	lookLegs = 119,
	lookFeet = 115,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 90
monster.maxHealth = 90
monster.runHealth = 5
monster.race = "blood"
monster.corpse = 6080
monster.speed = 205
monster.summonCost = 530

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{text = "You will not live to tell anyone!", yell = false},
	{text = "You are my game today!", yell = false},
	{text = "Look what has stepped into my trap!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, skill = 25, attack = 20},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -10, maxDamage = -35, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ARROW}
}

monster.defenses = {
	defense = 10,
	armor = 8
}

monster.loot = {
	{name = "leather legs", chance = 40000, description2 = "leather legs"},
	{name = "leather helmet", chance = 20000, description2 = "leather helmet"},
	{name = "roll", chance = 20000, maxCount = 2, description2 = "roll"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{id = 3350, chance = 6000, description2 = "bow"},
			{name = "arrow", chance = 23500, maxCount = 17, description2 = "arrow"},
			{name = "poison arrow", chance = 10000, maxCount = 3, description2 = "poison arrow"},
			{id = 2920, chance = 15000, description2 = "torch"},
			{id = 3481, chance = 3000, description2 = "closed trap"}
		}
	}
}

mType:register(monster)



