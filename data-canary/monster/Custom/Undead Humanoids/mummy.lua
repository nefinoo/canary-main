local mType = Game.createMonsterType("mummy")
local monster = {}

monster.name = "mummy"
monster.description = "a mummy"
monster.experience = 6750000
monster.outfit = {
	lookType = 65,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 13000
monster.maxHealth = 13000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6004
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
	{text = "I will ssswallow your sssoul!", yell = false},
	{text = "Mort ulhegh dakh visss.", yell = false},
	{text = "Flesssh to dussst!", yell = false},
	{text = "I will tassste life again!", yell = false},
	{text = "Ahkahra exura belil mort!", yell = false},
	{text = "Yohag Sssetham!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -250, maxDamage = -565, condition = {type = CONDITION_POISON, startDamage = 35, interval = 4000} },
	{ name = "combat", interval = 3000, chance = 18, type = COMBAT_LIFEDRAIN, minDamage = -190, maxDamage = -560, range = 1, radius = 1, target = true },
	{ name = "speed", interval = 2000, chance = 8, speed = {min = -300, max = -300}, duration = 7000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED }
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.loot = {
	-- Una sola tirada de moneda para equilibrar la economia
	{ name = "platinum coin", chance = 90000, maxCount = 4 },
	{ name = "ham", chance = 45000, maxCount = 3 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 12000 },
	{ name = "strong health potion", chance = 9000 },
	{ name = "strong mana potion", chance = 9000 },
	-- Gemas y materiales originales de addon
	{ name = "yellow piece of cloth", chance = 6500 }, -- material de addon original
	{ id = 12413, chance = 14000 }, -- bag aleatoria de addon
	-- Bronze Experience Scroll (ID 51670): extremadamente raro
	{ name = "experience scroll", chance = 175 },
	-- Plate Set
	{ name = "plate armor", chance = 2300 },
	{ name = "plate legs", chance = 2200 },
	{ name = "steel helmet", chance = 2400 },
	{ name = "bonelord shield", chance = 2100 },
	-- Knight Set
	{ name = "knight armor", chance = 1550 },
	{ name = "knight legs", chance = 1500 },
	{ name = "knight axe", chance = 1250 },
	{ name = "devil helmet", chance = 1200 },
	{ name = "tower shield", chance = 1100 },
	-- Crown Set: recompensas raras de zona
	{ name = "crown armor", chance = 500 },
	{ name = "crown legs", chance = 520 },
	{ name = "crown helmet", chance = 600 },
	{ name = "crown shield", chance = 460 },
	{ id = 3055, chance = 4500 }, -- Platinum Amulet (Crown Set)
	-- Armas raras
	{ name = "fire sword", chance = 1450 },
	{ name = "fire axe", chance = 1600 },
	{ name = "dragonbone staff", chance = 1350 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1100 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 460 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





