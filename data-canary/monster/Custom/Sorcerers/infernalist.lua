local mType = Game.createMonsterType("Infernalist")
local monster = {}

monster.name = "Infernalist"
monster.description = "an infernalist"
monster.experience = 400000
monster.outfit = {
	lookType = 130,
	lookHead = 78,
	lookBody = 76,
	lookLegs = 94,
	lookFeet = 115,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 250000
monster.maxHealth = 250000
monster.runHealth = 1150
monster.race = "blood"
monster.corpse = 6080
monster.speed = 260
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 8
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
	staticAttackChance = 95,
	targetDistance = 3,
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
	{text = "Feel the heat of battle!", yell = false},
	{text = "It's cooking time!", yell = false},
	{text = "Nothing will remain but your scorched bones!", yell = false},
	{text = "Some like it hot!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
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
	{name ="melee", interval = 2000, chance = 100, skill = 50, attack = 50},
	{name ="combat", interval = 1000, chance = 85, type = COMBAT_FIREDAMAGE, minDamage = -1600, maxDamage = -2500, range = 3, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -500, maxDamage = -750, range = 3, radius = 3, target = true, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_TELEPORT},
	{name ="firefield", interval = 1000, chance = 20, range = 3, radius = 3, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -1500, maxDamage = -1700, length = 8, spread = 0, effect = CONST_ME_FIREATTACK}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 2130, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "helmet of ultimate terror", chance = 500},
	{name = "orange backpack", chance = 100},
	{name = "crystal coin", chance = 10000, maxCount = 10},
	{name = "experience scroll", chance = 3000},
	{name = "experience scroll", chance = 3000}
}

mType:register(monster)




