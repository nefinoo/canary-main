local mType = Game.createMonsterType("warlock")
local monster = {}

monster.name = "warlock"
monster.description = "a warlock"
monster.experience = 80000
monster.outfit = {
	lookType = 130,
	lookHead = 19,
	lookBody = 71,
	lookLegs = 128,
	lookFeet = 128,
	lookAddons = 1,
	lookMount = 0
}

monster.raceId = 10
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Demona, Ghostland (Banshee Quest area), Temple of Xayepocax, Oasis Tomb, Kharos, Magician Quarter, \z
		beneath Fenrock, The Arcanum.",
}


monster.health = 1080
monster.maxHealth = 1080
monster.runHealth = 180
monster.race = "blood"
monster.corpse = 6080
monster.speed = 220
monster.summonCost = 0

monster.changeTarget = {
	interval = 20,
	chance = 30
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
	{text = "Even a rat is a better mage than you.", yell = false},
	{text = "Learn the secret of our magic! YOUR death!", yell = false},
	{text = "We don't like intruders!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -20},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -50},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -20, maxDamage = -62},
	{name ="combat", interval = 1000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -18, maxDamage = -72, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -8, maxDamage = -38, range = 7, radius = 1, target = true},
	{name ="speed", interval = 1000, chance = 7, speed = {min = -250, max = -250}, duration = 7000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -25, maxDamage = -75, range = 7, radius = 3, target = true, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 8, range = 7, radius = 2, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_ENERGYDAMAGE, minDamage = -25, maxDamage = -80, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT},
	{name ="speed", interval = 6000, chance = 5, speed = {min = -250, max = -250}, duration = 7000, range = 5, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 30,
	armor = 25,
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_HEALING, minDamage = 20, maxDamage = 45, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 5000, chance = 7, duration = 3000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 1
monster.summons = {
	{name = "stone golem", chance = 6, interval = 3000, max = 1}
}

monster.loot = {
	-- Oro, comida y pociones de caceria (nivel 50)
	{ name = "gold coin", chance = 90000, maxCount = 85 },
	{ name = "cherry", chance = 35000, maxCount = 3 },
	{ name = "dark mushroom", chance = 18000, maxCount = 2 },
	{ name = "health potion", chance = 8000 },
	{ name = "mana potion", chance = 12000 },
	{ name = "strong health potion", chance = 2800 },
	{ name = "strong mana potion", chance = 3500 },
	-- Materiales originales de criatura y bag de addon
	{ name = "talon", chance = 1100 },
	{ id = 12413, chance = 11500 },
	-- Plate Set: frecuente comparado con Knight y Crown
	{ name = "plate armor", chance = 7000 },
	{ name = "plate legs", chance = 6800 },
	{ name = "steel helmet", chance = 7400 },
	{ name = "bonelord shield", chance = 6800 },
	-- Armas de la etapa
	{ name = "barbarian axe", chance = 6500 },
	{ name = "clerical mace", chance = 6000 },
	{ name = "crimson sword", chance = 6000 },
	-- Knight Set: raro
	{ name = "knight armor", chance = 3200 },
	{ name = "knight legs", chance = 2800 },
	{ name = "knight axe", chance = 2300 },
	{ name = "devil helmet", chance = 1900 },
	{ name = "tower shield", chance = 1600 },
	-- Crown Set: muy raro
	{ name = "crown armor", chance = 190 },
	{ name = "crown legs", chance = 180 },
	{ name = "crown helmet", chance = 240 },
	{ name = "crown shield", chance = 180 },
}

mType:register(monster)





