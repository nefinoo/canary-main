local mType = Game.createMonsterType("Ice Witch")
local monster = {}

monster.name = "Ice Witch"
monster.description = "an ice witch"
monster.experience = 580
monster.outfit = {
	lookType = 149,
	lookHead = 0,
	lookBody = 47,
	lookLegs = 105,
	lookFeet = 105,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 540
monster.maxHealth = 540
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6081
monster.speed = 188
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 50,
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
	interval = 2000,
	chance = 5,
	{text = "So you think you are cool?", yell = false},
	{text = "I hope it is not too cold for you! HeHeHe.", yell = false},
	{text = "Freeze!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 26},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 45, attack = 30, target = true},
	{name = "outfit", interval = 1000, chance = 10, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 8000, outfitItem = 7172 },
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_LIFEDRAIN, minDamage = -60, maxDamage = -120, length = 8, spread = 3, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 3000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -80, maxDamage = -150, range = 7, radius = 3, target = false, shootEffect = CONST_ANI_SNOWBALL, effect = false},
	{name ="speed", interval = 1000, chance = 10, speed = {min = -600, max = -600}, duration = 20000, range = 7, radius = 1, target = false, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 20,
	armor = 15,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 80},
	{name = "crystal sword", chance = 1222},
	{id = 7441, chance = 5555},
	{name = "diamond sceptre", chance = 1444},
	{id = 2853, chance = 100000, child = {
			{name = "clerical mace", chance = 3333},
			{name = "green mushroom", chance = 9999},
			{name = "mystic turban", chance = 1111},
			{id = 7459, chance = 1000}
		}
	}
}

mType:register(monster)




