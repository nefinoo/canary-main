local mType = Game.createMonsterType("minishabaal")
local monster = {}

monster.name = "minishabaal"
monster.description = "Minishabaal"
monster.experience = 4000000
monster.outfit = {
	lookType = 237,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 35000
monster.maxHealth = 35000
monster.runHealth = 350
monster.race = "blood"
monster.corpse = 6364
monster.speed = 700
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
	targetDistance = 4,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I had Princess Lumelia as breakfast!", yell = false},
	{text = "Naaa-Nana-Naaa-Naaa!", yell = false},
	{text = "My brother will come and get you for this!", yell = false},
	{text = "Get them Fluffy!", yell = false},
	{text = "He He He!", yell = false},
	{text = "Pftt, Ferumbras such an upstart!", yell = false},
	{text = "My dragon is not that old, it's just second hand!", yell = false},
	{text = "My other dragon is a red one!", yell = false},
	{text = "When I am big I want to become the ruthless eighth!", yell = false},
	{text = "WHERE'S FLUFFY?", yell = false},
	{text = "Muahaha!", yell = false}
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
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 70, attack = 95},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -80, maxDamage = -350, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 3000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -120, maxDamage = -500, range = 7, radius = 2, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 155, maxDamage = 255, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 12, speed = {min = 320, max = 320}, duration = 4000, effect = CONST_ME_MAGIC_RED},
	{name ="invisible", interval = 4000, chance = 50, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 3
monster.summons = {
	{name = "Diabolic Imp", chance = 40, interval = 2000, max = 3}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "small amethyst", chance = 1428, maxCount = 2},
	{id = 3451, chance = 2857},
	{name = "fire axe", chance = 666},
	{name = "soul orb", chance = 909},
	{name = "demon shield", chance = 200},
	{name = "demonic essence", chance = 1000, maxCount = 2},
	{name = "golden legs", chance = 180},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 20},
			{name = "soul orb", chance = 909},
			{name = "crown legs", chance = 800},
			{name = "guardian shield", chance = 1333},
			{name = "demonbone amulet", chance = 909},
			{name = "tempest shield", chance = 500}
		}
	}
}

mType:register(monster)





