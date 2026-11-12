local mType = Game.createMonsterType("stone golem")
local monster = {}

monster.name = "stone golem"
monster.description = "a stone golem"
monster.experience = 6750000
monster.outfit = {
	lookType = 67,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 12000
monster.maxHealth = 12000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6005
monster.speed = 200
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
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 22},
	{type = COMBAT_ENERGYDAMAGE, percent = 13},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -320, maxDamage = -685 },
	{ name = "combat", interval = 3000, chance = 28, type = COMBAT_PHYSICALDAMAGE, minDamage = -310, maxDamage = -745, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK }
}

monster.defenses = {
	defense = 34,
	armor = 42,
	{ name = "combat", interval = 4000, chance = 10, type = COMBAT_HEALING, minDamage = 25, maxDamage = 55, effect = CONST_ME_MAGIC_BLUE }
}

monster.loot = {
	-- Moneda, consumibles y materiales de piedra
	{ name = "platinum coin", chance = 80000, maxCount = 3 },
	{ name = "gold coin", chance = 100000, maxCount = 20 },
	{ name = "strong health potion", chance = 8000 },
	{ name = "strong mana potion", chance = 9000 },
	{ name = "scale armor", chance = 1400 },
	{ name = "iron ore", chance = 16000, maxCount = 3 },
	{ name = "small stone", chance = 30000, maxCount = 5 },
	{ id = 12413, chance = 12500 }, -- bolsa de materiales de addon
	-- Knight Set
	{ name = "knight armor", chance = 1400 },
	{ name = "knight legs", chance = 1350 },
	{ name = "knight axe", chance = 1100 },
	{ name = "devil helmet", chance = 1000 },
	{ name = "tower shield", chance = 950 },
	{ id = 3079, chance = 950 }, -- Boots of Haste
	-- Crown Set
	{ name = "crown armor", chance = 550 },
	{ name = "crown legs", chance = 500 },
	{ name = "crown helmet", chance = 650 },
	{ name = "crown shield", chance = 500 },
	{ id = 10386, chance = 500 }, -- Zaoan Shoes
	{ id = 3055, chance = 4000 }, -- Platinum Amulet
	-- Bolsa de objetos originales
	{ id = 2853, chance = 100000, child = {
		{ id = 1781, chance = 10000 },
		{ name = "small stone", chance = 20000, maxCount = 5 },
		{ name = "carlin sword", chance = 2500 },
		{ id = 2920, chance = 20000 },
		{ name = "fishing rod", chance = 5000 }
	} }
}

mType:register(monster)





