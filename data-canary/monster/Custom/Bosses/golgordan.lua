local mType = Game.createMonsterType("Golgordan")
local monster = {}

monster.name = "Golgordan"
monster.description = "Golgordan"
monster.experience = 1000000
monster.outfit = {
	lookType = 12,
	lookHead = 108,
	lookBody = 100,
	lookLegs = 105,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500000
monster.maxHealth = 500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 350
monster.summonCost = 0

monster.changeTarget = {
	interval = 20,
	chance = 10
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
	staticAttackChance = 85,
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
	interval = 2200,
	chance = 30,
	{text = "Latrivan your fool", yell = true}
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
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 400, attack = 400},
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -1000, length = 8, spread = 0, effect = CONST_ME_MORTAREA},
	{name ="condition", interval = 1000, chance = 100, type = CONDITION_POISON, startDamage = 0, tick = 5000, minDamage = -300, maxDamage = -1500, length = 5, spread = 2, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -1750, radius = 6, target = false, effect = CONST_ME_GROUNDSHAKER},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -1000, radius = 7, target = true, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 100,
	armor = 100
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 20},
	{id = 3046, chance = 50000},
	{name = "crown shield", chance = 500},
	{id = 3410, chance = 5000},
	{name = "vampire shield", chance = 5000},
	{name = "experience scroll", chance = 3000},
	{id = 9743, chance = 2500}
}

mType:register(monster)




