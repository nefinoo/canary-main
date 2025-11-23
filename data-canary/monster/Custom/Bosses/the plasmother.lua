local mType = Game.createMonsterType("the plasmother")
local monster = {}

monster.name = "The Plasmother"
monster.description = "the plasmother"
monster.experience = 8900
monster.outfit = {
	lookType = 238,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 16050
monster.maxHealth = 16050
monster.runHealth = 0
monster.race = "venom"
monster.corpse = 6532
monster.speed = 310
monster.summonCost = 0

monster.changeTarget = {
	interval = 5500,
	chance = 10
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
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 30, attack = 50},
	{name ="speed", interval = 1000, chance = 8, speed = {min = -800, max = -800}, duration = 10000, radius = 6, target = false, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -350, radius = 4, target = false, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -530, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_HEALING, minDamage = 505, maxDamage = 605, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 20000, maxCount = 70, description2 = "gold coins"},
	{name = "gold coin", chance = 20000, maxCount = 60, description2 = "gold coins"},
	{name = "gold coin", chance = 20000, maxCount = 45, description2 = "gold coins"},
	{name = "platinum coin", chance = 25000, maxCount = 13, description2 = "platinum coin"},
	{name = "demonic essence", chance = 45000, description2 = "demonic essence"},
	{name = "black pearl", chance = 5000, maxCount = 3, description2 = "black pearl"},
	{name = "small sapphire", chance = 5000, maxCount = 3, description2 = "small sapphire"},
	{name = "soul orb", chance = 35000, description2 = "soul orb"},
	{id = 6535, chance = 100000, description2 = "the plasmother's remains"}
}

mType:register(monster)



