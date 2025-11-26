local mType = Game.createMonsterType("Chakoya Windcaller")
local monster = {}

monster.name = "Chakoya Windcaller"
monster.description = "a Chakoya Windcaller"
monster.experience = 48
monster.outfit = {
	lookType = 260,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 84
monster.maxHealth = 84
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 7320
monster.speed = 270
monster.summonCost = 305

monster.changeTarget = {
	interval = 60000,
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
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 50,
	targetDistance = 4,
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
	{text = "Mupi! Si siyoqua jinuma!", yell = false},
	{text = "Siqsiq ji jusipa!", yell = false},
	{text = "Jagura taluka taqua!", yell = false},
	{text = "Quatu nguraka!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 15, minDamage = -5, maxDamage = -15},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -5, maxDamage = -35, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 1000, chance = 18, type = COMBAT_LIFEDRAIN, minDamage = -5, maxDamage = -20, length = 3, spread = 2, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.loot = {
	{name = "gold coin", chance = 3333, maxCount = 25},
	{name = "shard", chance = 2000},
	{name = "rainbow trout", chance = 250}
}

mType:register(monster)




