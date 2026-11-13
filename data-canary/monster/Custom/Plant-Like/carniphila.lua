local mType = Game.createMonsterType("carniphila")
local monster = {}

monster.name = "carniphila"
monster.description = "a carniphila"
monster.experience = 1250000
monster.outfit = {
	lookType = 120,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3400
monster.maxHealth = 3400
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6047
monster.speed = 240
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 7},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 72, attack = 48, condition = {type = CONDITION_POISON, startDamage = 35, interval = 4000}},
	{name ="combat", interval = 1000, chance = 22, type = COMBAT_EARTHDAMAGE, minDamage = -55, maxDamage = -155, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON},
	{name ="speed", interval = 1000, chance = 15, speed = {min = -400, max = -400}, duration = 7000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -85, maxDamage = -220, radius = 3, target = false, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 10,
	armor = 26
}

monster.loot = {
	{ name = "experience scroll", chance = 120 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	{ name = "gold coin", chance = 90000, maxCount = 65 },
	{ name = "corncob", chance = 890 },
	{ name = "dark mushroom", chance = 7692 },
	{ name = "sling herb", chance = 446, maxCount = 2 },
	{ name = "shadow herb", chance = 880 },
	{ name = "seeds", chance = 490 },
	{ name = "carniphila seeds", chance = 4166 },
	{ name = "carrot on a stick", chance = 1700 },
	-- Curacion, recursos y addon bag (etapa 100+)
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 10000 },
	{ name = "strong health potion", chance = 3500 },
	{ name = "strong mana potion", chance = 3500 },
	{ id = 12413, chance = 11000 },
	-- Plate Set: loot frecuente
	{ name = "plate armor", chance = 6000 },
	{ name = "plate legs", chance = 6000 },
	{ name = "steel helmet", chance = 6500 },
	{ name = "bonelord shield", chance = 6000 },
	-- Knight Set
	{ name = "knight armor", chance = 3400 },
	{ name = "knight legs", chance = 3300 },
	{ name = "knight axe", chance = 2900 },
	{ name = "devil helmet", chance = 2600 },
	{ name = "tower shield", chance = 2200 },
	-- Crown Set: muy raro
	{ name = "crown armor", chance = 400 },
	{ name = "crown legs", chance = 400 },
	{ name = "crown helmet", chance = 450 },
	{ name = "crown shield", chance = 350 },
	{ id = 3055, chance = 2000 }, -- Platinum Amulet (Crown Set)
	-- Armas raras
	{ name = "fire sword", chance = 2500 },
	{ name = "fire axe", chance = 2800 },
	{ name = "dragonbone staff", chance = 2200 },
	-- Botas de progresion por set
	{ id = 3079, chance = 2200 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 350 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





