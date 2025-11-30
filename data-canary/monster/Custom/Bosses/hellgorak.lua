local mType = Game.createMonsterType("Hellgorak")
local monster = {}

monster.name = "Hellgorak"
monster.description = "Hellgorak"
monster.experience = 650000
monster.outfit = {
	lookType = 12,
	lookHead = 19,
	lookBody = 96,
	lookLegs = 21,
	lookFeet = 81,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 250000
monster.maxHealth = 250000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 360
monster.summonCost = 0

monster.changeTarget = {
	interval = 30,
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
	chance = 10,
	{text = "??", yell = true},
	{text = "??", yell = true}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -2884, maxDamage = -3750},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, length = 8, spread = 0, effect = CONST_ME_PURPLEENERGY},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_MANADRAIN, minDamage = -2884, maxDamage = -3750, radius = 5, target = false, effect = CONST_ME_STUN},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -2884, maxDamage = -3750, radius = 5, target = true, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -2884, maxDamage = -3750, radius = 7, target = false, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, effect = CONST_ME_MAGIC_GREEN}
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 20},
	{id = 3046, chance = 50000},
	{name = "crown shield", chance = 500},
	{id = 3410, chance = 5000},
	{name = "vampire shield", chance = 5000},
	{name = "experience scroll", chance = 3000},
	{name = "flask of warrior's sweat", chance = 500},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




