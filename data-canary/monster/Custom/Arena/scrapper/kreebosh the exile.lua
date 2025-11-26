local mType = Game.createMonsterType("Kreebosh the Exile")
local monster = {}

monster.name = "Kreebosh the Exile"
monster.description = "kreebosh the exile"
monster.experience = 350
monster.outfit = {
	lookType = 103,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 880
monster.maxHealth = 880
monster.runHealth = 50
monster.race = "blood"
monster.corpse = 7349
monster.speed = 270
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
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
	canPushCreatures = false,
	staticAttackChance = 78,
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
	chance = 5,
	{text = "I bet you wish you weren't here.", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 55},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -11}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1, maxDamage = -100},
	{name ="combat", interval = 6000, chance = 80, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -120, radius = 3, target = false, effect = CONST_ME_ENERGYHIT},
	{name ="speed", interval = 3500, chance = 35, speed = {min = 0, max = 0}, duration = 20000, range = 5, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 6000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -20, maxDamage = -100, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 5000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -40, maxDamage = -200, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_FIREAREA},
	{name ="drunk", interval = 1000, chance = 20, drunkenness = 25, duration = 30000, range = 5, radius = 1, target = true},
	{name = "outfit", interval = 2000, chance = 50, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 60000, outfitMonster = "rat" },
}

monster.defenses = {
	defense = 40,
	armor = 30
}

monster.maxSummons = 2
monster.summons = {
	{name = "Green Djinn", chance = 20, interval = 5000, max = 2}
}

monster.loot = {
}

mType:register(monster)




