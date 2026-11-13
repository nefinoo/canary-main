local mType = Game.createMonsterType("outlawed elite guard")
local monster = {}

monster.name = "outlawed elite guard"
monster.description = "an outlawed elite guard"
monster.experience = 2250000
monster.outfit = {
	lookType = 70,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 70
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Kazordoon Dwarf Mines, Dwacatra, Ferngrims Gate, Cyclopolis, Mount Sternum Undead Cave, \z
		Stonehome Rotworm cave (near Edron), Maze of Lost Souls, Tiquanda Dwarf Cave, Beregar, Cormaya Dwarf Cave.",
}

monster.health = 6500
monster.maxHealth = 6500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6013
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -85, maxDamage = -260 },
	{name ="combat", interval = 4000, chance = 38, type = COMBAT_ENERGYDAMAGE, minDamage = -60, maxDamage = -160, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 22,
	armor = 15,
	{name ="speed", interval = 2000, chance = 20, speed = {min = 350, max = 350}, duration = 10000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	-- Oro, comida y pociones para el nivel 106
	{ name = "gold coin", chance = 90000, maxCount = 160 },
	{ name = "ham", chance = 50000, maxCount = 3 },
	{ name = "health potion", chance = 11000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 5000 },
	{ name = "strong mana potion", chance = 5000 },
	-- Material de addon y scroll de experiencia: originales conservados, probabilidad balanceada
	{ name = "iron ore", chance = 4200 },
	{ name = "experience scroll", chance = 180 }, -- ID 51670, recompensa muy rara (Nephy 50000 gp)
	{ id = 12413, chance = 16000 },
	-- Gemas originales de la zona
	{ name = "small sapphire", chance = 8000, maxCount = 2 },
	{ name = "green gem", chance = 180 },
	-- Equipo progresivo
	{ name = "plate armor", chance = 7500 },
	{ name = "plate legs", chance = 7000 },
	{ name = "steel helmet", chance = 8000 },
	{ name = "bonelord shield", chance = 5500 },
	{ name = "knight armor", chance = 1750 },
	{ name = "knight legs", chance = 1600 },
	{ name = "knight axe", chance = 1400 },
	{ name = "devil helmet", chance = 1350 },
	{ name = "tower shield", chance = 850 },
	-- Crown Set: raro
	{ name = "crown armor", chance = 420 },
	{ name = "crown legs", chance = 400 },
	{ name = "crown helmet", chance = 520 },
	{ name = "crown shield", chance = 380 },
	{ id = 3055, chance = 2200 }, -- Platinum Amulet (Crown Set)
	-- Armas raras
	{ name = "fire sword", chance = 1900 },
	{ name = "fire axe", chance = 1000 },
	{ name = "dragonbone staff", chance = 1600 },
	-- Botas de progresion por set
	{ id = 3079, chance = 320 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 380 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





