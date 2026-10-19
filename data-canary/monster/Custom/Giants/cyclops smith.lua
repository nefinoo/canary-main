local mType = Game.createMonsterType("cyclops smith")
local monster = {}

monster.name = "cyclops smith"
monster.description = "a cyclops smith"
monster.experience = 255000
monster.outfit = {
	lookType = 277,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 389
monster.Bestiary = {
	class = "Giant",
	race = BESTY_RACE_GIANT,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Cyclopolis second floor and below, Mistrock, Mount Sternum, \z
		Cyclops Camp second floor and in the Cyclops version of the Forsaken Mine.",
}


monster.health = 435
monster.maxHealth = 435
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 656
monster.speed = 220
monster.summonCost = 695

monster.changeTarget = {
	interval = 2000,
	chance = 5
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = false,
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
	{text = "Outis emoi g' onoma.", yell = false},
	{text = "Whack da humy!", yell = false},
	{text = "Ai humy phary ty kaynon", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 70, attack = 50},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -46, maxDamage = -74, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_WHIRLWINDCLUB},
	{name ="drunk", interval = 1000, chance = 10, drunkenness = 25, duration = 10000}
}

monster.defenses = {
	defense = 24,
	armor = 17
}

monster.loot = {
	{name = "battle shield", chance = 1500},
	{name = "dark helmet", chance = 200},
	{name = "gold coin", chance = 4000, maxCount = 70},
	{name = "ham", chance = 2000},
	{name = "meat", chance = 5000, maxCount = 3},
	{name = "plate shield", chance = 2000},
	{name = "heavy machete", chance = 2000},
	{id = 7398, chance = 1500},
	{id = 12413, chance = 3000},
	{id = 3399, chance = 80},
	{id = 8095, chance = 80},
	{id = 3408, chance = 80},
}

mType:register(monster)





