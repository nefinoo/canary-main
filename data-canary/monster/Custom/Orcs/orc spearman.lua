local mType = Game.createMonsterType("orc spearman")
local monster = {}

monster.name = "orc spearman"
monster.description = "a orc spearman"
monster.experience = 130000
monster.outfit = {
	lookType = 50,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 50
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Orc Fortress, Folda Dungeon, Edron Orc Cave and around it, Ancient Temple, \z
		Venore Orc Cave, below the Point of No Return in Outlaw Camp, Plains of Havoc, \z
		North of Thais in the Orc Peninsula, Elvenbane and Orc Camp in Foreigner Quarter. \z
		Also found in Rookgaard West plains, Zao Orc Land.",
}


monster.health = 105
monster.maxHealth = 105
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 5996
monster.speed = 176
monster.summonCost = 310

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
	pushable = true,
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
	{text = "Ugaar!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 19, attack = 17},
	{name ="combat", interval = 1000, chance = 7, type = COMBAT_PHYSICALDAMAGE, minDamage = -16, maxDamage = -40, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR}
}

monster.defenses = {
	defense = 12,
	armor = 6
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 80000, maxCount = 10},
	{name = "meat", chance = 80000, maxCount = 2},
	{name = "machete", chance = 10000},
	{id = 12413, chance = 2000},
}

mType:register(monster)





