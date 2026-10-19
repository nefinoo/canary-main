local mType = Game.createMonsterType("cyclops")
local monster = {}

monster.name = "cyclops"
monster.description = "a cyclops"
monster.experience = 150000
monster.outfit = {
	lookType = 22,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 22
monster.Bestiary = {
	class = "Giant",
	race = BESTY_RACE_GIANT,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Plains of Havoc, Mount Sternum, Femor Hills, Cyclops Camp, Cyclopolis, Ancient Temple, Shadowthorn, \z
	Orc Fort, Mistrock, Foreigner Quarter, Outlaw Camp and in the Cyclops version of the Forsaken Mine. ",
}


monster.health = 260
monster.maxHealth = 260
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5962
monster.speed = 200
monster.summonCost = 490

monster.changeTarget = {
	interval = 5000,
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
	{text = "Il lorstok human!", yell = false},
	{text = "Toks utat.", yell = false},
	{text = "Human, uh whil dyh!", yell = false},
	{text = "Youh ah trak!", yell = false},
	{text = "Let da mashing begin!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 25},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100}
}

monster.defenses = {
	defense = 20,
	armor = 15
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 80},
	{name = "short sword", chance = 33333},
	{id = 3093, chance = 2000},
	{name = "dark helmet", chance = 4000},
	{id = 3012, chance = 6666},
	{name = "meat", chance = 33333, maxCount = 3},
	{name = "battle shield", chance = 2500},
	{name = "brass shield", chance = 2857},
	{name = "halberd", chance = 5000},
	{name = "gold coin", chance = 20000, maxCount = 10},
	{name = "ham", chance = 33333, maxCount = 3},
	{id = 12413, chance = 3000},
	{id = 3399, chance = 65},
	{id = 8095, chance = 65},
	{id = 3408, chance = 65},
}

mType:register(monster)





