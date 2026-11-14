local mType = Game.createMonsterType("Annihilon")
local monster = {}

monster.name = "Annihilon"
monster.description = "Annihilon"
monster.experience = 200000000
monster.outfit = {
	lookType = 12,
	lookHead = 19,
	lookBody = 104,
	lookLegs = 96,
	lookFeet = 96,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75000
monster.maxHealth = 75000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 380
monster.summonCost = 0

monster.changeTarget = {
	interval = 20,
	chance = 8
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
	staticAttackChance = 85,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 2200,
	chance = 30,
	{text = "Annihilation!", yell = true}
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
	{name ="melee", interval = 1500, chance = 100, minDamage = -1442, maxDamage = -1875},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, length = 8, spread = 0, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, radius = 4, target = false, effect = CONST_ME_ICEAREA},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, radius = 5, target = true, effect = CONST_ME_GROUNDSHAKER},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, radius = 6, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 2400, maxDamage = 4500, effect = CONST_ME_MAGIC_GREEN},
	{name ="speed", interval = 1000, chance = 25, speed = {min = 500, max = 500}, duration = 7000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 8},
	{name = "platinum coin", chance = 70000, maxCount = 10},
	{name = "experience scroll", chance = 1000, maxCount = 1},	
	{name = "green gem", chance = 1850},
	{name = "blue gem", chance = 1750},
	{name = "green gem", chance = 1500},
	{name = "violet gem", chance = 750},
	{name = "demon helmet", chance = 750},
	{name = "demon legs", chance = 750},
	{name = "demon shield", chance = 750},
	{id = 6529, chance = 750}, -- soft boots
	{name = "Huge Chunk of Crude Iron", chance = 250},
	{name = "Damaged Steel Helmet", chance = 1300, unique = true },
	{name = "flask of warrior's sweat", chance = 500},	
	-- Reward Box
	{id = 50854, chance = 15},
}

mType:register(monster)





