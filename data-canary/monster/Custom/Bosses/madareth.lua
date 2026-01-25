local mType = Game.createMonsterType("Madareth")
local monster = {}

monster.name = "Madareth"
monster.description = "Madareth"
monster.experience = 85000
monster.outfit = {
	lookType = 12,
	lookHead = 77,
	lookBody = 116,
	lookLegs = 82,
	lookFeet = 79,
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 2200,
	chance = 20,
	{text = "I am going to play with yourself!", yell = true}
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
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HOLYDAMAGE, minDamage = -2884, maxDamage = -3750, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 3000, chance = 34, type = COMBAT_ICEDAMAGE, minDamage = -2884, maxDamage = -3750, shootEffect = CONST_ANI_ICE, effect = CONST_ME_MAGIC_RED},
	{name ="melee", interval = 1500, chance = 100, minDamage = -1442, maxDamage = -1875},
}

monster.defenses = {
	defense = 100,
	armor = 100
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 3},
	{name = "platinum coin", chance = 70000, maxCount = 5},
	{name = "experience scroll", chance = 2500, maxCount = 1},
	-- weapons lvl 1000
	{id = 7368, chance = 100},
	{id = 895, chance = 100}, 
	{id = 7390, chance = 100}, 
	{id = 7415, chance = 100},
	{id = 3303, chance = 100},
	-- weapons lvl 500	
	{id = 7366, chance = 200},
	{id = 7426, chance = 200}, 
	{id = 7420, chance = 200}, 
	{id = 3296, chance = 200},
	{id = 7437, chance = 200},
	-- weapons lvl 100
	{name = "magic sword", chance = 300},
	{ id = 3319, chance = 300 }, 
	{ id = 3309, chance = 300 }, 
	{id = 3341, chance = 300},
	{name = "throwing star", chance = 300},
	
	{name = "demon helmet", chance = 300},
	{name = "demon legs", chance = 300},
	{name = "demon shield", chance = 300},
	{id = 6529, chance = 500}, -- soft boots
	{name = "Huge Chunk of Crude Iron", chance = 250},
	{name = "Damaged Steel Helmet", chance = 1300, unique = true },
	{name = "flask of warrior's sweat", chance = 500},
	
	-- Reward Box
	{id = 50854, chance = 15},
}

mType:register(monster)




