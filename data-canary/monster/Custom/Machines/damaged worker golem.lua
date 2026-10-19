local mType = Game.createMonsterType("Damaged Worker Golem")
local monster = {}

monster.name = "Damaged Worker Golem"
monster.description = "a damaged worker golem"
monster.experience = 95
monster.outfit = {
	lookType = 304,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 260
monster.maxHealth = 260
monster.runHealth = 0
monster.race = "venom"
monster.corpse = 9801
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
	interval = 2500,
	chance = 10,
	{text = "Klonk klonk klonk", yell = false},
	{text = "Failure! Failire!", yell = false},
	{text = "Good morning citizen. How may I serve you?", yell = false},
	{text = "Target identified: Rat! Termination initiated!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 40},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 25},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -50}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="combat", interval = 1000, chance = 7, type = COMBAT_HEALING, minDamage = 20, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "nail", chance = 500, maxCount = 3, description2 = "nails"},
	{name = "gold coin", chance = 100000, maxCount = 83, description2 = "gps"},
	{id = 2853, chance = 100000, child = {
			{name = "iron ore", chance = 700, description2 = "iron ore"},
			{id = 9808, chance = 900, description2 = "rusty armor"},
			{id = 3091, chance = 1500, description2 = "sword ring"}
		}
	}
}

mType:register(monster)




