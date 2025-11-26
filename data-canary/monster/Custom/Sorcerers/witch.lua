local mType = Game.createMonsterType("witch")
local monster = {}

monster.name = "witch"
monster.description = "a witch"
monster.experience = 120
monster.outfit = {
	lookType = 54,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 300
monster.maxHealth = 300
monster.runHealth = 30
monster.race = "blood"
monster.corpse = 6081
monster.speed = 180
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
	{text = "Horax pokti! Hihihihi!", yell = false},
	{text = "Herba budinia ex!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -14},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 18, attack = 18},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -30, maxDamage = -75, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="firefield", interval = 1000, chance = 13, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE}
}

monster.defenses = {
	defense = 12,
	armor = 8
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{id = 3012, chance = 10000},
	{name = "necrotic rod", chance = 833},
	{name = "leather boots", chance = 10000},
	{name = "coat", chance = 5000},
	{name = "cheese", chance = 33333},
	{id = 2853, chance = 100000, child = {
			{name = "sickle", chance = 5000},
			{name = "heavy machete", chance = 1666},
			{name = "broom", chance = 10000},
			{name = "cape", chance = 3333},
			{name = "golden sickle", chance = 1000},
			{name = "garlic necklace", chance = 1428},
			{name = "fern", chance = 1333}
		}
	}
}

mType:register(monster)




