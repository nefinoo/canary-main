local mType = Game.createMonsterType("ron the ripper")
local monster = {}

monster.name = "Ron the Ripper"
monster.description = "Ron the Ripper"
monster.experience = 500
monster.outfit = {
	lookType = 151,
	lookHead = 95,
	lookBody = 94,
	lookLegs = 117,
	lookFeet = 97,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 1500
monster.maxHealth = 1500
monster.runHealth = 250
monster.race = "blood"
monster.corpse = 6080
monster.speed = 240
monster.summonCost = 0

monster.changeTarget = {
	interval = 60000,
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
	staticAttackChance = 50,
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -250}
}

monster.defenses = {
	defense = 50,
	armor = 35
}

monster.loot = {
	{name = "ron the ripper's sabre", chance = 100000},
	{name = "gold coin", chance = 100000, maxCount = 50},
	{name = "knight armor", chance = 1200},
	{name = "double axe", chance = 1500},
	{name = "plate armor", chance = 4000},
	{name = "dagger", chance = 8500},
	{id = 3114, chance = 100000, maxCount = 2}
}

mType:register(monster)



