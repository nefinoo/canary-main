local mType = Game.createMonsterType("cyclops smith")
local monster = {}

monster.name = "cyclops smith"
monster.description = "a cyclops smith"
monster.experience = 70000
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


monster.health = 620
monster.maxHealth = 620
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -26, maxDamage = -94 },
	{name ="combat", interval = 3000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -16, maxDamage = -50, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_WHIRLWINDCLUB},
	{name ="drunk", interval = 6000, chance = 8, drunkenness = 15, duration = 3000}
}

monster.defenses = {
	defense = 20,
	armor = 13
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 22 },
	{ name = "health potion", chance = 28000 },
	{ name = "mana potion", chance = 26000 },
	{ name = "ham", chance = 60000, maxCount = 3 },
	{ name = "cyclops toe", chance = 10280 },
	{ name = "steel helmet", chance = 1700 },
	{ name = "plate legs", chance = 1620 },
	{ name = "blue legs", chance = 1530 },
	{ name = "bonelord shield", chance = 1450 },
	{ name = "spellbook of enlightenment", chance = 1450 },
	{ name = "plate armor", chance = 1360 },
	{ name = "focus cape", chance = 1280 },
	{ name = "paladin armor", chance = 1190 },
	{ name = "hat of the mad", chance = 1700 },
	{ id = 3295, chance = 1650 }, -- bright sword
	{ id = 7456, chance = 1650 }, -- noble axe
	{ id = 3333, chance = 1650 }, -- crystal mace
	{ id = 7378, chance = 1650 }, -- royal spear
	{ id = 3067, chance = 1650 }, -- hailstorm rod
	{ id = 3071, chance = 1650 }, -- wand of inferno
}

mType:register(monster)





