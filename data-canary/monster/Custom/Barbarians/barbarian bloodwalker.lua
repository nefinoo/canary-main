local mType = Game.createMonsterType("Barbarian Bloodwalker")
local monster = {}

monster.name = "Barbarian Bloodwalker"
monster.description = "a barbarian bloodwalker"
monster.experience = 195000
monster.outfit = {
	lookType = 255,
	lookHead = 114,
	lookBody = 132,
	lookLegs = 132,
	lookFeet = 132,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 305
monster.maxHealth = 305
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 205
monster.summonCost = 590

monster.changeTarget = {
	interval = 2000,
	chance = 5
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
	canPushCreatures = false,
	staticAttackChance = 80,
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
	interval = 2000,
	chance = 20,
	{text = "YAAAHEEE!", yell = false},
	{text = "SLAUGHTER!", yell = false},
	{text = "CARNAGE!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 4},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -13},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -7}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -60, maxDamage = -170}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="speed", interval = 1000, chance = 12, speed = {min = 260, max = 260}, duration = 40000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 71},
	{name = "ham", chance = 33000},
	{name = "halberd", chance = 2777},
	{name = "battle axe", chance = 2888},
	{id = 2853, chance = 100000, child = {
			{name = "chain helmet", chance = 7999},
			{id = 2920, chance = 11111},
			{name = "chain armor", chance = 4444},
			{name = "fur boots", chance = 1222},
			{name = "red piece of cloth", chance = 4555},
			{name = "shard", chance = 3222},
			{name = "beastslayer axe", chance = 1688}
		}
	}
}

mType:register(monster)





