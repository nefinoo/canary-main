local mType = Game.createMonsterType("bog raider")
local monster = {}

monster.name = "Bog Raider"
monster.description = "a bog raider"
monster.experience = 1300
monster.outfit = {
	lookType = 299,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 800
monster.maxHealth = 800
monster.runHealth = 1
monster.race = "venom"
monster.corpse = 8123
monster.speed = 300
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
	staticAttackChance = 15,
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
	interval = 2000,
	chance = 5,
	{text = "Tchhh!", yell = false},
	{text = "Slurp!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = -25},
	{type = COMBAT_FIREDAMAGE, percent = -80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -20, maxDamage = -145, condition = {type = CONDITION_POISON, startDamage = 40, interval = 4000}, target = true},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -90, maxDamage = -140, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -175, radius = 2, target = false, shootEffect = CONST_ANI_SMALLEARTH, effect = false},
	{name ="paralyze", interval = 3000, chance = 40, effect = CONST_ME_MAGIC_RED, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 10,
	{name ="speed", interval = 10000, chance = 40, speed = {min = 310, max = 310}, duration = 20000, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="combat", interval = 5000, chance = 60, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 121},
	{name = "plate legs", chance = 5000},
	{name = "belted cape", chance = 2000},
	{name = "springsprout rod", chance = 5000},
	{name = "great spirit potion", chance = 5000},
	{name = "ultimate health potion", chance = 3000},
	{name = "hibiscus dress", chance = 2500},
	{name = "paladin armor", chance = 2800}
}

mType:register(monster)



