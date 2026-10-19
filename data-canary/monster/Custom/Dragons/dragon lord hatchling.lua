local mType = Game.createMonsterType("dragon lord hatchling")
local monster = {}

monster.name = "dragon lord hatchling"
monster.description = "a dragon lord hatchling"
monster.experience = 645
monster.outfit = {
	lookType = 272,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 750
monster.maxHealth = 750
monster.runHealth = 80
monster.race = "blood"
monster.corpse = 7622
monster.speed = 200
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
	chance = 50,
	{text = "Fchu?", yell = false},
	{text = "Rooawwrr", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 55, attack = 45},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_FIREDAMAGE, minDamage = -40, maxDamage = -110, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_LIFEDRAIN, minDamage = -60, maxDamage = -90, length = 8, spread = 3, effect = CONST_ME_POFF},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -40, maxDamage = -80, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_FIREDAMAGE, minDamage = -80, maxDamage = -140, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 15, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE}
}

monster.defenses = {
	defense = 38,
	armor = 25,
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_HEALING, minDamage = 26, maxDamage = 48, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "mana potion", chance = 3500},
	{name = "dragon ham", chance = 5000},
	{name = "green mushroom", chance = 3500},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 20},
			{name = "magma boots", chance = 200}
		}
	}
}

mType:register(monster)




