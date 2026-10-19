local mType = Game.createMonsterType("orc warrior")
local monster = {}

monster.name = "orc warrior"
monster.description = "a orc warrior"
monster.experience = 160000
monster.outfit = {
	lookType = 7,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 7
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Ancient Temple in Thais, Orc Fort, below Point of No Return in Outlaw Camp and inside a \z
		mountain north of it, Orc Peninsula, Folda, Edron Orc cave, Maze of Lost Souls, Elvenbane Castle, \z
		Foreigner Quarter, Zao Orc Land.",
}


monster.health = 125
monster.maxHealth = 125
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 5979
monster.speed = 190
monster.summonCost = 360

monster.changeTarget = {
	interval = 190,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
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
	{text = "Alk!", yell = false},
	{text = "Grow truk grrrr.", yell = false},
	{text = "Trak grrrr brik.", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -22, maxDamage = -33}
}

monster.defenses = {
	defense = 14,
	armor = 8
}

monster.loot = {
	{name = "machete", chance = 5000},	
	{name = "gold coin", chance = 100000, maxCount = 12},
	{name = "meat", chance = 40000, maxCount = 2},
	{id = 12413, chance = 2000},
	{id = 3399, chance = 17},
	{id = 8095, chance = 17},
	{id = 3408, chance = 17},
}

mType:register(monster)





