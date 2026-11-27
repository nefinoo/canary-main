local mType = Game.createMonsterType("Werewolf")
local monster = {}

monster.name = "Werewolf"
monster.description = "a werewolf"
monster.experience = 1450000
monster.outfit = {
	lookType = 308,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1955
monster.maxHealth = 1955
monster.runHealth = 100
monster.race = "blood"
monster.corpse = 6080
monster.speed = 320
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
	{text = "BLOOD!", yell = true},
	{text = "HRAAAAAAAAAARRRRRR!", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -350},
	{name = "outfit", interval = 1000, chance = 9, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000, outfitMonster = "werewolf" },
}

monster.defenses = {
	defense = 55,
	armor = 50
}

monster.maxSummons = 6
monster.summons = {
	{name = "war wolf", chance = 25, interval = 2500, max = 6}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 96, description2 = "gps"},
	{name = "gold coin", chance = 100000, maxCount = 74, description2 = "gps"},
	{name = "wolf paw", chance = 5000, description2 = "wolf paw"},
	{name = "troll green", chance = 4000, description2 = "troll green"},
	{name = "plate legs", chance = 3000, description2 = "plate legs"},
	{name = "ultimate health potion", chance = 2000, description2 = "uhp"},
	{name = "great health potion", chance = 2000, description2 = "ghp"},
	{name = "strong health potion", chance = 2000, description2 = "shp"},
	{id = 2853, chance = 100000, description2 = "Bag", child = {
			{id = 9808, chance = 3000, description2 = "rusty armor"},
			{name = "berserk potion", chance = 2000, description2 = "berserk potion"},
			{name = "relic sword", chance = 1800, description2 = "relic sword"}
		}
	}
}

mType:register(monster)





