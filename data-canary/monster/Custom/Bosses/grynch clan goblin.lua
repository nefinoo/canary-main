local mType = Game.createMonsterType("grynch clan goblin")
local monster = {}

monster.name = "Grynch Clan Goblin"
monster.description = "a Grynch Clan Goblin"
monster.experience = 4
monster.outfit = {
	lookType = 61,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 80
monster.maxHealth = 80
monster.runHealth = 80
monster.race = "blood"
monster.corpse = 6002
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = false,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 0,
	targetDistance = 11,
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
	{text = "T'was not me hand in your pocket!", yell = false},
	{text = "Look! Cool stuff in house. Let's get it!", yell = false},
	{text = "Uhh! Nobody home!", yell = false},
	{text = "Me just borrowed it!", yell = false},
	{text = "Me no steal! Me found it!", yell = false},
	{text = "Me had it for five minutes. It's family heirloom now!", yell = false},
	{text = "Nice human won't hurt little, good goblin?", yell = false},
	{text = "Gimmegimme!", yell = false},
	{text = "Invite me in you lovely house plx!", yell = false},
	{text = "Other Goblin stole it!", yell = false},
	{text = "All presents mine!", yell = false},
	{text = "Me got ugly ones purse", yell = false},
	{text = "Free itans plz!", yell = false},
	{text = "Not me! Not me!", yell = false},
	{text = "Guys, help me here! Guys? Guys???", yell = false},
	{text = "That only much dust in me pocket! Honest!", yell = false},
	{text = "Can me have your stuff?", yell = false},
	{text = "Halp, Big dumb one is after me!", yell = false},
	{text = "Uh, So many shiny things!", yell = false},
	{text = "Utani hur hur hur!", yell = false},
	{text = "Mee? Stealing? Never!!!", yell = false},
	{text = "Oh what fun it is to steal a one-horse open sleigh!", yell = false},
	{text = "Must have it! Must have it!", yell = false},
	{text = "Where me put me lockpick?", yell = false},
	{text = "Catch me if you can!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
}

monster.defenses = {
	defense = 12,
	armor = 10,
	{name ="speed", interval = 1000, chance = 15, speed = {min = 500, max = 500}, duration = 5000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 16},
	{name = "banana", chance = 1050, maxCount = 100},
	{id = 6500, chance = 13256, maxCount = 2},
	{name = "orange", chance = 13256, maxCount = 3},
	{name = "cookie", chance = 13256, maxCount = 5},
	{name = "cherry", chance = 13256, maxCount = 4},
	{name = "red apple", chance = 13256, maxCount = 3},
	{name = "coconut", chance = 1050, maxCount = 19},
	{id = 2853, chance = 100000, child = {
			{id = 3606, chance = 20000, maxCount = 2},
			{name = "candy cane", chance = 20000, maxCount = 3},
			{name = "cream cake", chance = 20000},
			{name = "valentine's cake", chance = 20000},
			{id = 2992, chance = 20000, maxCount = 5},
			{id = 2856, chance = 100000},
			{name = "lump of cake dough", chance = 20000}
		}
	},
	{name = "backpack", chance = 100000, child = {
			{name = "blank rune", chance = 10000},
			{id = 3046, chance = 20000},
			{name = "bottle", chance = 20000},
			{id = 1852, chance = 10000},
			{name = "bronze amulet", chance = 10000},
			{id = 2815, chance = 10000},
			{name = "scarf", chance = 10000},
			{name = "chicken feather", chance = 20000, maxCount = 5},
			{name = "bat wing", chance = 20000, maxCount = 3},
			{name = "honeycomb", chance = 10000},
			{id = 6091, chance = 10000},
			{name = "broom", chance = 10000},
			{name = "piggy bank", chance = 500},
			{id = 5792, chance = 10000},
			{id = 3463, chance = 10000},
			{id = 2392, chance = 10000},
			{id = 3005, chance = 10000},
			{id = 2983, chance = 10000},
			{name = "scarab coin", chance = 1000},
			{id = 2853, chance = 100000, child = {
					{name = "dwarven beard", chance = 10000},
					{name = "orichalcum pearl", chance = 10000},
					{name = "crystal coin", chance = 100},
					{name = "vampire shield", chance = 500}
				}
			}
		}
	}
}

mType:register(monster)



