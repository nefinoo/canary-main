local mType = Game.createMonsterType("outlawed sorcerer")
local monster = {}

monster.name = "outlawed sorcerer"
monster.description = "an outlawed sorcerer"
monster.experience = 5500
monster.outfit = {
	lookType = 66,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4500
monster.maxHealth = 4500
monster.runHealth = 150
monster.race = "blood"
monster.corpse = 6015
monster.speed = 350
monster.summonCost = 0

monster.changeTarget = {
	interval = 350,
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
	interval = 5000,
	chance = 10,
	{text = "Dust to dust.", yell = false},
	{text = "Earth is the strongest element.", yell = false},
	{text = "Hail Durin!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -518, maxDamage = -674 },
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_FIREDAMAGE, minDamage = -518, maxDamage = -774, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -518, maxDamage = -750, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_MANADRAIN, minDamage = -518, maxDamage = -720, range = 7, radius = 1, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 200, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "small amethyst", chance = 100000, maxCount = 7},
	{id = 3039, chance = 25000},
	{name = "crystal coin", chance = 50000, maxCount = 3},
	{name = "boots of haste", chance = 2500},
	{name = "giant sword", chance = 2500},
	{id = 3341, chance = 100},
	{name = "royal helmet", chance = 2500},
	{name = "steel boots", chance = 2500},
	{name = "experience scroll", chance = 2000},
	{ name = "iron ore", chance = 700 },
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




