local mType = Game.createMonsterType("defiler")
local monster = {}

monster.name = "defiler"
monster.description = "a defiler"
monster.experience = 2500
monster.outfit = {
	lookType = 238,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3650
monster.maxHealth = 3650
monster.runHealth = 0
monster.race = "venom"
monster.corpse = 6532
monster.speed = 260
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
	{text = "Blubb", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 40},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -50, maxDamage = -260},
	{name ="speed", interval = 1000, chance = 12, speed = {min = -400, max = -400}, duration = 10000, radius = 6, target = false, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -450, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 75, maxDamage = 225, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "platinum coin", chance = 10000, maxCount = 3},
	{name = "demonic essence", chance = 2857},
	{name = "soul orb", chance = 2500}
}

mType:register(monster)



