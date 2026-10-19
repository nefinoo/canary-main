local mType = Game.createMonsterType("warlock")
local monster = {}

monster.name = "warlock"
monster.description = "a warlock"
monster.experience = 2500000
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


monster.health = 1935
monster.maxHealth = 1935
monster.runHealth = 800
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -287, maxDamage = -374},
	{name ="combat", interval = 1000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -287, maxDamage = -374, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_MANADRAIN, minDamage = -287, maxDamage = -374, range = 7, radius = 1, target = true},
	{name ="speed", interval = 1000, chance = 12, speed = {min = -600, max = -600}, duration = 40000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 45, type = COMBAT_FIREDAMAGE, minDamage = -287, maxDamage = -374, range = 7, radius = 3, target = true, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 20, range = 7, radius = 2, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -287, maxDamage = -374, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT},
	{name ="speed", interval = 6000, chance = 10, speed = {min = -600, max = -600}, duration = 20000, range = 5, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 30,
	armor = 25,
	{name ="combat", interval = 4000, chance = 35, type = COMBAT_HEALING, minDamage = 150, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 5000, chance = 50, duration = 5000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 1
monster.summons = {
	{name = "stone golem", chance = 10, interval = 1000, max = 1}
}

monster.loot = {
	{name = "ring of the sky", chance = 150},
	{name = "gold coin", chance = 80000, maxCount = 50},
	{name = "skull staff", chance = 1428},
	{name = "golden armor", chance = 588},
	{name = "cherry", chance = 20000, maxCount = 4},
	{name = "dark mushroom", chance = 6666, maxCount = 5},
	{name = "piggy bank", chance = 1400},
	{id = 3007, chance = 1000},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "talon", chance = 1100, maxCount = 2},
	{id = 12413, chance = 4000},
	{id = 3399, chance = 100},
	{id = 8095, chance = 100},
	{id = 3408, chance = 100},
}

mType:register(monster)





