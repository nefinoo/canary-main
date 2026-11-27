local mType = Game.createMonsterType("big boss trolliver")
local monster = {}

monster.name = "big boss trolliver"
monster.description = "big boss trolliver"
monster.experience = 105000
monster.outfit = {
	lookType = 281,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150
monster.maxHealth = 150
monster.runHealth = 20
monster.race = "blood"
monster.corpse = 7926
monster.speed = 140
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
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
	canPushItems = false,
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
	{type = COMBAT_ENERGYDAMAGE, percent = 22},
	{type = COMBAT_EARTHDAMAGE, percent = -3},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 11},
	{type = COMBAT_DEATHDAMAGE , percent = -4}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 35, attack = 40}
}

monster.defenses = {
	defense = 12,
	armor = 10
}

monster.loot = {
	{name = "gold coin", chance = 6000, maxCount = 57},
	{name = "meat", chance = 1500, maxCount = 3},
	{name = "spear", chance = 2000, maxCount = 2},
	{name = "studded club", chance = 5000}
}

mType:register(monster)





