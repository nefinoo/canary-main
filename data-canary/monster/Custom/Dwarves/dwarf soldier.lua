local mType = Game.createMonsterType("outlawed ranger")
local monster = {}

monster.name = "outlawed ranger"
monster.description = "an outlawed ranger"
monster.experience = 7500000
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

monster.health = 4700
monster.maxHealth = 4700
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -318, maxDamage = -474 },
	{name ="combat", interval = 4000, chance = 85, type = COMBAT_PHYSICALDAMAGE, minDamage = -318, maxDamage = -474, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BOLT},
	{name ="combat", interval = 6000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -318, maxDamage = -474, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 20,
	armor = 9
}

monster.loot = {
	{name = "small ruby", chance = 75000, maxCount = 3},
	{id = 3039, chance = 2100},
	{name = "platinum coin", chance = 35000, maxCount = 3},
	{name = "dragon lance", chance = 250},
	{name = "golden armor", chance = 450},
	{name = "magic plate armor", chance = 400},
	{name = "demon shield", chance = 250},
	{name = "experience scroll", chance = 600},
	{ name = "iron ore", chance = 700 },
	{id = 12413, chance = 10000},
}

mType:register(monster)





