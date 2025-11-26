local mType = Game.createMonsterType("quara hydromancer")
local monster = {}

monster.name = "quara hydromancer"
monster.description = "a quara hydromancer"
monster.experience = 30000
monster.outfit = {
	lookType = 47,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.runHealth = 30
monster.race = "blood"
monster.corpse = 6066
monster.speed = 520
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
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
	{text = "Blubber.", yell = false},
	{text = "Blup.", yell = false},
	{text = "Qua hah tsh!", yell = false},
	{text = "Quara tsha Fach!", yell = false},
	{text = "Teech tsha tshul!", yell = false},
	{text = "Tssssha Quara!", yell = false}
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
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, range = 1, radius = 1, target = true},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HOLYDAMAGE, minDamage = -600, maxDamage = -700, length = 8, spread = 10, effect = CONST_ME_BUBBLES},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -700, maxDamage = -900, range = 7, radius = 3, target = false, effect = CONST_ME_BUBBLES}
}

monster.defenses = {
	defense = 18,
	armor = 15
}

monster.loot = {
	{name = "salmon", chance = 2000},
	{name = "northern pike", chance = 2000},
	{name = "worm", chance = 5000, maxCount = 25},
	{name = "fish fin", chance = 2000},
	{name = "rainbow trout", chance = 2000},
	{name = "green perch", chance = 2000},
	{name = "experience scroll", chance = 3000},
	{id = 893, chance = 5}
}

mType:register(monster)




