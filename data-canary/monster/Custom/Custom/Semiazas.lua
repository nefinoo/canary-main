local mType = Game.createMonsterType("Semiazas")
local monster = {}

monster.name = "Semiazas"
monster.description = "semiazas"
monster.experience = 25000000
monster.outfit = {
	lookType = 12,
	lookHead = 77,
	lookBody = 30,
	lookLegs = 96,
	lookFeet = 96,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7500000
monster.maxHealth = 7500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 10000,
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
	staticAttackChance = 85,
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
	{text = "Annihilation!", yell = true}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -20000, maxDamage = -23000},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -5000, radius = 3, target = true, effect = CONST_ME_ICEAREA},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -6000, maxDamage = -10000, length = 5, spread = 0, effect = CONST_ME_ENERGYAREA},
	{name ="combat", interval = 1000, chance = 33, type = COMBAT_PHYSICALDAMAGE, minDamage = -4000, maxDamage = -7000, radius = 5, target = true, effect = CONST_ME_GROUNDSHAKER}
}

monster.defenses = {
	defense = 55,
	armor = 60,
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_HEALING, minDamage = 20000, maxDamage = 30000, effect = CONST_ME_MAGIC_GREEN},
	{name ="speed", interval = 1000, chance = 4, speed = {min = 500, max = 500}, duration = 5000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 2853, chance = 100000, child = {
			{id = 3049, chance = 10000},
			{name = "demon shield", chance = 7000},
			{name = "demon shield", chance = 7600}
		}
	},
	{name = "small amethyst", chance = 5515, maxCount = 20},
	{name = "crystal coin", chance = 100000, maxCount = 100},
	{name = "crystal coin", chance = 100000, maxCount = 50},
	{name = "fire axe", chance = 10000},
	{id = 6529, chance = 5000},
	{name = "experience scroll", chance = 10000},
	{name = "deadly wand", chance = 5000}
}

mType:register(monster)



