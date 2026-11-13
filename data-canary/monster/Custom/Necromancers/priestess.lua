local mType = Game.createMonsterType("bloody mary")
local monster = {}

monster.name = "bloody mary"
monster.description = "a bloody mary"
monster.experience = 25000000
monster.outfit = {
	lookType = 58,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 33000
monster.maxHealth = 33000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6081
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
	{text = "Now, your life has come to an end, hahahha!", yell = false},
	{text = "Throw the soul on the altar!", yell = false},
	{text = "Your energy is mine.", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -320, maxDamage = -900, condition = {type = CONDITION_POISON, startDamage = 55, interval = 5000} },
	{ name = "combat", interval = 2000, chance = 22, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -980, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -70, maxDamage = -180, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED }
}

monster.defenses = {
	defense = 36,
	armor = 45,
	{ name = "combat", interval = 4000, chance = 12, type = COMBAT_HEALING, minDamage = 75, maxDamage = 145, effect = CONST_ME_MAGIC_BLUE }
}

monster.maxSummons = 2
monster.summons = {
	{ name = "ghoul", chance = 6, interval = 4000, max = 2 }
}

monster.loot = {
	-- Dinero y consumibles; una sola tirada principal de moneda
	{ name = "platinum coin", chance = 100000, maxCount = 10 },
	{ name = "crystal coin", chance = 2000, maxCount = 1 }, -- moneda extra excepcional
	{ name = "ham", chance = 40000, maxCount = 3 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 15000 },
	{ name = "strong health potion", chance = 9000 },
	{ name = "strong mana potion", chance = 10000 },
	-- Gemas originales y materiales de addon (si aplica)
	{ id = 3039, chance = 2000 },
	{ name = "violet gem", chance = 1000 },
	{ id = 12413, chance = 25000 }, -- bolsa de addon
	-- Experience Scroll ID 51670 (se mantiene raro por su valor NPC)
	{ name = "experience scroll", chance = 750 },
	-- Plate Set
	{ name = "plate armor", chance = 4200 },
	{ name = "plate legs", chance = 3900 },
	{ name = "steel helmet", chance = 4500 },
	{ name = "bonelord shield", chance = 3700 },
	-- Knight Set
	{ name = "knight armor", chance = 3900 },
	{ name = "knight legs", chance = 3800 },
	{ name = "knight axe", chance = 3300 },
	{ name = "devil helmet", chance = 3100 },
	{ name = "tower shield", chance = 2800 },
	-- Crown Set
	{ name = "crown armor", chance = 2500 },
	{ name = "crown legs", chance = 2500 },
	{ name = "crown helmet", chance = 3300 },
	{ name = "crown shield", chance = 2200 },
	{ id = 3055, chance = 6500 }, -- Platinum Amulet (Crown Set)
	-- Fire Sword, Fire Axe y Dragonbone Staff (raras)
	{ name = "fire sword", chance = 2800 },
	{ name = "fire axe", chance = 3600 },
	{ name = "dragonbone staff", chance = 2800 },
	{ id = 3341, chance = 100 }, -- Arcane Staff original: drop unico raro conservado
	-- Botas de progresion por set
	{ id = 3079, chance = 2800 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 2200 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





