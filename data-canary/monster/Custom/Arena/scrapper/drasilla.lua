local mType = Game.createMonsterType("drasilla")
local monster = {}

monster.name = "Drasilla"
monster.description = "drasilla"
monster.experience = 700
monster.outfit = {
	lookType = 34,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1320
monster.maxHealth = 1320
monster.runHealth = 100
monster.race = "blood"
monster.corpse = 7349
monster.speed = 170
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5
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
	canPushCreatures = false,
	staticAttackChance = 78,
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
	interval = 2000,
	chance = 5,
	{text = "FCHHHHHHHH!", yell = false},
	{text = "GROOOOAAAAAAAAR!", yell = false},
	{text = "DIRTY LITTLE HUMANS", yell = false},
	{text = "YOU CAN'T KEEP ME HERE FOREVER", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -42, maxDamage = -130},
	{name ="combat", interval = 6000, chance = 60, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -180, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 3000, chance = 50, type = COMBAT_FIREDAMAGE, minDamage = -70, maxDamage = -115, range = 10, radius = 5, target = true, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 33,
	armor = 32,
	{name ="combat", interval = 6000, chance = 65, type = COMBAT_HEALING, minDamage = 20, maxDamage = 50, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
}

mType:register(monster)



