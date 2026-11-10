local mType = Game.createMonsterType("minotaur mage")
local monster = {}

monster.name = "minotaur mage"
monster.description = "a minotaur mage"
monster.experience = 5500
monster.outfit = {
	lookType = 23,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 23
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Cyclopolis, Mintwallin, Maze of Lost Souls, Dark Pyramid, Folda (hidden cave), \z
		Kazordoon (The Horned Fox's hideout), the Plains of Havoc, Point of No Return south of Outlaw Camp, \z
		Elvenbane, the depths of Fibula Dungeon (level 50+), cave east from Dwarf Bridge, Foreigner Quarter, \z
		Rookgaard Minotaur Hell (not reachable).",
}


monster.health = 420
monster.maxHealth = 420
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5981
monster.speed = 170
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	{text = "Learrn tha secrret uf deathhh!", yell = false},
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 18, attack = 15},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_ENERGYDAMAGE, minDamage = -7, maxDamage = -30, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -12, maxDamage = -55, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="energyfield", interval = 1000, chance = 7, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY}
}

monster.defenses = {
	defense = 20,
	armor = 18
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 70 },
	{ name = "ham", chance = 40000, maxCount = 2 },
	{ name = "health potion", chance = 2500 },
	{ name = "mana potion", chance = 3500 },
	{ name = "minotaur leather", chance = 5000 }, -- material de addon conservado
	{ id = 12413, chance = 3000 }, -- bolsa aleatoria de objetos de addon
	{ name = "plate armor", chance = 25 }, -- equipo muy raro
	{ name = "plate legs", chance = 25 }, -- equipo muy raro
	{ name = "steel helmet", chance = 30 }, -- equipo muy raro
	{ name = "bonelord shield", chance = 20 }, -- equipo muy raro
}

mType:register(monster)





