-- Frozen Hell: exclusivo de Fishing (nivel 1000); no altera las criaturas de caza comunes.
local mType = Game.createMonsterType("Fishing Quara Constrictor")
local monster = {}

monster.name = "Fishing Quara Constrictor"
monster.description = "a quara constrictor"
monster.experience = 125000000
monster.outfit = {
	lookType = 46,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6065
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
	{text = "Boohaa!", yell = false},
	{text = "Gaaahhh!", yell = false},
	{text = "Gluh! Gluh!", yell = false},
	{text = "Tssss!", yell = false}
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
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -460, maxDamage = -1050, range = 1, radius = 1, target = true},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -230, maxDamage = -550, range = 1, radius = 3, target = false, effect = CONST_ME_HITAREA}
}

monster.defenses = {
	defense = 15,
	armor = 15
}

monster.loot = {
	{ id = 3579, chance = 33700, maxCount = 4 },
	{ id = 3580, chance = 23550 },
	{ id = 3581, chance = 25650 },
	{ id = 7159, chance = 21250, maxCount = 2 },
	{ id = 7158, chance = 14550, maxCount = 2 },
	{ name = "fish fin", chance = 12300, maxCount = 2 },
	{ name = "small diamond", chance = 5600 },
	{ name = "platinum coin", chance = 50000, maxCount = 7 },
	{ name = "experience scroll", chance = 255 }
}

mType:register(monster)





