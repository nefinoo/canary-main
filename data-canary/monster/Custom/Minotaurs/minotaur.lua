local mType = Game.createMonsterType("minotaur")
local monster = {}

monster.name = "minotaur"
monster.description = "a minotaur"
monster.experience = 25000
monster.outfit = {
	lookType = 25,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 25
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Mino Hell (Rookgaard), Two outside Bear Room Quest, (Rookgaard) and also 2x on the premium side, \z
		Mintwallin, Folda, Minotaur Pyramid, Outlaw Camp, Kazordoon minotaur cave, Plains of Havoc, Elven Bane, \z
		Deeper Fibula Dungeon (level 50+ to open the door), Ancient Temple, Maze of Lost Souls, \z
		Thais Minotaur Camp, Foreigner Quarter.",
}


monster.health = 230
monster.maxHealth = 230
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5969
monster.speed = 170
monster.summonCost = 330

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
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
	{text = "Kaplar!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 25, attack = 15}
}

monster.defenses = {
	defense = 11,
	armor = 11
}

monster.loot = {
	{ name = "gold coin", chance = 80000, maxCount = 18 },
	{ name = "meat", chance = 45000, maxCount = 3 },
	{ name = "health potion", chance = 1500 },
	{ name = "mana potion", chance = 1500 },
	{ name = "minotaur leather", chance = 10000 }, -- material de addon conservado
	{ id = 12413, chance = 3000 }, -- bolsa aleatoria de objetos de addon
	{ name = "plate armor", chance = 380 }, -- equipo muy raro
	{ name = "plate legs", chance = 380 }, -- equipo muy raro
	{ name = "steel helmet", chance = 380 }, -- equipo muy raro
	{ name = "bonelord shield", chance = 380 }, -- equipo muy raro
}

mType:register(monster)





