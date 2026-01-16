local mType = Game.createMonsterType("spectre")
local monster = {}

monster.name = "spectre"
monster.description = "a spectre"
monster.experience = 8250000
monster.outfit = {
	lookType = 235,
	lookHead = 20,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1250000
monster.maxHealth = 1250000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6348
monster.speed = 250
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
	{text = "Revenge ... is so ... sweet!", yell = false},
	{text = "Life...force! Feed me your... lifeforce!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -18749, maxDamage = -31729},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -31729, maxDamage = -41248, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_SOUND_RED},
	{name ="poisonfield", interval = 1000, chance = 17, range = 7, radius = 3, target = true, shootEffect = CONST_ANI_POISON},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -31729, maxDamage = -41248, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 15000, maxDamage = 25000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "platinum coin", chance = 33333, maxCount = 3},
	{name = "blank rune", chance = 6667},
	{name = "blank rune", chance = 3333},
	{name = "white piece of cloth", chance = 2222},
	{name = "silver brooch", chance = 2857},
	{name = "sandals", chance = 5000},
	{id = 3260, chance = 1818},
	{id = 2853, chance = 100000, child = {
			{name = "wand of cosmic energy", chance = 1333},
			{name = "demonic essence", chance = 2857},
			{name = "soul orb", chance = 1429},
			{id = 6299, chance = 1000},
			{name = "demonbone amulet", chance = 909}
		}
	}
}

mType:register(monster)




