local mType = Game.createMonsterType("tortoise")
local monster = {}

monster.name = "Tortoise"
monster.description = "a tortoise"
monster.experience = 90
monster.outfit = {
	lookType = 197,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150
monster.maxHealth = 150
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6072
monster.speed = 200
monster.summonCost = 445

monster.changeTarget = {
	interval = 5000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
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
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 13},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -10, maxDamage = -40}
}

monster.defenses = {
	defense = 15,
	armor = 15
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 80},
	{name = "gold coin", chance = 15000, maxCount = 30},
	{id = 5899, chance = 15000},
	{name = "tortoise egg", chance = 14000, maxCount = 3},
	{name = "tortoise shield", chance = 909},
	{name = "ham", chance = 20000, maxCount = 2},
	{name = "battle hammer", chance = 6666},
	{name = "plate shield", chance = 10000}
}

mType:register(monster)



