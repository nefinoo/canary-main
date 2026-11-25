local mType = Game.createMonsterType("cyclops drone")
local monster = {}

monster.name = "cyclops drone"
monster.description = "a cyclops drone"
monster.experience = 55000
monster.outfit = {
	lookType = 280,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 391
monster.Bestiary = {
	class = "Giant",
	race = BESTY_RACE_GIANT,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Cyclopolis, Mount Sternum, Mistrock and in the Cyclops version of the Forsaken Mine.",
}


monster.health = 480
monster.maxHealth = 480
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 771
monster.speed = 220
monster.summonCost = 525

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
	{text = "Fee! Fie! Foe! Fum!", yell = false},
	{text = "Luttl pest!", yell = false},
	{text = "Me makking you pulp!", yell = false},
	{text = "Humy tasy! Hum hum!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -22, maxDamage = -78 },
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -12, maxDamage = -40, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK}
}

monster.defenses = {
	defense = 17,
	armor = 11
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 18 },
	{ name = "health potion", chance = 24000 },
	{ name = "mana potion", chance = 22000 },
	{ name = "ham", chance = 55000, maxCount = 3 },
	{ name = "cyclops toe", chance = 6750 },
	{ name = "plate armor", chance = 1280 },
	{ name = "bonelord shield", chance = 1360 },
	{ name = "blue legs", chance = 1440 },
	{ name = "hat of the mad", chance = 1600 },
	{ name = "spellbook of enlightenment", chance = 1360 },
	{ id = 3295, chance = 1450 }, -- bright sword
	{ id = 7456, chance = 1450 }, -- noble axe
	{ id = 3333, chance = 1450 }, -- crystal mace
	{ id = 7378, chance = 1450 }, -- royal spear
	{ id = 3067, chance = 1450 }, -- hailstorm rod
	{ id = 3071, chance = 1450 }, -- wand of inferno
}

mType:register(monster)





