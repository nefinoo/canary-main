local mType = Game.createMonsterType("earth overlord")
local monster = {}

monster.name = "earth overlord"
monster.description = "an earth overlord"
monster.experience = 2800
monster.outfit = {
	lookType = 285,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4000
monster.maxHealth = 4000
monster.runHealth = 1
monster.race = "undead"
monster.corpse = 8933
monster.speed = 330
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
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
	staticAttackChance = 80,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 120, attack = 135},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -800, length = 7, spread = 0, effect = CONST_ME_STONES},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -490, radius = 6, target = false, effect = CONST_ME_BIGPLANTS},
	{name ="speed", interval = 2000, chance = 20, speed = {min = -750, max = -750}, duration = 4000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 130},
	{name = "platinum coin", chance = 6000, maxCount = 3},
	{name = "mother soil", chance = 2200}
}

mType:register(monster)




