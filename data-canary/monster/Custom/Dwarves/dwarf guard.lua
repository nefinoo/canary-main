local mType = Game.createMonsterType("outlawed elite guard")
local monster = {}

monster.name = "outlawed elite guard"
monster.description = "an outlawed elite guard"
monster.experience = 2650000
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

monster.health = 6000
monster.maxHealth = 6000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6013
monster.speed = 300
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -140, maxDamage = -300 },
	{name ="combat", interval = 4000, chance = 38, type = COMBAT_ENERGYDAMAGE, minDamage = -90, maxDamage = -200, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 24,
	armor = 17,
	{name ="speed", interval = 2000, chance = 20, speed = {min = 100, max = 100}, duration = 5000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	-- Oro, comida y pociones para nivel 200+
	{ name = "gold coin", chance = 90000, maxCount = 240 },
	{ name = "ham", chance = 50000, maxCount = 3 },
	{ name = "health potion", chance = 11000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 7500 },
	{ name = "strong mana potion", chance = 7500 },
	{ name = "great health potion", chance = 3000 },
	{ name = "great mana potion", chance = 3000 },
	{ name = "great spirit potion", chance = 1500 },
	-- Material de addon y scroll de experiencia: originales conservados, probabilidad balanceada
	{ name = "iron ore", chance = 4200 },
	{ name = "experience scroll", chance = 180 }, -- ID 51670, recompensa muy rara (Nephy 50000 gp)
	{ id = 12413, chance = 16000 },
	-- Gemas originales de la zona
	{ name = "small sapphire", chance = 8000, maxCount = 2 },
	{ name = "green gem", chance = 180 },
	-- Set 1: Knight (nivel 30)
	{ id = 3351, chance = 9350 },
	{ id = 3357, chance = 7870 },
	{ id = 3557, chance = 8980 },
	{ id = 3554, chance = 9720 },
	{ id = 3428, chance = 8120 },
	-- Set 2: Knight (nivel 50)
	{ id = 3396, chance = 4310 },
	{ id = 3397, chance = 3260 },
	{ id = 3398, chance = 3750 },
	{ id = 4033, chance = 4670 },
	{ id = 3419, chance = 3570 },
	-- Set 3: Knight (nivel 100)
	{ id = 875, chance = 1850 },
	{ id = 21167, chance = 1290 },
	{ id = 21168, chance = 1540 },
	{ id = 21169, chance = 2030 },
	{ id = 14088, chance = 1540 },
	{ id = 3055, chance = 2700 }, -- Platinum Amulet
	-- Armas nivel 30
	{ id = 3280, chance = 4800 }, -- fire sword
	{ id = 3318, chance = 4800 }, -- knight axe
	{ id = 3324, chance = 4800 }, -- skull staff
	-- Armas nivel 50
	{ id = 3295, chance = 3800 }, -- bright sword
	{ id = 7456, chance = 3800 }, -- noble axe
	{ id = 3333, chance = 3800 }, -- crystal mace
}

mType:register(monster)





