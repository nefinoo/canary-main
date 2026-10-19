local mType = Game.createMonsterType("outlawed sorcerer")
local monster = {}

monster.name = "outlawed sorcerer"
monster.description = "an outlawed sorcerer"
monster.experience = 7500000
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

monster.health = 4500
monster.maxHealth = 4500
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -318, maxDamage = -474 },
	{name ="combat", interval = 4000, chance = 50, type = COMBAT_FIREDAMAGE, minDamage = -318, maxDamage = -574, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 4000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -318, maxDamage = -550, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK},
	{name ="combat", interval = 4000, chance = 50, type = COMBAT_MANADRAIN, minDamage = -318, maxDamage = -520, range = 7, radius = 1, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 200, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "small amethyst", chance = 75000, maxCount = 5},
	{id = 3039, chance = 2500},
	{name = "platinum coin", chance = 50000, maxCount = 3},
	{name = "boots of haste", chance = 250},
	{name = "giant sword", chance = 250},
	{name = "royal helmet", chance = 250},
	{name = "steel boots", chance = 250},
	{name = "experience scroll", chance = 800},
	{ name = "iron ore", chance = 1200 },
	{id = 12413, chance = 10000},
	{id = 3399, chance = 200},
	{id = 8095, chance = 200},
	{id = 3408, chance = 200},
}

mType:register(monster)





