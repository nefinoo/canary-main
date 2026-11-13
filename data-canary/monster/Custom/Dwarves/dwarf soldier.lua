local mType = Game.createMonsterType("outlawed ranger")
local monster = {}

monster.name = "outlawed ranger"
monster.description = "an outlawed ranger"
monster.experience = 2000000
monster.outfit = {
	lookType = 71,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 71
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Kazordoon Dwarf Mines, Cyclopolis, Dwacatra, Ferngrims Gate, Dwarf Bridge, \z
		Mount Sternum Undead Cave, Beregar, Tiquanda Dwarf Cave, Cormaya Dwarf Cave.",
}

monster.health = 5000
monster.maxHealth = 5000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6014
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -50, maxDamage = -135 },
	{name ="combat", interval = 4000, chance = 48, type = COMBAT_PHYSICALDAMAGE, minDamage = -55, maxDamage = -185, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BOLT},
	{name ="combat", interval = 6000, chance = 45, type = COMBAT_PHYSICALDAMAGE, minDamage = -60, maxDamage = -215, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 20,
	armor = 9
}

monster.loot = {
	-- Oro, comida y pociones para el nivel 106
	{ name = "gold coin", chance = 90000, maxCount = 115 },
	{ name = "ham", chance = 40000, maxCount = 3 },
	{ name = "health potion", chance = 11000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 5000 },
	{ name = "strong mana potion", chance = 5000 },
	-- Material de addon y scroll de experiencia: originales conservados, probabilidad balanceada
	{ name = "iron ore", chance = 2500 },
	{ name = "experience scroll", chance = 105 }, -- ID 51670, recompensa muy rara (Nephy 50000 gp)
	{ id = 12413, chance = 13000 },
	-- Gemas originales de la zona
	{ name = "small ruby", chance = 6500, maxCount = 2 },
	{ id = 3039, chance = 350 },
	-- Equipo progresivo
	{ name = "plate armor", chance = 5800 },
	{ name = "plate legs", chance = 5500 },
	{ name = "steel helmet", chance = 6100 },
	{ name = "bonelord shield", chance = 5500 },
	{ name = "knight armor", chance = 1750 },
	{ name = "knight legs", chance = 1600 },
	{ name = "knight axe", chance = 1400 },
	{ name = "devil helmet", chance = 1350 },
	{ name = "tower shield", chance = 850 },
	-- Crown Set: raro
	{ name = "crown armor", chance = 350 },
	{ name = "crown legs", chance = 350 },
	{ name = "crown helmet", chance = 450 },
	{ name = "crown shield", chance = 320 },
	{ id = 3055, chance = 2200 }, -- Platinum Amulet (Crown Set)
	-- Armas raras
	{ name = "fire sword", chance = 1600 },
	{ name = "fire axe", chance = 1000 },
	{ name = "dragonbone staff", chance = 1600 },
	-- Botas de progresion por set
	{ id = 3079, chance = 320 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 320 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





