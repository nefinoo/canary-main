local mType = Game.createMonsterType("salazaari defender")
local monster = {}

monster.name = "salazaari defender"
monster.description = "a salazaari defender"
monster.experience = 11500
monster.outfit = {
	lookType = 62,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 9400
monster.maxHealth = 9400
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6003
monster.speed = 280
monster.summonCost = 0

monster.changeTarget = {
	interval = 500,
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
	canPushItems = false,
	canPushCreatures = false,
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
	{text = "Bahaha aka!", yell = false},
	{text = "Death to the defilers!", yell = false},
	{text = "Flee as long as you can.", yell = false},
	{text = "Ulathil beia Thratha!", yell = false},
	{text = "You are not welcome here.", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -594, maxDamage = -773 },
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -594, maxDamage = -773, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BURSTARROW},
	{name ="Berserk", interval = 2000, chance = 65, minDamage = -594, maxDamage = -825, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 12,
	armor = 6,
	{name ="speed", interval = 2000, chance = 40, speed = {min = 0, max = 0}, duration = 0, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 5},
	{name = "magic sword", chance = 100},
	{name = "crown armor", chance = 2500},
	{name = "crown legs", chance = 2500},
	{name = "crown helmet", chance = 2500},
	{name = "experience scroll", chance = 2000},
	{ id = 5921, chance = 940 }, -- heaven blossom
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




