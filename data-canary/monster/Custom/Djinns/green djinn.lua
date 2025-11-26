local mType = Game.createMonsterType("green djinn")
local monster = {}

monster.name = "green djinn"
monster.description = "a green djinn"
monster.experience = 215
monster.outfit = {
	lookType = 51,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 330
monster.maxHealth = 330
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6016
monster.speed = 220
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
	{text = "I grant you a deathwish!", yell = false},
	{text = "Muhahahaha!", yell = false},
	{text = "I wish you a merry trip to hell!", yell = false},
	{text = "Good wishes are for fairytales", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -60, maxDamage = -120},
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_FIREDAMAGE, minDamage = -45, maxDamage = -75, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="condition", interval = 2000, chance = 34, type = CONDITION_ENERGY, startDamage = 0, tick = 10000, minDamage = -50, maxDamage = -90, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -55, maxDamage = -105, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH},
	{name ="drunk", interval = 1000, chance = 15, drunkenness = 25, duration = 10000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA},
	{name = "outfit", interval = 1000, chance = 17, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 20000, outfitMonster = "rabbit" },
}

monster.defenses = {
	defense = 10,
	armor = 18
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "royal spear", chance = 2000, maxCount = 2},
	{name = "small emerald", chance = 6666, maxCount = 4},
	{name = "wand of inferno", chance = 1111},
	{name = "cheese", chance = 10000},
	{name = "grave flower", chance = 10000},
	{id = 2853, chance = 100000, child = {
			{name = "small oil lamp", chance = 5000},
			{name = "gold coin", chance = 100000, maxCount = 20},
			{name = "orb", chance = 2000},
			{name = "green piece of cloth", chance = 5000}
		}
	}
}

mType:register(monster)




