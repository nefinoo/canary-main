local mType = Game.createMonsterType("deathwalker")
local monster = {}

monster.name = "deathwalker"
monster.description = "a deathwalker"
monster.experience = 5750000
monster.outfit = {
	lookType = 100,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 11500
monster.maxHealth = 11500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6029
monster.speed = 220
monster.summonCost = 0

monster.changeTarget = {
	interval = 220,
	chance = 10
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
	{text = "Aaaaahhhh!", yell = false},
	{text = "Chhhhhhh!", yell = false},
	{text = "Hoooohhh!", yell = false},
	{text = "Uhhhhhhh!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -230, maxDamage = -545 },
	{ name = "combat", interval = 4000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -275, maxDamage = -650, range = 1, radius = 1, target = true }
}

monster.defenses = {
	defense = 28,
	armor = 27
}

monster.loot = {
	-- Una sola tirada de moneda para equilibrar la economia
	{ name = "platinum coin", chance = 85000, maxCount = 4 },
	{ name = "ham", chance = 45000, maxCount = 3 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 12000 },
	{ name = "strong health potion", chance = 9000 },
	{ name = "strong mana potion", chance = 9000 },
	-- Gemas y materiales originales de addon
	{ name = "yellow gem", chance = 3500 },
	{ name = "green gem", chance = 2000 },
	{ id = 12413, chance = 13000 }, -- bag aleatoria de addon
	-- Bronze Experience Scroll (ID 51670): extremadamente raro
	{ name = "experience scroll", chance = 160 },
	-- Plate Set
	{ name = "plate armor", chance = 2100 },
	{ name = "plate legs", chance = 2000 },
	{ name = "steel helmet", chance = 2300 },
	{ name = "bonelord shield", chance = 1900 },
	-- Knight Set
	{ name = "knight armor", chance = 1400 },
	{ name = "knight legs", chance = 1350 },
	{ name = "knight axe", chance = 1150 },
	{ name = "devil helmet", chance = 1100 },
	{ name = "tower shield", chance = 950 },
	-- Crown Set: recompensas raras de zona
	{ name = "crown armor", chance = 400 },
	{ name = "crown legs", chance = 420 },
	{ name = "crown helmet", chance = 500 },
	{ name = "crown shield", chance = 380 },
	{ id = 3055, chance = 4500 }, -- Platinum Amulet (Crown Set)
	-- Armas raras
	{ name = "fire sword", chance = 1300 },
	{ name = "fire axe", chance = 1450 },
	{ name = "dragonbone staff", chance = 1250 },
	-- Botas de progresion por set
	{ id = 3079, chance = 950 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 380 }, -- Zaoan Shoes: Crown Set
}   	
mType:register(monster)


