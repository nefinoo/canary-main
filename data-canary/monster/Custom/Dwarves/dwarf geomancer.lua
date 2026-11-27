local mType = Game.createMonsterType("outlawed sorcerer")
local monster = {}

monster.name = "outlawed sorcerer"
monster.description = "an outlawed sorcerer"
monster.experience = 2500000
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

monster.health = 5400
monster.maxHealth = 5400
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6015
monster.speed = 260
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -55, maxDamage = -135 },
	{name ="combat", interval = 4000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -95, maxDamage = -245, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 4000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -80, maxDamage = -220, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK},
	{name ="combat", interval = 4000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -35, maxDamage = -130, range = 7, radius = 1, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_HEALING, minDamage = 25, maxDamage = 70, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	-- Oro, comida y pociones para nivel 200+
	{ name = "gold coin", chance = 90000, maxCount = 210 },
	{ name = "dark mushroom", chance = 35000, maxCount = 3 },
	{ name = "health potion", chance = 11000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 7500 },
	{ name = "strong mana potion", chance = 7500 },
	{ name = "great health potion", chance = 3000 },
	{ name = "great mana potion", chance = 3000 },
	{ name = "great spirit potion", chance = 1500 },
	-- Material de addon y scroll de experiencia: originales conservados, probabilidad balanceada
	{ name = "iron ore", chance = 3500 },
	{ name = "experience scroll", chance = 140 }, -- ID 51670, recompensa muy rara (Nephy 50000 gp)
	{ id = 12413, chance = 14500 },
	-- Gemas originales de la zona
	{ name = "small amethyst", chance = 6000, maxCount = 2 },
	{ id = 3039, chance = 300 },
	-- Set 1: Mage (nivel 30)
	{ id = 7458, chance = 8660 },
	{ id = 7463, chance = 7300 },
	{ id = 7464, chance = 8320 },
	{ id = 3550, chance = 9010 },
	{ id = 8072, chance = 7520 },
	-- Set 2: Mage (nivel 50)
	{ id = 7462, chance = 3990 },
	{ id = 22085, chance = 3020 },
	{ id = 22087, chance = 3480 },
	{ id = 3079, chance = 4330 },
	{ id = 8073, chance = 3310 },
	-- Set 3: Mage (nivel 100)
	{ id = 3573, chance = 1710 },
	{ id = 3567, chance = 1200 },
	{ id = 645, chance = 1420 },
	{ id = 32619, chance = 1880 },
	{ id = 8075, chance = 1420 },
	-- Armas nivel 30
	{ id = 3065, chance = 4700 }, -- terra rod
	{ id = 3073, chance = 4700 }, -- wand of cosmic energy
	-- Armas nivel 50
	{ id = 3067, chance = 3700 }, -- hailstorm rod
	{ id = 3071, chance = 3700 }, -- wand of inferno
}

mType:register(monster)





