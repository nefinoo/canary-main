local mType = Game.createMonsterType("hell soldier")
local monster = {}

monster.name = "hell soldier"
monster.description = "a hell soldier"
monster.experience = 12500000
monster.outfit = {
	lookType = 37,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 17500
monster.maxHealth = 17500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5963
monster.speed = 230
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
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -345, maxDamage = -855 },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -375, maxDamage = -935, range = 1, radius = 1, target = true }
}

monster.defenses = {
	defense = 34,
	armor = 42
}

monster.loot = {
	-- Dinero y consumibles; una sola tirada principal de moneda
	{ name = "platinum coin", chance = 90000, maxCount = 7 },
	{ name = "ham", chance = 40000, maxCount = 3 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 15000 },
	{ name = "strong health potion", chance = 9000 },
	{ name = "strong mana potion", chance = 10000 },
	-- Gemas originales y materiales de addon (si aplica)
	{ name = "yellow gem", chance = 3500 },
	{ name = "green gem", chance = 2000 },
	{ name = "violet gem", chance = 500 },
	{ id = 12413, chance = 16000 }, -- bolsa de addon
	-- Experience Scroll ID 51670 (se mantiene raro por su valor NPC)
	{ name = "experience scroll", chance = 280 },
	-- Plate Set
	{ name = "plate armor", chance = 10500 },
	{ name = "plate legs", chance = 10080 },
	{ name = "steel helmet", chance = 11235 },
	{ name = "bonelord shield", chance = 10080 },
	-- Knight Set
	{ name = "knight armor", chance = 5350 },
	{ name = "knight legs", chance = 5029 },
	{ name = "knight axe", chance = 4173 },
	{ name = "devil helmet", chance = 3905 },
	{ name = "tower shield", chance = 3691 },
	-- Crown Set
	{ name = "crown armor", chance = 1100 },
	{ name = "crown legs", chance = 1056 },
	{ name = "crown helmet", chance = 1320 },
	{ name = "crown shield", chance = 990 },
	{ id = 3055, chance = 4600 }, -- Platinum Amulet (Crown Set)
	-- Fire Sword, Fire Axe y Dragonbone Staff (raras)
	{ name = "fire sword", chance = 1650 },
	{ name = "fire axe", chance = 2200 },
	{ name = "dragonbone staff", chance = 1300 },
	-- Botas de progresion por set
	{ id = 3079, chance = 2301 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 990 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





