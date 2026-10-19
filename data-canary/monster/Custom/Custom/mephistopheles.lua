local mType = Game.createMonsterType("Mephistopheles")
local monster = {}

monster.name = "Mephistopheles"
monster.description = "mephistopheles"
monster.experience = 20000000000
monster.outfit = {
	lookType = 12,
	lookHead = 22,
	lookBody = 62,
	lookLegs = 96,
	lookFeet = 96,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6000000
monster.maxHealth = 6000000
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
	{name ="melee", interval = 1000, chance = 100, minDamage = -18000, maxDamage = -20000},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_HOLYDAMAGE, minDamage = -2000, maxDamage = -5000, radius = 3, target = true, effect = CONST_ME_HOLYAREA},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -4000, maxDamage = -8000, length = 5, spread = 0, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 55,
	armor = 60,
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_HEALING, minDamage = 15000, maxDamage = 25000, effect = CONST_ME_MAGIC_GREEN},
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
	{name = "deadly blade", chance = 5000},
	{name = "experience scroll", chance = 10000}
}

mType:register(monster)





