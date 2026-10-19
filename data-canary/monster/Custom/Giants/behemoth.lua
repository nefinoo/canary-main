local mType = Game.createMonsterType("behemoth")
local monster = {}

monster.name = "behemoth"
monster.description = "a behemoth"
monster.experience = 2050000
monster.outfit = {
	lookType = 55,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 540000
monster.maxHealth = 540000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5999
monster.speed = 280
monster.summonCost = 0

monster.changeTarget = {
	interval = 280,
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
	{text = "Crush the intruders!", yell = true},
	{text = "Human flesh - delicious!", yell = false},
	{text = "You're so little!", yell = false}
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
	{name ="melee", interval = 1500, chance = 100, minDamage = -11249, maxDamage = -19037},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -19037, maxDamage = -24748, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="speed", interval = 1000, chance = 7, speed = {min = 290, max = 290}, duration = 4000, effect = CONST_ME_MAGIC_RED},
	{ name = "combat", interval = 4000, chance = 40, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 19000, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.loot = {
	{name = "strange talisman", chance = 2000},
	{name = "steel boots", chance = 300},
	{name = "meat", chance = 40000, maxCount = 6},
	{name = "perfect behemoth fang", chance = 400},
	{name = "small amethyst", chance = 2000, maxCount = 2},
	{name = "big bone", chance = 7000},
	{name = "giant sword", chance = 388},
	{name = "war axe", chance = 488},
	{name = "ham", chance = 10000, maxCount = 3},
	{name = "behemoth claw", chance = 400},
	
	{name = "platinum coin", chance = 100000, maxCount = 50},
	{name = "platinum coin", chance = 75000, maxCount = 70},
	{name = "crystal coin", chance = 35000, maxCount = 1},
	{name = "experience scroll", chance = 3000, maxCount = 3},
	-- weapons lvl 1000
	{id = 7368, chance = 300},
	{id = 895, chance = 300}, 
	{id = 7390, chance = 300}, 
	{id = 7415, chance = 300},
	{id = 3303, chance = 300},
	-- weapons lvl 500	
	{id = 7366, chance = 400},
	{id = 7426, chance = 400}, 
	{id = 7420, chance = 400}, 
	{id = 3296, chance = 400},
	{id = 7437, chance = 400},
	-- weapons lvl 100
	{name = "magic sword", chance = 500},
	{ id = 3319, chance = 500 }, 
	{ id = 3309, chance = 500 }, 
	{id = 3341, chance = 500},
	{name = "throwing star", chance = 500},
	
	--demon green set
	{id = 37607, chance = 100},
	{id = 37608, chance = 100},
	{id = 37609, chance = 100},
	{id = 37610, chance = 100},
	{id = 7368, chance = 100},
	
	{name = "demon helmet", chance = 750},
	{name = "demon legs", chance = 750},
	{name = "demon shield", chance = 750},
	{id = 6529, chance = 750}, -- soft boots	
}

mType:register(monster)




