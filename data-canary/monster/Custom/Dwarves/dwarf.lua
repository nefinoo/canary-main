local mType = Game.createMonsterType("outlawed warrior")
local monster = {}

monster.name = "outlawed warrior"
monster.description = "an outlawed warrior"
monster.experience = 2000000
monster.outfit = {
	lookType = 69,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 69
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Kazordoon Dwarf Mines, Dwarf Bridge, deep Elvenbane, Tiquanda Dwarf Cave, Cormaya Dwarf Cave, \z
		Island of Destiny (Knights area), Beregar.",
}

monster.health = 5200
monster.maxHealth = 5200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6007
monster.speed = 280
monster.summonCost = 0

monster.changeTarget = {
	interval = 350,
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
	canPushItems = false,
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
	{text = "Hail Durin!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -110, maxDamage = -250 },
}

monster.defenses = {
	defense = 12,
	armor = 10,
	{name ="speed", interval = 2000, chance = 20, speed = {min = 100, max = 100}, duration = 5000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	-- Oro, comida y pociones para nivel 200+
	{ name = "gold coin", chance = 90000, maxCount = 180 },
	{ name = "meat", chance = 42000, maxCount = 3 },
	{ name = "health potion", chance = 11000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 7500 },
	{ name = "strong mana potion", chance = 7500 },
	{ name = "great health potion", chance = 3000 },
	{ name = "great mana potion", chance = 3000 },
	{ name = "great spirit potion", chance = 1500 },
	-- Material de addon y scroll de experiencia: originales conservados, probabilidad balanceada
	{ name = "iron ore", chance = 3000 },
	{ name = "experience scroll", chance = 80 }, -- ID 51670, recompensa muy rara (Nephy 50000 gp)
	{ id = 12413, chance = 12000 },
	-- Gemas originales de la zona
	{ name = "small diamond", chance = 6000, maxCount = 2 },
	{ name = "yellow gem", chance = 300 },
	-- Set 1: Knight (nivel 30)
	{ id = 3351, chance = 7600 },
	{ id = 3357, chance = 6400 },
	{ id = 3557, chance = 7300 },
	{ id = 3554, chance = 7900 },
	{ id = 3428, chance = 6600 },
	-- Set 2: Knight (nivel 50)
	{ id = 3396, chance = 3500 },
	{ id = 3397, chance = 2650 },
	{ id = 3398, chance = 3050 },
	{ id = 4033, chance = 3800 },
	{ id = 3419, chance = 2900 },
	-- Set 3: Knight (nivel 100)
	{ id = 875, chance = 1500 },
	{ id = 21167, chance = 1050 },
	{ id = 21168, chance = 1250 },
	{ id = 21169, chance = 1650 },
	{ id = 14088, chance = 1250 },
	{ id = 3055, chance = 2400 }, -- Platinum Amulet
	-- Armas nivel 30
	{ id = 3280, chance = 4500 }, -- fire sword
	{ id = 3318, chance = 4500 }, -- knight axe
	{ id = 3324, chance = 4500 }, -- skull staff
	-- Armas nivel 50
	{ id = 3295, chance = 3500 }, -- bright sword
	{ id = 7456, chance = 3500 }, -- noble axe
	{ id = 3333, chance = 3500 }, -- crystal mace
}

mType:register(monster)





