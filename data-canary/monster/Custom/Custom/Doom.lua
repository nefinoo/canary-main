local mType = Game.createMonsterType("Doom")
local monster = {}

monster.name = "Doom"
monster.description = "doom"
monster.experience = 25000000
monster.outfit = {
	lookType = 319,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6500000
monster.maxHealth = 6500000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6132
monster.speed = 500
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 100
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
	interval = 2000,
	chance = 100,
	{text = "gaaagaaa", yell = true},
	{text = "gaaagaaa", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -1000, maxDamage = -4500},
	{name ="combat", interval = 1000, chance = 60, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -3000, radius = 4, target = false, effect = CONST_ME_STONES},
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_HOLYDAMAGE, minDamage = -500, maxDamage = -1000, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYAREA}
}

monster.defenses = {
	defense = 50,
	armor = 60,
	{name ="invisible", interval = 2000, chance = 50, duration = 30000, effect = CONST_ME_YALAHARIGHOST}
}

monster.loot = {
}

mType:register(monster)



