local mType = Game.createMonsterType("quara constrictor scout")
local monster = {}

monster.name = "quara constrictor scout"
monster.description = "a quara constrictor scout"
monster.experience = 250
monster.outfit = {
	lookType = 46,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 450
monster.maxHealth = 450
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6065
monster.speed = 290
monster.summonCost = 670

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 65, attack = 55},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -90, radius = 3, target = false, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 15,
	armor = 15
}

monster.loot = {
	{name = "shrimp", chance = 20000, maxCount = 5},
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "small amethyst", chance = 2222, maxCount = 3},
	{name = "longsword", chance = 3333},
	{name = "halberd", chance = 2222},
	{name = "brass helmet", chance = 4000},
	{name = "brass armor", chance = 2857},
	{name = "fish fin", chance = 1800}
}

mType:register(monster)




