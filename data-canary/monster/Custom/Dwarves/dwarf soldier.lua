local mType = Game.createMonsterType("outlawed ranger")
local monster = {}

monster.name = "outlawed ranger"
monster.description = "an outlawed ranger"
monster.experience = 2250000
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

monster.health = 5500
monster.maxHealth = 5500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6014
monster.speed = 270
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
	targetDistance = 3,
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -65, maxDamage = -155 },
	{name ="combat", interval = 4000, chance = 48, type = COMBAT_PHYSICALDAMAGE, minDamage = -90, maxDamage = -230, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BOLT},
	{name ="combat", interval = 6000, chance = 45, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -260, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 20,
	armor = 12
}

monster.loot = {
	-- Oro, comida y pociones para nivel 200+
	{ name = "gold coin", chance = 90000, maxCount = 195 },
	{ name = "ham", chance = 40000, maxCount = 3 },
	{ name = "health potion", chance = 11000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 7500 },
	{ name = "strong mana potion", chance = 7500 },
	{ name = "great health potion", chance = 3000 },
	{ name = "great mana potion", chance = 3000 },
	{ name = "great spirit potion", chance = 1500 },
	-- Material de addon y scroll de experiencia: originales conservados, probabilidad balanceada
	{ name = "iron ore", chance = 2500 },
	{ name = "experience scroll", chance = 105 }, -- ID 51670, recompensa muy rara (Nephy 50000 gp)
	{ id = 12413, chance = 13000 },
	-- Gemas originales de la zona
	{ name = "small ruby", chance = 6500, maxCount = 2 },
	{ id = 3039, chance = 350 },
	-- Set 1: Paladin (nivel 30)
	{ id = 3403, chance = 8210 },
	{ id = 3404, chance = 6910 },
	{ id = 3560, chance = 7880 },
	{ id = 9017, chance = 8530 },
	{ id = 3428, chance = 7130 },
	-- Set 2: Paladin (nivel 50)
	{ id = 3385, chance = 3780 },
	{ id = 3381, chance = 2860 },
	{ id = 3382, chance = 3290 },
	{ id = 21981, chance = 4100 },
	{ id = 3419, chance = 3130 },
	-- Set 3: Paladin (nivel 100)
	{ id = 10385, chance = 1620 },
	{ id = 10384, chance = 1130 },
	{ id = 10387, chance = 1350 },
	{ id = 10386, chance = 1780 },
	{ id = 14088, chance = 1350 },
	{ id = 3055, chance = 2550 }, -- Platinum Amulet
	-- Armas nivel 30
	{ id = 3347, chance = 4600 }, -- hunting spear
	-- Armas nivel 50
	{ id = 7378, chance = 3600 }, -- royal spear
}

mType:register(monster)





