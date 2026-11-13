local mType = Game.createMonsterType("orc warlord")
local monster = {}

monster.name = "orc warlord"
monster.description = "a orc warlord"
monster.experience = 25000
monster.outfit = {
	lookType = 2,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Orc Teleport.",
}

monster.health = 390
monster.maxHealth = 390
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6008
monster.speed = 90
monster.summonCost = 0

monster.changeTarget = {
	interval = 290,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
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
	{text = "Futchi maruk buta!", yell = false},
	{text = "Ikem rambo zambo!", yell = false},
	{text = "Orc buta bana!", yell = false},
	{text = "Ranat Ulderek!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -8, maxDamage = -48},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -5, maxDamage = -26, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGSTAR}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="invisible", interval = 1000, chance = 4, duration = 2000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{ id = 12413, chance = 1100 }, -- bolsa de items de addon aleatorios (1.100%)
	{ name = "gold coin", chance = 90000, maxCount = 18 },
	{ name = "ham", chance = 35000, maxCount = 2 },
	{ name = "health potion", chance = 2500 },
	{ name = "mana potion", chance = 2000 },
	{ name = "plate armor", chance = 250 }, -- Frozen Hell: 0.020%
	{ name = "plate legs", chance = 250 }, -- Frozen Hell: 0.020%
	{ name = "steel helmet", chance = 250 }, -- Frozen Hell: 0.015%
	{ name = "bonelord shield", chance = 250 }, -- Frozen Hell: 0.010%
}

mType:register(monster)





