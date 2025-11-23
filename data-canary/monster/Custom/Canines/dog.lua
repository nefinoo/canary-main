local mType = Game.createMonsterType("dog")
local monster = {}

monster.name = "little puppy"
monster.description = "a little puppy"
monster.experience = 30000
monster.outfit = {
	lookType = 32,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 20000
monster.maxHealth = 20000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5971
monster.speed = 500
monster.summonCost = 0

monster.changeTarget = {
	interval = 500,
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
	staticAttackChance = 60,
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
	{text = "GROOOWL!", yell = false},
	{text = "GRRRRR!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -1337, maxDamage = -1337},
	{name ="combat", interval = 2000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -400, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 2000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -400, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 3000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -400, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -400, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 35,
	armor = 25
}

monster.loot = {
	{id = 9743, chance = 2500},
	{name = "ham", chance = 50000, maxCount = 100},
	{name = "experience scroll", chance = 2500}
}

mType:register(monster)



