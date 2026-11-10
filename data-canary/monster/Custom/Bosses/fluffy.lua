local mType = Game.createMonsterType("Fluffy")
local monster = {}

monster.name = "Fluffy"
monster.description = "Fluffy"
monster.experience = 150000
monster.outfit = {
	lookType = 240,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 95000
monster.maxHealth = 95000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6332
monster.speed = 310
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
	{text = "Wooof!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -560, maxDamage = -875 },
	{name ="combat", interval = 1500, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -875, length = 8, spread = 3, effect = CONST_ME_LOSEENERGY},
	{name ="combat", interval = 1000, chance = 150, type = COMBAT_EARTHDAMAGE, minDamage = -220, maxDamage = -875, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -305, maxDamage = -875, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -335, maxDamage = -875, range = 7, radius = 6, target = false, effect = CONST_ME_LOSEENERGY}
}

monster.defenses = {
	defense = 55,
	armor = 50,
	mitigation = 2.00,
	{ name = "combat", interval = 3500, chance = 50, type = COMBAT_HEALING, minDamage = 1200, maxDamage = 2000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 100 },
	{ name = "gold coin", chance = 50000, maxCount = 90 },
	{ id = 3091, chance = 10000 }, -- sword ring
	{ name = "broadsword", chance = 4000 },
	{ name = "magic plate armor", chance = 2000 },
	{ name = "skull helmet", chance = 50000 },
	{ name = "soul orb", chance = 10000 },
	{ id = 6299, chance = 4000 }, -- death ring
	{ name = "demonic essence", chance = 1538 },
	{ name = "dragonbone staff", chance = 50000 },
	{id = 12413, chance = 10000},
	{id = 3399, chance = 200},
	{id = 8095, chance = 200},
	{id = 3408, chance = 200},
}

mType:register(monster)





