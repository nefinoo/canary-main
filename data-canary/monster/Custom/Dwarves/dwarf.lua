local mType = Game.createMonsterType("outlawed warrior")
local monster = {}

monster.name = "outlawed warrior"
monster.description = "an outlawed warrior"
monster.experience = 1750000
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

monster.health = 4600
monster.maxHealth = 4600
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6007
monster.speed = 350
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -75, maxDamage = -195 },
}

monster.defenses = {
	defense = 10,
	armor = 8,
	{name ="speed", interval = 2000, chance = 20, speed = {min = 350, max = 350}, duration = 10000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	-- Oro, comida y pociones para el nivel 106
	{ name = "gold coin", chance = 90000, maxCount = 105 },
	{ name = "meat", chance = 42000, maxCount = 3 },
	{ name = "health potion", chance = 11000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 5000 },
	{ name = "strong mana potion", chance = 5000 },
	-- Material de addon y scroll de experiencia: originales conservados, probabilidad balanceada
	{ name = "iron ore", chance = 3000 },
	{ name = "experience scroll", chance = 80 }, -- ID 51670, recompensa muy rara (Nephy 50000 gp)
	{ id = 12413, chance = 12000 },
	-- Gemas originales de la zona
	{ name = "small diamond", chance = 6000, maxCount = 2 },
	{ name = "yellow gem", chance = 300 },
	-- Equipo progresivo
	{ name = "plate armor", chance = 7900 },
	{ name = "plate legs", chance = 7584 },
	{ name = "steel helmet", chance = 8453 },
	{ name = "bonelord shield", chance = 7584 },
	{ name = "knight armor", chance = 3450 },
	{ name = "knight legs", chance = 3243 },
	{ name = "knight axe", chance = 2691 },
	{ name = "devil helmet", chance = 2519 },
	{ name = "tower shield", chance = 2381 },
	-- Crown Set: raro
	{ name = "crown armor", chance = 300 },
	{ name = "crown legs", chance = 288 },
	{ name = "crown helmet", chance = 360 },
	{ name = "crown shield", chance = 270 },
	{ id = 3055, chance = 2400 }, -- Platinum Amulet (Crown Set)
	-- Armas raras
	{ name = "fire sword", chance = 1400 },
	{ name = "fire axe", chance = 1200 },
	{ name = "dragonbone staff", chance = 1300 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1484 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 270 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





