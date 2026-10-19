local mType = Game.createMonsterType("Unkempt Soul")
local monster = {}

monster.name = "Unkempt Soul"
monster.description = "an unkempt soul"
monster.experience = 25000000000
monster.outfit = {
	lookType = 316,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1500000
monster.maxHealth = 1500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 9961
monster.speed = 350
monster.summonCost = 0

monster.changeTarget = {
	interval = 10,
	chance = 30
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
	interval = 5000,
	chance = 10,
	{text = "Crackle", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = 25},
	{type = COMBAT_EARTHDAMAGE, percent = 25},
	{type = COMBAT_FIREDAMAGE, percent = 25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 25},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 300, attack = 900},
	{name ="combat", interval = 2400, chance = 50, type = COMBAT_DEATHDAMAGE, minDamage = -25000, maxDamage = -35000, range = 4, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2200, chance = 50, type = COMBAT_ENERGYDAMAGE, minDamage = -25000, maxDamage = -35000, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 20000, maxDamage = 25000, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 2
monster.summons = {
	{name = "Mercury Blob", chance = 10, interval = 1000, max = 2}
}

monster.loot = {
	{name = "vial", chance = 10000}
}

mType:register(monster)





