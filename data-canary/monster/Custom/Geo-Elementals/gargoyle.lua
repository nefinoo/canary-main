local mType = Game.createMonsterType("gargoyle")
local monster = {}

monster.name = "gargoyle"
monster.description = "a gargoyle"
monster.experience = 37500000
monster.outfit = {
	lookType = 95,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 22000
monster.maxHealth = 22000
monster.runHealth = 950
monster.race = "blood"
monster.corpse = 6027
monster.speed = 250
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
	{text = "Harrrr Harrrr!", yell = false},
	{text = "Stone sweet stone.", yell = false},
	{text = "Feel my claws, softskin.", yell = false},
	{text = "Chhhhhrrrrk!", yell = false},
	{text = "There is a stone in your shoe!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -440, maxDamage = -960 },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -940, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK }
}

monster.defenses = {
	defense = 30,
	armor = 37,
	{ name = "combat", interval = 4000, chance = 12, type = COMBAT_HEALING, minDamage = 30, maxDamage = 65, effect = CONST_ME_MAGIC_BLUE }
}

monster.loot = {
	-- Moneda y consumibles para la etapa nivel 450
	{ name = "platinum coin", chance = 85000, maxCount = 3 },
	{ name = "ham", chance = 40000, maxCount = 3 },
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 12000 },
	{ name = "strong health potion", chance = 9000 },
	{ name = "strong mana potion", chance = 10000 },
	{ id = 12413, chance = 16000 }, -- bolsa de addon
	{ name = "experience scroll", chance = 250 }, -- ID 51670, muy raro
	-- Plate Set
	{ name = "plate armor", chance = 12300 },
	{ name = "plate legs", chance = 11808 },
	{ name = "steel helmet", chance = 13161 },
	{ name = "bonelord shield", chance = 11808 },
	-- Knight Set
	{ name = "knight armor", chance = 6800 },
	{ name = "knight legs", chance = 6392 },
	{ name = "knight axe", chance = 5304 },
	{ name = "devil helmet", chance = 4964 },
	{ name = "tower shield", chance = 4692 },
	-- Crown Set
	{ name = "crown armor", chance = 1950 },
	{ name = "crown legs", chance = 1872 },
	{ name = "crown helmet", chance = 2340 },
	{ name = "crown shield", chance = 1755 },
	{ id = 3055, chance = 6200 }, -- Platinum Amulet (Crown Set)
	-- Armas de progresion
	{ name = "fire sword", chance = 850 },
	{ name = "fire axe", chance = 1100 },
	{ name = "dragonbone staff", chance = 750 },
	-- Botas de progresion por set
	{ id = 3079, chance = 2924 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 1755 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





