local mType = Game.createMonsterType("Sea Serpent")
local monster = {}

monster.name = "Sea Serpent"
monster.description = "a sea serpent"
monster.experience = 15000000
monster.outfit = {
	lookType = 275,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.bosstiary = {
	bossRaceId = 8001,
	bossRace = RARITY_NEMESIS,
}


monster.health = 1000000
monster.maxHealth = 1000000
monster.runHealth = 300
monster.race = "blood"
monster.corpse = 949
monster.speed = 658
monster.summonCost = 0

monster.changeTarget = {
	interval = 6000,
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
	canWalkOnPoison = false,
	rewardBoss = true,
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 100,
	{text = "CHHHRRRR", yell = false},
	{text = "HISSSS", yell = false}
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
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -9000, maxDamage = -20000, range = 1, radius = 1, target = true},
	{name ="combat", interval = 2000, chance = 60, type = COMBAT_ICEDAMAGE, minDamage = -10000, maxDamage = -11000, length = 9, spread = 3, effect = CONST_ME_ICEAREA},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -2000, maxDamage = -3000, radius = 4, target = true, effect = CONST_ME_LOSEENERGY}
}

monster.defenses = {
	defense = 25,
	armor = 16,
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_HEALING, minDamage = 20000, maxDamage = 30000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "salmon", chance = 2000},
	{name = "northern pike", chance = 2000},
	{name = "worm", chance = 5000, maxCount = 25},
	{name = "rainbow trout", chance = 2000},
	{name = "green perch", chance = 2000},
	{name = "experience scroll", chance = 3000},
	{id = 893, chance = 5}
}

mType:register(monster)




