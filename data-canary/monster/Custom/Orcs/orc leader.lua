local mType = Game.createMonsterType("orc leader")
local monster = {}

monster.name = "orc leader"
monster.description = "a orc leader"
monster.experience = 4700
monster.outfit = {
	lookType = 59,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 59
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Orc Fort, Edron Orc Cave, South of the temple in PoH, Maze of Lost Souls, Cyclopolis, Zao Orc Land.",
}

monster.health = 155
monster.maxHealth = 155
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6001
monster.speed = 85
monster.summonCost = 640

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
	{text = "Ulderek futgyr human!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -8, maxDamage = -36 },
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -5, maxDamage = -18, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGKNIFE}
}

monster.defenses = {
	defense = 7,
	armor = 4
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 22 },
	{ name = "health potion", chance = 18000 },
	{ name = "mana potion", chance = 16000 },
	{ name = "fish", chance = 40000, maxCount = 2 },
	{ name = "orc tooth", chance = 1030 },
	{ name = "orc leather", chance = 19510 },
	{ name = "skull belt", chance = 2008 },
}

mType:register(monster)





