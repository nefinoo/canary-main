local mType = Game.createMonsterType("Madareth")
local monster = {}

monster.name = "Madareth"
monster.description = "Madareth"
monster.experience = 225000
monster.outfit = {
	lookType = 12,
	lookHead = 77,
	lookBody = 116,
	lookLegs = 82,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75000
monster.maxHealth = 75000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 380
monster.summonCost = 0

monster.changeTarget = {
	interval = 20,
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
	chance = 20,
	{text = "I am going to play with yourself!", yell = true}
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
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HOLYDAMAGE, minDamage = -2884, maxDamage = -3750, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 3000, chance = 75, type = COMBAT_ICEDAMAGE, minDamage = -3000, maxDamage = -6000, shootEffect = CONST_ANI_ICE, effect = CONST_ME_MAGIC_RED},
	{name ="melee", interval = 1000, chance = 100, minDamage = -2884, maxDamage = -3750}
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
	{name = "flask of warrior's sweat", chance = 500},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




