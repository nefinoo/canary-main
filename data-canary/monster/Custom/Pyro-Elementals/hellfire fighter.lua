local mType = Game.createMonsterType("hellfire fighter")
local monster = {}

monster.name = "hellfire fighter"
monster.description = "a hellfire fighter"
monster.experience = 110000
monster.outfit = {
	lookType = 243,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 295
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Pits of Inferno, Demon Forge, Fury Dungeon.",
}


monster.health = 2050
monster.maxHealth = 2050
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6324
monster.speed = 260
monster.summonCost = 0

monster.changeTarget = {
	interval = 30,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
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
	canWalkOnFire = true,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -38, maxDamage = -112},
	{name ="firefield", interval = 3000, chance = 15, range = 7, radius = 4, target = false, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 22, type = COMBAT_FIREDAMAGE, minDamage = -30, maxDamage = -105, range = 5, radius = 1, target = true, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="melee", interval = 2000, chance = 15, minDamage = -25, maxDamage = -90}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.loot = {
	-- Materiales originales de addons y crafting recuperados
	{ name = "burnt scroll", chance = 5000 },
	-- Oro y consumibles nivel 69
	{ name = "gold coin", chance = 90000, maxCount = 95 },
	{ name = "ham", chance = 40000, maxCount = 3 },
	{ name = "health potion", chance = 10000 },
	{ name = "mana potion", chance = 11000 },
	{ name = "strong health potion", chance = 4500 },
	{ name = "strong mana potion", chance = 5000 },
	-- Materiales de addon originales
	{ name = "soul orb", chance = 2222 },
	{ id = 12413, chance = 14500 },
	-- Plate Set: progresion mejorada
	{ name = "plate armor", chance = 9000 },
	{ name = "plate legs", chance = 8800 },
	{ name = "steel helmet", chance = 9200 },
	{ name = "bonelord shield", chance = 8800 },
	-- Knight Set
	{ name = "knight armor", chance = 4300 },
	{ name = "knight legs", chance = 3800 },
	{ name = "knight axe", chance = 3200 },
	{ name = "devil helmet", chance = 3000 },
	{ name = "tower shield", chance = 2800 },
	-- Crown Set: muy raro
	{ name = "crown armor", chance = 380 },
	{ name = "crown legs", chance = 380 },
	{ name = "crown helmet", chance = 460 },
	{ name = "crown shield", chance = 340 },
	-- Fire Sword / Fire Axe / Dragonbone Staff: armas raras
	{ name = "fire sword", chance = 1500 },
	{ name = "fire axe", chance = 1600 },
	{ name = "dragonbone staff", chance = 1500 },
}

mType:register(monster)





