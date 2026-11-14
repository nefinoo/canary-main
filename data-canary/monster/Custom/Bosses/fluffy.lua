local mType = Game.createMonsterType("Fluffy")
local monster = {}

monster.name = "Fluffy"
monster.description = "Fluffy"
monster.experience = 750000
monster.outfit = {
	lookType = 240,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7800
monster.maxHealth = 7800
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6332
monster.speed = 310
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
	{text = "Wooof!", yell = false}
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
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -70, maxDamage = -185 },
	{name ="combat", interval = 1500, chance = 22, type = COMBAT_ENERGYDAMAGE, minDamage = -55, maxDamage = -165, length = 8, spread = 3, effect = CONST_ME_LOSEENERGY},
	{name ="combat", interval = 2000, chance = 23, type = COMBAT_EARTHDAMAGE, minDamage = -65, maxDamage = -165, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -60, maxDamage = -170, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -65, maxDamage = -180, range = 7, radius = 6, target = false, effect = CONST_ME_LOSEENERGY}
}

monster.defenses = {
	defense = 38,
	armor = 35,
	mitigation = 0.8,
	{ name = "combat", interval = 5000, chance = 8, type = COMBAT_HEALING, minDamage = 50, maxDamage = 110, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.loot = {
	{ name = "experience scroll", chance = 350 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	-- Oro y consumibles nivel 69
	{ name = "gold coin", chance = 90000, maxCount = 220 },
	{ name = "ham", chance = 70000, maxCount = 3 },
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 4500 },
	{ name = "strong mana potion", chance = 5000 },
	-- Materiales de addon originales
	{ name = "demonic essence", chance = 12000 },
	{ name = "soul orb", chance = 12000 },
	{ id = 12413, chance = 34000 },
	-- Plate Set: progresion mejorada
	{ name = "plate armor", chance = 7300 },
	{ name = "plate legs", chance = 7008 },
	{ name = "steel helmet", chance = 7811 },
	{ name = "bonelord shield", chance = 7008 },
	-- Knight Set
	{ name = "knight armor", chance = 2900 },
	{ name = "knight legs", chance = 2726 },
	{ name = "knight axe", chance = 2262 },
	{ name = "devil helmet", chance = 2117 },
	{ name = "tower shield", chance = 2001 },
	-- Fire Sword / Fire Axe / Dragonbone Staff: armas raras
	{ name = "fire sword", chance = 4500 },
	{ name = "fire axe", chance = 3800 },
	{ name = "dragonbone staff", chance = 4000 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1247 }, -- Boots of Haste: Knight Set
}

mType:register(monster)





