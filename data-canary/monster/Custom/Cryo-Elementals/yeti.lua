local mType = Game.createMonsterType("Yeti")
local monster = {}

monster.name = "Yeti"
monster.description = "a yeti"
monster.experience = 460000
monster.outfit = {
	lookType = 110,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 950
monster.maxHealth = 950
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6038
monster.speed = 270
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
	{text = "Yooodelaaahooohooo!", yell = false},
	{text = "Yooodelaaaheeeheee!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = -20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 80, attack = 60},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -190, maxDamage = -140, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_POFF},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = -120, maxDamage = -175, length = 3, spread = 3, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 33,
	armor = 28
}

monster.loot = {
	{name = "ham", chance = 10000, maxCount = 3},
	{name = "gold coin", chance = 100000, maxCount = 70},
	{name = "meat", chance = 33333, maxCount = 5},
	{id = 2992, chance = 10000, maxCount = 5},
	{name = "obsidian lance", chance = 1333},
	{id = 3158, chance = 600},
	{name = "stone skin amulet", chance = 700},
	{name = "halberd", chance = 6666},
	{name = "life crystal", chance = 2500},
	{id = 2914, chance = 10000},
	{name = "studded club", chance = 10000},
	{name = "candy cane", chance = 2500, maxCount = 4}
}

mType:register(monster)





