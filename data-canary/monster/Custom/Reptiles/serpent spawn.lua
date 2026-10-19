local mType = Game.createMonsterType("Serpent Spawn")
local monster = {}

monster.name = "Serpent Spawn"
monster.description = "a serpent spawn"
monster.experience = 600000
monster.outfit = {
	lookType = 220,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 250000
monster.maxHealth = 250000
monster.runHealth = 275
monster.race = "blood"
monster.corpse = 4323
monster.speed = 240
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
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
	{text = "HISSSS", yell = true},
	{text = "I bring your deathhh, mortalssss", yell = false},
	{text = "Sssssouls for the one", yell = false},
	{text = "Tsssse one will risssse again", yell = false}
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
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 100, attack = 100},
	{name ="combat", interval = 1000, chance = 80, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -2000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON},
	{name ="speed", interval = 1000, chance = 20, speed = {min = -850, max = -850}, duration = 120000, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -5000, maxDamage = -8000, length = 8, spread = 0, effect = CONST_ME_SOUND_RED},
	{name ="combat", interval = 3000, chance = 80, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -1500, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name = "outfit", interval = 1000, chance = 15, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 12000, outfitItem = 3976 },
}

monster.defenses = {
	defense = 25,
	armor = 18,
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_HEALING, minDamage = 300, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 9, speed = {min = 320, max = 320}, duration = 5000, effect = CONST_ME_MAGIC_RED}
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




