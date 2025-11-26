local mType = Game.createMonsterType("troll champion")
local monster = {}

monster.name = "troll champion"
monster.description = "a troll champion"
monster.experience = 30
monster.outfit = {
	lookType = 281,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75
monster.maxHealth = 75
monster.runHealth = 20
monster.race = "blood"
monster.corpse = 7926
monster.speed = 120
monster.summonCost = 340

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
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
	{text = "Meee maity!", yell = false},
	{text = "Grrrr", yell = false},
	{text = "Whaaaz up!?", yell = false},
	{text = "Gruntz!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, skill = 28, attack = 14}
}

monster.defenses = {
	defense = 8,
	armor = 6
}

monster.loot = {
	{name = "gold coin", chance = 6000, maxCount = 12},
	{name = "hand axe", chance = 1800},
	{name = "leather boots", chance = 1000},
	{name = "leather helmet", chance = 1000},
	{name = "meat", chance = 1500},
	{id = 3003, chance = 8000},
	{name = "spear", chance = 2000},
	{name = "studded club", chance = 5000},
	{name = "wooden shield", chance = 1500}
}

mType:register(monster)




