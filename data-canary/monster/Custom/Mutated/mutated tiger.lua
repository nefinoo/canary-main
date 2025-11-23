local mType = Game.createMonsterType("mutated tiger")
local monster = {}

monster.name = "Infested Tiger"
monster.description = "an infested tiger"
monster.experience = 100000
monster.outfit = {
	lookType = 318,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 60000
monster.maxHealth = 60000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 8999
monster.speed = 320
monster.summonCost = 0

monster.changeTarget = {
	interval = 320,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
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
	{text = "CHHHHHHHHHHH", yell = false},
	{text = "GRAAARRRRRR", yell = false}
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
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 220, attack = 220},
	{name ="combat", interval = 1500, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -1500, maxDamage = -2000, length = 8, spread = 3, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="invisible", interval = 1000, chance = 25, duration = 9000, effect = CONST_ME_MAGIC_BLUE},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 150, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 10},
	{name = "warlord sword", chance = 50},
	{name = "experience scroll", chance = 2000},
	{id = 9743, chance = 2500}
}

mType:register(monster)



