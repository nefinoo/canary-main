local mType = Game.createMonsterType("fright")
local monster = {}

monster.name = "fright"
monster.description = "a fright"
monster.experience = 2500000
monster.outfit = {
	lookType = 245,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1200000
monster.maxHealth = 1200000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6340
monster.speed = 340
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
	{text = "Close your eyes... I want to show you something!", yell = false},
	{text = "I will haunt you forever!", yell = false},
	{text = "I will make you scream!", yell = false},
	{text = "Pffffrrrrrrrrrrrr.", yell = false},
	{text = "Take a ride with me.", yell = false},
	{text = "Weeeheeheeeheee!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = 5000, maxDamage = -10000},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -13000, maxDamage = -17000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_ENERGYHIT},
	{name ="melee", interval = 2000, chance = 28, minDamage = -5500, maxDamage = -9000}
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 15500, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 40, speed = {min = 360, max = 360}, duration = 80000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 10},
	{name = "platinum coin", chance = 33333, maxCount = 3},
	{name = "meat", chance = 20000, maxCount = 3, description2 = "meat"},
	{name = "ham", chance = 50000, maxCount = 2, description2 = "ham"},
	{id = 3115, chance = 12500, description2 = "bone"},
	{name = "chaos mace", chance = 3500, description2 = "chaos mace"},
	{name = "ancient shield", chance = 4000, description2 = "ancient shield"},
	{name = "demonic essence", chance = 2500, description2 = "demonic essence"},
	{name = "double axe", chance = 3333, description2 = "double axe"},
	{name = "dreaded cleaver", chance = 1100, description2 = "dreaded cleaver"},
	{name = "soul orb", chance = 1818, description2 = "soul orb"},
	{name = "steel helmet", chance = 2857, description2 = "steel helmet"},
	{name = "knight legs", chance = 3333, description2 = "knight legs"},
	{name = "boots of haste", chance = 1800, description2 = "boots of haste"},
	{name = "skeleton decoration", chance = 1333, description2 = "skeleton decoration"},
	{name = "pirate voodoo doll", chance = 667, description2 = "pirate voodoo doll"},
}

mType:register(monster)




