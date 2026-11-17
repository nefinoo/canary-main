-- Frozen Hell: exclusivo de Fishing (nivel 2000); no altera las criaturas de caza comunes.
local mType = Game.createMonsterType("Fishing Quara Predator")
local monster = {}

monster.name = "Fishing Quara Predator"
monster.description = "a quara predator"
monster.experience = 550000000
monster.outfit = {
	lookType = 20,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 42000
monster.maxHealth = 42000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6067
monster.speed = 520
monster.summonCost = 0

monster.changeTarget = {
	interval = 1000,
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
	{text = "Rraaar!", yell = false},
	{text = "Rrrah!", yell = false}
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
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -780, maxDamage = -1800, range = 1, radius = 1, target = true},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -260, maxDamage = -570, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ICETORNADO},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_ICEDAMAGE, minDamage = -280, maxDamage = -650, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_FIREWORK_BLUE}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="speed", interval = 10000, chance = 40, speed = {min = 210, max = 210}, duration = 20000, effect = CONST_ME_MAGIC_GREEN},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 250, maxDamage = 450, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{ id = 3579, chance = 38900, maxCount = 5 },
	{ id = 3580, chance = 27350 },
	{ id = 3581, chance = 29050 },
	{ id = 7159, chance = 26250, maxCount = 2 },
	{ id = 7158, chance = 18350, maxCount = 2 },
	{ name = "fish fin", chance = 15100, maxCount = 2 },
	{ name = "small diamond", chance = 7200 },
	{ name = "platinum coin", chance = 50000, maxCount = 9 },
	{ name = "experience scroll", chance = 315 }
}

mType:register(monster)





