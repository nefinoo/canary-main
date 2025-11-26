local mType = Game.createMonsterType("Barbarian Brutetamer")
local monster = {}

monster.name = "Barbarian Brutetamer"
monster.description = "a Brutetamer"
monster.experience = 115
monster.outfit = {
	lookType = 264,
	lookHead = 78,
	lookBody = 116,
	lookLegs = 95,
	lookFeet = 121,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 145
monster.maxHealth = 145
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6081
monster.speed = 270
monster.summonCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
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
	targetDistance = 4,
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
	chance = 5,
	{text = "To me, creatures of the wild!", yell = false},
	{text = "My instincts tell me about your cowardice.", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -13},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -7}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -30, maxDamage = -70},
	{name ="combat", interval = 2000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -30, maxDamage = -80, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SNOWBALL},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -35, maxDamage = -70, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 10,
	armor = 10,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 3
monster.summons = {
	{name = "War Wolf", chance = 40, interval = 2000, max = 3}
}

monster.loot = {
	{name = "gold coin", chance = 33333, maxCount = 14},
	{name = "corncob", chance = 10000, maxCount = 2},
	{name = "chain armor", chance = 3333},
	{id = 3289, chance = 10000},
	{name = "ham", chance = 2500, maxCount = 3},
	{name = "fur bag", chance = 3333},
	{name = "mammoth fur cape", chance = 1033},
	{name = "hunting spear", chance = 533},
	{name = "fur boots", chance = 733},
	{name = "brutetamer's staff", chance = 633},
	{name = "mammoth fur shorts", chance = 200}
}

mType:register(monster)




