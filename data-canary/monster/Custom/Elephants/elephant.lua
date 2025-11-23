local mType = Game.createMonsterType("elephant")
local monster = {}

monster.name = "elephant"
monster.description = "a elephant"
monster.experience = 160
monster.outfit = {
	lookType = 211,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 320
monster.maxHealth = 320
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6052
monster.speed = 240
monster.summonCost = 500

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
	{text = "Hooooot-Toooooot!", yell = false},
	{text = "Tooooot.", yell = false},
	{text = "Troooooot!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 45, attack = 41}
}

monster.defenses = {
	defense = 16,
	armor = 20
}

monster.loot = {
	{name = "tusk shield", chance = 80},
	{id = 3044, chance = 40000, maxCount = 3},
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 25},
	{name = "ham", chance = 33333, maxCount = 10},
	{name = "meat", chance = 33333, maxCount = 15},
	{name = "corncob", chance = 10000, maxCount = 10}
}

mType:register(monster)



