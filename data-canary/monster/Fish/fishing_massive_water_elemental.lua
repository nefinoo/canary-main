-- Frozen Hell: exclusivo de Fishing (nivel 750); no altera las criaturas de caza comunes.
local mType = Game.createMonsterType("Fishing Massive Water Elemental")
local monster = {}

monster.name = "Fishing Massive Water Elemental"
monster.description = "a massive water elemental"
monster.experience = 101400000
monster.outfit = {
	lookType = 11,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 26000
monster.maxHealth = 26000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 9582
monster.speed = 500
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
	{name ="melee", interval = 1500, chance = 100, minDamage = -420, maxDamage = -870},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -390, range = 7, radius = 6, target = false, effect = CONST_ME_LOSEENERGY},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -240, maxDamage = -440, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -320, maxDamage = -520, range = 7, radius = 6, target = false, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 22,
	armor = 20,
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 180, maxDamage = 360, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{ id = 3579, chance = 32400, maxCount = 4 },
	{ id = 3580, chance = 22600 },
	{ id = 3581, chance = 24800 },
	{ id = 7159, chance = 20000, maxCount = 2 },
	{ id = 7158, chance = 13600, maxCount = 2 },
	{ name = "fish fin", chance = 11600, maxCount = 2 },
	{ name = "small diamond", chance = 5200 },
	{ name = "platinum coin", chance = 50000, maxCount = 7 },
	{ name = "experience scroll", chance = 240 }
}

mType:register(monster)





