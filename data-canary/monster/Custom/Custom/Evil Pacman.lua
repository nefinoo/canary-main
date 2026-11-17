local mType = Game.createMonsterType("Evil Pacman")
local monster = {}

monster.name = "Evil Pacman"
monster.description = "Evil Pacman"
monster.experience = 18000
monster.outfit = {
	lookType = 292,
	lookHead = 79,
	lookBody = 79,
	lookLegs = 79,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 29
monster.maxHealth = 29
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5990
monster.speed = 240
monster.summonCost = 250

monster.changeTarget = {
	interval = 2000,
	chance = 30
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 23, attack = 9}
}

monster.defenses = {
	defense = 3,
	armor = 2
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 4},
	{name = "cherry", chance = 50000, maxCount = 3},
	{name = "worm", chance = 50000, maxCount = 10}
}

mType:register(monster)





