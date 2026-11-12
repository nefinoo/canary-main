local mType = Game.createMonsterType("the imperor")
local monster = {}

monster.name = "the imperor"
monster.description = "the imperor"
monster.experience = 150000
monster.outfit = {
	lookType = 237,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5900
monster.maxHealth = 5900
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 8635
monster.speed = 330
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
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
	{text = "Muahaha!", yell = false},
	{text = "He he he!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -55, maxDamage = -160 },
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -40, maxDamage = -135, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_FIREDAMAGE, minDamage = -45, maxDamage = -150, range = 7, radius = 6, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -165, length = 4, spread = 2, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 24,
	armor = 28,
	{ name = "combat", interval = 4000, chance = 10, type = COMBAT_HEALING, minDamage = 45, maxDamage = 85, effect = CONST_ME_MAGIC_BLUE },
	{ name = "speed", interval = 2000, chance = 10, speed = { min = 380, max = 380 }, duration = 4000, effect = CONST_ME_MAGIC_RED },
	{ name = "invisible", interval = 3000, chance = 8, duration = 3000, effect = CONST_ME_MAGIC_RED },
}

monster.maxSummons = 2
monster.summons = {
	{name = "diabolic imp", chance = 10, interval = 5500, max = 2}
}

monster.loot = {
	{ name = "experience scroll", chance = 250 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	-- Oro y consumibles nivel 69
	{ name = "gold coin", chance = 90000, maxCount = 175 },
	{ name = "ham", chance = 65000, maxCount = 3 },
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 4500 },
	{ name = "strong mana potion", chance = 5000 },
	-- Materiales de addon originales
	{ name = "demonic essence", chance = 10000 },
	{ name = "soul orb", chance = 7000 },
	{ id = 12413, chance = 28000 },
	-- Plate Set: progresion mejorada
	{ name = "plate armor", chance = 12500 },
	{ name = "plate legs", chance = 12000 },
	{ name = "steel helmet", chance = 13000 },
	{ name = "bonelord shield", chance = 12000 },
	-- Knight Set
	{ name = "knight armor", chance = 6500 },
	{ name = "knight legs", chance = 6000 },
	{ name = "knight axe", chance = 5200 },
	{ name = "devil helmet", chance = 4800 },
	{ name = "tower shield", chance = 4300 },
	-- Crown Set: muy raro
	{ name = "crown armor", chance = 750 },
	{ name = "crown legs", chance = 750 },
	{ name = "crown helmet", chance = 900 },
	{ name = "crown shield", chance = 650 },
	{ id = 3055, chance = 3000 }, -- Platinum Amulet (Crown Set)
	-- Fire Sword / Fire Axe / Dragonbone Staff: armas raras
	{ name = "fire sword", chance = 3600 },
	{ name = "fire axe", chance = 4100 },
	{ name = "dragonbone staff", chance = 3600 },
	{ name = "imperor's trident", chance = 100000 }, -- recompensa unica original preservada
	-- Botas de progresion por set
	{ id = 3079, chance = 4300 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 650 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





