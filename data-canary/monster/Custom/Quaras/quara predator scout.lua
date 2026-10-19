local mType = Game.createMonsterType("quara predator scout")
local monster = {}

monster.name = "quara predator scout"
monster.description = "a quara predator scout"
monster.experience = 400000
monster.outfit = {
	lookType = 20,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 890
monster.maxHealth = 890
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6067
monster.speed = 290
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
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
	{text = "Gnarrr!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -25},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 100, attack = 95}
}

monster.defenses = {
	defense = 29,
	armor = 20,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 113, maxDamage = 180, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "shrimp", chance = 20000, maxCount = 5},
	{name = "fish fin", chance = 2000},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "double axe", chance = 2000},
	{id = 2853, chance = 100000, child = {
			{name = "viking helmet", chance = 3333},
			{name = "small diamond", chance = 1429},
			{name = "scale armor", chance = 4000}
		}
	}
}

mType:register(monster)





