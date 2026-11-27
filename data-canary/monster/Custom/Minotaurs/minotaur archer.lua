local mType = Game.createMonsterType("minotaur archer")
local monster = {}

monster.name = "minotaur archer"
monster.description = "a minotaur archer"
monster.experience = 9000
monster.outfit = {
	lookType = 24,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 24
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Ancient Temple, way to Mintwallin, Folda Underground Cave, Outlaw Camp, Plains of Havoc, \z
		Kazordoon Minotaur Tower, Daramian Minotaur Pyramid, Deeper Fibula Dungeon (level 50+ to open the door), \z
		Hero Cave, Foreigner Quarter and Elvenbane.",
}

monster.health = 190
monster.maxHealth = 190
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5982
monster.speed = 170
monster.summonCost = 390

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
	canPushItems = false,
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
	{text = "Ruan Wihmpy!", yell = false},
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
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -6, maxDamage = -24 },
	{name ="combat", interval = 2000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -10, maxDamage = -32, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_BOLT}
}

monster.defenses = {
	defense = 7,
	armor = 4
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 16 },
	{ name = "health potion", chance = 17000 },
	{ name = "mana potion", chance = 17000 },
	{ name = "meat", chance = 45000, maxCount = 2 },
	{ name = "minotaur leather", chance = 5000 },
	{ name = "minotaur horn", chance = 5000, maxCount = 2 },
	{ name = "broken crossbow", chance = 15400 },
	{ name = "piece of archer armor", chance = 15400 },
	{ id = 3404, chance = 770 },
	{ id = 3560, chance = 990 },
	{ id = 3428, chance = 940 },
	{ id = 3403, chance = 1100 },
	{ id = 3295, chance = 800 }, -- bright sword
	{ id = 7456, chance = 800 }, -- noble axe
	{ id = 3333, chance = 800 }, -- crystal mace
	{ id = 7378, chance = 800 }, -- royal spear
	{ id = 3067, chance = 800 }, -- hailstorm rod
	{ id = 3071, chance = 800 }, -- wand of inferno
	-- Armas nivel 30
	{ id = 3280, chance = 1120 }, -- fire sword
	{ id = 3318, chance = 1120 }, -- knight axe
	{ id = 3324, chance = 1120 }, -- skull staff
	{ id = 3347, chance = 1120 }, -- hunting spear
	{ id = 3065, chance = 1120 }, -- terra rod
	{ id = 3073, chance = 1120 }, -- wand of cosmic energy
}

mType:register(monster)





