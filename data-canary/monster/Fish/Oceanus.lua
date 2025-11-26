local mType = Game.createMonsterType("Oceanus")
local monster = {}

monster.name = "Oceanus"
monster.description = "the titan goddess of water"
monster.experience = 250000000
monster.outfit = {
	lookType = 252,
	lookHead = 87,
	lookBody = 87,
	lookLegs = 86,
	lookFeet = 86,
	lookAddons = 3,
	lookMount = 0
}

monster.bosstiary = {
	bossRaceId = 9001,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 30000000
monster.maxHealth = 30000000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 6068
monster.speed = 350
monster.summonCost = 0

monster.changeTarget = {
	interval = 45000,
	chance = 50
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
	staticAttackChance = 50,
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
	chance = 10,
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 900, attack = 2700},
	{name ="combat", interval = 2000, chance = 1000, type = COMBAT_DROWNDAMAGE, minDamage = -25000, maxDamage = -55000, radius = 4, target = false, effect = CONST_ME_BUBBLES},
	{name ="combat", interval = 2200, chance = 100, type = COMBAT_DEATHDAMAGE, minDamage = -25000, maxDamage = -72000, range = 6, radius = 1, target = true, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK},
	{name ="combat", interval = 2400, chance = 75, type = COMBAT_ICEDAMAGE, minDamage = -25000, maxDamage = -60000, length = 5, spread = 0, effect = CONST_ME_SOUND_BLUE}
}

monster.defenses = {
	defense = 130,
	armor = 150,
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_HEALING, minDamage = 60000, maxDamage = 80000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "hydra tongue", chance = 100000},
	{id = 9058, chance = 100000, maxCount = 10},
	{name = "worm", chance = 100000, maxCount = 100},
	{name = "worm", chance = 100000, maxCount = 100},
	{name = "experience scroll", chance = 100000},
	{name = "experience scroll", chance = 100000},
	{name = "experience scroll", chance = 100000}
}

mType:register(monster)




