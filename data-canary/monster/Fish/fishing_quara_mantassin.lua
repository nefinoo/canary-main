-- Frozen Hell: exclusivo de Fishing (nivel 1500); no altera las criaturas de caza comunes.
local mType = Game.createMonsterType("Fishing Quara Mantassin")
local monster = {}

monster.name = "Fishing Quara Mantassin"
monster.description = "a quara mantassin"
monster.experience = 300000000
monster.outfit = {
	lookType = 72,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 33000
monster.maxHealth = 33000
monster.runHealth = 40
monster.race = "blood"
monster.corpse = 6064
monster.speed = 520
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
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
	{text = "Shrrrr", yell = false},
	{text = "Zuerk Pachak!", yell = false}
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
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -500, maxDamage = -1250, range = 1, radius = 1, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="invisible", interval = 4000, chance = 15, duration = 2000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{ id = 3579, chance = 36300, maxCount = 4 },
	{ id = 3580, chance = 25450 },
	{ id = 3581, chance = 27350 },
	{ id = 7159, chance = 23750, maxCount = 2 },
	{ id = 7158, chance = 16450, maxCount = 2 },
	{ name = "fish fin", chance = 13700, maxCount = 2 },
	{ name = "small diamond", chance = 6400 },
	{ name = "platinum coin", chance = 50000, maxCount = 8 },
	{ name = "experience scroll", chance = 285 }
}

mType:register(monster)





