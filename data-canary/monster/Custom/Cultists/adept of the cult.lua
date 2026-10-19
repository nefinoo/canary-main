local mType = Game.createMonsterType("adept of the cult")
local monster = {}

monster.name = "adept of the cult"
monster.description = "an adept of the cult"
monster.experience = 400
monster.outfit = {
	lookType = 194,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 94,
	lookFeet = 57,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 430
monster.maxHealth = 430
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 210
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
	{type = COMBAT_ENERGYDAMAGE, percent = -6},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 40, attack = 40},
	{name ="combat", interval = 2000, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -250, radius = 1, target = false, effect = CONST_ME_POISONAREA},
	{name ="drunk", interval = 1000, chance = 15, drunkenness = 25, duration = 10000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 70, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 3000, chance = 15, duration = 4000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 2
monster.summons = {
	{name = "Ghoul", chance = 100, interval = 2000, max = 2}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 47},
	{name = "small ruby", chance = 4000, maxCount = 2},
	{id = 3053, chance = 1000},
	{id = 3053, chance = 2222},
	{name = "clerical mace", chance = 3333},
	{name = "red robe", chance = 1428},
	{name = "shadow sceptre", chance = 828},
	{id = 2853, chance = 100000, child = {
			{name = "pirate voodoo doll", chance = 555},
			{id = 7426, chance = 933},
			{id = 6087, chance = 1428},
			{id = 5801, chance = 909},
			{name = "hailstorm rod", chance = 1000}
		}
	}
}

mType:register(monster)




