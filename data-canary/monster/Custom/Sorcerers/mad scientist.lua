local mType = Game.createMonsterType("mad scientist")
local monster = {}

monster.name = "Mad Scientist"
monster.description = "a mad scientist"
monster.experience = 205
monster.outfit = {
	lookType = 133,
	lookHead = 97,
	lookBody = 0,
	lookLegs = 38,
	lookFeet = 97,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 325
monster.maxHealth = 325
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 220
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
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
	interval = 3000,
	chance = 10,
	{text = "Die in the name of Science!", yell = false},
	{text = "You will regret interrupting my studies!", yell = false},
	{text = "Let me test this!", yell = false},
	{text = "I will study your corpse!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -35},
	{name ="combat", interval = 1000, chance = 35, type = COMBAT_LIFEDRAIN, minDamage = -20, maxDamage = -60, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_POFF},
	{name ="energy strike", interval = 2000, chance = 25, minDamage = 0, maxDamage = -30},
	{name ="speed", interval = 3000, chance = 10, speed = {min = -300, max = -300}, duration = 2000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 20,
	armor = 15,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 10, maxDamage = 30, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 70, description2 = "gps"},
	{name = "gold coin", chance = 100000, maxCount = 50, description2 = "gps"},
	{name = "white mushroom", chance = 900, maxCount = 3, description2 = "white mushroom"},
	{name = "soulfire rune", chance = 1500, description2 = "powder herb"},
	{name = "mana potion", chance = 13500, description2 = "mp"},
	{name = "health potion", chance = 12500, description2 = "hp"},
	{name = "cookie", chance = 900, maxCount = 3, description2 = "cookie"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{name = "small enchanted amethyst", chance = 700, description2 = "small enchanted amethyst"},
			{name = "life crystal", chance = 800, description2 = "life crystal"},
			{id = 7893, chance = 800, description2 = "cream cake"},
			{id = 3046, chance = 800, description2 = "magic lightwand"},
			{name = "boots of haste", chance = 200, description2 = "boh"}
		}
	}
}

mType:register(monster)



