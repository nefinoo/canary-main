local mType = Game.createMonsterType("minotaur archer")
local monster = {}

monster.name = "minotaur archer"
monster.description = "a minotaur archer"
monster.experience = 65000
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

monster.health = 100
monster.maxHealth = 100
monster.runHealth = 10
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
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 20, attack = 15},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -45, maxDamage = -85, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BOLT}
}

monster.defenses = {
	defense = 8,
	armor = 7
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 28},
	{name = "bolt", chance = 70000, maxCount = 18},
	{name = "meat", chance = 50000, maxCount = 3},
	{name = "scale armor", chance = 10000},
	{name = "soldier helmet", chance = 6666},
	{name = "minotaur leather", chance = 5000},
	{id = 3349, chance = 6666},
	{name = "piercing bolt", chance = 6000, maxCount = 8},
	{name = "brass armor", chance = 5000},
	{name = "chain armor", chance = 10000},
	{name = "chain legs", chance = 4000},
	{name = "chain helmet", chance = 10000},
	{id = 12413, chance = 3000},
	{id = 3399, chance = 50},
	{id = 8095, chance = 50},
	{id = 3408, chance = 50},
}

mType:register(monster)





