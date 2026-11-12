local mType = Game.createMonsterType("outlawed sorcerer")
local monster = {}

monster.name = "outlawed sorcerer"
monster.description = "an outlawed sorcerer"
monster.experience = 500000
monster.outfit = {
	lookType = 66,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 66
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Mount Sternum Undead Cave, Dwarf Mines, Circle Room in Kazordoon, Triangle Tower, \z
		Tiquanda Dwarf Cave, Cormaya Dwarven Cave, Beregar Mines.",
}

monster.health = 4650
monster.maxHealth = 4650
monster.runHealth = 150
monster.race = "blood"
monster.corpse = 6015
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
	{text = "Dust to dust.", yell = false},
	{text = "Earth is the strongest element.", yell = false},
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -40, maxDamage = -115 },
	{name ="combat", interval = 4000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -205, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 4000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -45, maxDamage = -165, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK},
	{name ="combat", interval = 4000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -25, maxDamage = -110, range = 7, radius = 1, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_HEALING, minDamage = 25, maxDamage = 70, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	-- Oro, comida y pociones para el nivel 106
	{ name = "gold coin", chance = 90000, maxCount = 130 },
	{ name = "dark mushroom", chance = 35000, maxCount = 3 },
	{ name = "health potion", chance = 11000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 5000 },
	{ name = "strong mana potion", chance = 5000 },
	-- Material de addon y scroll de experiencia: originales conservados, probabilidad balanceada
	{ name = "iron ore", chance = 3500 },
	{ name = "experience scroll", chance = 140 }, -- ID 51670, recompensa muy rara (Nephy 50000 gp)
	{ id = 12413, chance = 14500 },
	-- Gemas originales de la zona
	{ name = "small amethyst", chance = 6000, maxCount = 2 },
	{ name = "red gem", chance = 300 },
	-- Equipo progresivo
	{ name = "plate armor", chance = 5400 },
	{ name = "plate legs", chance = 5100 },
	{ name = "steel helmet", chance = 5900 },
	{ name = "bonelord shield", chance = 5100 },
	{ name = "knight armor", chance = 3900 },
	{ name = "knight legs", chance = 3500 },
	{ name = "knight axe", chance = 2900 },
	{ name = "devil helmet", chance = 2700 },
	{ name = "tower shield", chance = 2400 },
	-- Crown Set: raro
	{ name = "crown armor", chance = 430 },
	{ name = "crown legs", chance = 430 },
	{ name = "crown helmet", chance = 520 },
	{ name = "crown shield", chance = 390 },
	-- Armas raras
	{ name = "fire sword", chance = 1300 },
	{ name = "fire axe", chance = 1300 },
	{ name = "dragonbone staff", chance = 1900 },
	-- Botas de progresion por set
	{ id = 3079, chance = 2400 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 390 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





