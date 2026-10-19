local mType = Game.createMonsterType("outlawed elite guard")
local monster = {}

monster.name = "outlawed elite guard"
monster.description = "an outlawed elite guard"
monster.experience = 7500000
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

monster.health = 5300
monster.maxHealth = 5300
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -318, maxDamage = -474 },
	{name ="combat", interval = 4000, chance = 65, type = COMBAT_ENERGYDAMAGE, minDamage = -318, maxDamage = -474, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 22,
	armor = 15,
	{name ="speed", interval = 2000, chance = 20, speed = {min = 350, max = 350}, duration = 10000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "small sapphire", chance = 75000, maxCount = 5},
	{name = "green gem", chance = 2500},
	{name = "platinum coin", chance = 50000, maxCount = 3},
	{name = "boots of haste", chance = 250},
	{name = "golden legs", chance = 500},
	{name = "magic plate armor", chance = 450},
	{name = "experience scroll", chance = 800},
	{ name = "iron ore", chance = 1050 },
	{id = 12413, chance = 10000},
}

mType:register(monster)





