local mType = Game.createMonsterType("minotaur archer")
local monster = {}

monster.name = "minotaur archer"
monster.description = "a minotaur archer"
monster.experience = 30000
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

monster.health = 320
monster.maxHealth = 320
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
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -10, maxDamage = -48, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BOLT}
}

monster.defenses = {
	defense = 8,
	armor = 7
}

monster.loot = {
	{ name = "gold coin", chance = 85000, maxCount = 20 },
	{ name = "meat", chance = 45000, maxCount = 3 },
	{ name = "health potion", chance = 2000 },
	{ name = "mana potion", chance = 2200 },
	{ name = "minotaur leather", chance = 5000 }, -- material de addon conservado
	{ id = 12413, chance = 3000 }, -- bolsa aleatoria de objetos de addon
	{ name = "plate armor", chance = 450 }, -- equipo muy raro
	{ name = "plate legs", chance = 450 }, -- equipo muy raro
	{ name = "steel helmet", chance = 450 }, -- equipo muy raro
	{ name = "bonelord shield", chance = 450 }, -- equipo muy raro
}

mType:register(monster)





