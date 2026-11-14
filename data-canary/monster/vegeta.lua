local mType = Game.createMonsterType("Vegeta")
local monster = {}

monster.description = "Vegeta"
monster.experience = 41000000000
monster.outfit = {
	lookType = 1836,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2640,
	bossRace = RARITY_ARCHFOE,
} 

monster.health = 10000000
monster.maxHealth = 10000000
monster.race = "blood"
monster.corpse = 5981
monster.speed = 85
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Draken Abomination", chance = 30, interval = 5000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I will protect the secrets of my master!", yell = false },
	{ text = "Kaplar!", yell = false },
	{ text = "This isle will become ours alone", yell = false },
	{ text = "You already know too much.", yell = false },
}

monster.loot = {
	{ name = "minotaur leather", chance = 100000 },
	{ id = 3046, chance = 76000 }, -- magic light wand
	{ name = "gold coin", chance = 38000, maxCount = 10 },
	{ id = 2920, chance = 30000, maxCount = 2 }, -- torch
	{ name = "leather legs", chance = 23000 },
	{ id = 3595, chance = 7690 }, -- carrot
	{ name = "leather helmet", chance = 7690 },
	{ name = "knife", chance = 7690 },
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, minDamage = -40000, maxDamage = -70000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -15000, maxDamage = -25000, range = 7, length = 6, spread = 0, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -15000, maxDamage = -25000, range = 3, length = 6, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -15000, maxDamage = -25000, range = 3, length = 6, spread = 0, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "stone shower rune", interval = 2000, chance = 10, minDamage = -15000, maxDamage = -25000, range = 7, target = false },
}

monster.defenses = {
	defense = 13,
	armor = 12,
	--	mitigation = ???,
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_HEALING, minDamage = 115666, maxDamage = 185000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)




