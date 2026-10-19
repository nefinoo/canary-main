local mType = Game.createMonsterType("wyvern")
local monster = {}

monster.name = "wyvern"
monster.description = "a wyvern"
monster.experience = 515000
monster.outfit = {
	lookType = 239,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 795
monster.maxHealth = 795
monster.runHealth = 300
monster.race = "blood"
monster.corpse = 6302
monster.speed = 315
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
	{text = "Shriiiek", yell = true}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -60, maxDamage = -120, condition = {type = CONDITION_POISON, startDamage = 22, interval = 4000}},
	{name ="combat", interval = 3000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -30, maxDamage = -120, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="melee", interval = 2000, chance = 12, minDamage = -30, maxDamage = -120},
	{name ="drunk", interval = 4000, chance = 2, drunkenness = 25, duration = 10000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_SOUND_RED}
}

monster.defenses = {
	defense = 18,
	armor = 25,
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_HEALING, minDamage = 34, maxDamage = 56, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 67},
	{name = "dragon ham", chance = 20000, maxCount = 3},
	{id = 2842, chance = 3333},
	{name = "power bolt", chance = 1667, maxCount = 3},
	{name = "plate legs", chance = 2000},
	{name = "wyvern fang", chance = 2000},
	{id = 2853, chance = 100000, child = {
			{id = 3063, chance = 1818},
			{name = "wand of inferno", chance = 1111},
			{name = "small sapphire", chance = 1000}
		}
	}
}

mType:register(monster)





