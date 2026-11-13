local mType = Game.createMonsterType("undead mage")
local monster = {}

monster.name = "undead mage"
monster.description = "an undead mage"
monster.experience = 15000000
monster.outfit = {
	lookType = 9,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 18500
monster.maxHealth = 18500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
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
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance =5,
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
	{text = "Taste the sweetness of death!", yell = false},
	{text = "Your corpse will be mine!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -250, maxDamage = -645, condition = {type = CONDITION_POISON, startDamage = 45, interval = 5000} },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -230, maxDamage = -675, range = 1, radius = 1, target = true, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -290, maxDamage = -790, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA }
}

monster.defenses = {
	defense = 28,
	armor = 32,
	{ name = "combat", interval = 4000, chance = 12, type = COMBAT_HEALING, minDamage = 35, maxDamage = 85, effect = CONST_ME_MAGIC_BLUE }
}

monster.maxSummons = 2
monster.summons = {
	{ name = "ghost", chance = 7, interval = 5000, max = 2 },
	{ name = "ghoul", chance = 7, interval = 5000, max = 2 },
	{ name = "mummy", chance = 3, interval = 6000, max = 1 }
}

monster.loot = {
	-- Dinero y consumibles; una sola tirada principal de moneda
	{ name = "platinum coin", chance = 90000, maxCount = 5 },
	{ name = "ham", chance = 40000, maxCount = 3 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 15000 },
	{ name = "strong health potion", chance = 9000 },
	{ name = "strong mana potion", chance = 10000 },
	-- Gemas originales y materiales de addon (si aplica)
	{ name = "yellow gem", chance = 3500 },
	{ name = "green gem", chance = 2000 },
	{ id = 12413, chance = 14500 }, -- bolsa de addon
	-- Experience Scroll ID 51670 (se mantiene raro por su valor NPC)
	{ name = "experience scroll", chance = 240 },
	-- Plate Set
	{ name = "plate armor", chance = 2700 },
	{ name = "plate legs", chance = 2500 },
	{ name = "steel helmet", chance = 3000 },
	{ name = "bonelord shield", chance = 2400 },
	-- Knight Set
	{ name = "knight armor", chance = 2100 },
	{ name = "knight legs", chance = 2000 },
	{ name = "knight axe", chance = 1800 },
	{ name = "devil helmet", chance = 1600 },
	{ name = "tower shield", chance = 1450 },
	-- Crown Set
	{ name = "crown armor", chance = 950 },
	{ name = "crown legs", chance = 900 },
	{ name = "crown helmet", chance = 1200 },
	{ name = "crown shield", chance = 850 },
	{ id = 3055, chance = 5500 }, -- Platinum Amulet (Crown Set)
	-- Fire Sword, Fire Axe y Dragonbone Staff (raras)
	{ name = "fire sword", chance = 1200 },
	{ name = "fire axe", chance = 1300 },
	{ name = "dragonbone staff", chance = 2100 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1450 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 850 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





