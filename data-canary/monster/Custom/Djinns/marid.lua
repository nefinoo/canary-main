local mType = Game.createMonsterType("marid")
local monster = {}

monster.name = "marid"
monster.description = "a marid"
monster.experience = 5750000
monster.outfit = {
	lookType = 104,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1200000
monster.maxHealth = 1200000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6033
monster.speed = 170
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
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
	{text = "Simsalabim", yell = false},
	{text = "Feel the power of my magic, tiny mortal!", yell = false},
	{text = "Wishes can come true.", yell = false},
	{text = "Djinns will soon again be the greatest!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
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

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -14999, maxDamage = -25383},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_FIREDAMAGE, minDamage = -25383, maxDamage = -32998, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -25383, maxDamage = -32998, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -25383, maxDamage = -32998, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH},
	{name ="speed", interval = 1000, chance = 13, speed = {min = -650, max = -650}, duration = 15000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="drunk", interval = 1000, chance = 20, drunkenness = 25, duration = 10000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA},
	{name = "outfit", interval = 1000, chance = 17, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 30000, outfitMonster = "rat" },
	{name ="condition", interval = 1000, chance = 17, type = CONDITION_ENERGY, startDamage = 0, tick = 10000, minDamage = -25383, maxDamage = -32998, radius = 3, target = false, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 15,
	armor = 22,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 15000, maxDamage = 25000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 2
monster.summons = {
	{name = "blue djinn", chance = 15, interval = 1000, max = 2}
}

monster.loot = {
	{name = "blue gem", chance = 300},
	{id = 2659, chance = 2500},
	{name = "heavy machete", chance = 5000},
	{name = "hailstorm rod", chance = 1000},
	{name = "blue piece of cloth", chance = 5000, maxCount = 2},
	{name = "magma monocle", chance = 500},
	{name = "small sapphire", chance = 7000, maxCount = 3},
	{name = "small oil lamp", chance = 3333},
	{name = "blueberry", chance = 20000, maxCount = 4},
	{name = "life crystal", chance = 10000},
	
	{name = "platinum coin", chance = 100000, maxCount = 50},
	{name = "platinum coin", chance = 100000, maxCount = 80},
	{name = "crystal coin", chance = 50000, maxCount = 2},
	{name = "experience scroll", chance = 3200, maxCount = 3},
	-- weapons lvl 1000
	{id = 7368, chance = 350},
	{id = 895, chance = 350}, 
	{id = 7390, chance = 350}, 
	{id = 7415, chance = 350},
	{id = 3303, chance = 350},
	-- weapons lvl 500	
	{id = 7366, chance = 450},
	{id = 7426, chance = 450}, 
	{id = 7420, chance = 450}, 
	{id = 3296, chance = 450},
	{id = 7437, chance = 450},
	-- weapons lvl 100
	{name = "magic sword", chance = 550},
	{ id = 3319, chance = 550 }, 
	{ id = 3309, chance = 550 }, 
	{id = 3341, chance = 550},
	{name = "throwing star", chance = 550},
	
	--demon green set
	{id = 37607, chance = 150},
	{id = 37608, chance = 150},
	{id = 37609, chance = 150},
	{id = 37610, chance = 150},
	{id = 7368, chance = 150},
	
	{name = "demon helmet", chance = 1000},
	{name = "demon legs", chance = 1000},
	{name = "demon shield", chance = 1000},
	{id = 6529, chance = 1000}, -- soft boots
}

mType:register(monster)




