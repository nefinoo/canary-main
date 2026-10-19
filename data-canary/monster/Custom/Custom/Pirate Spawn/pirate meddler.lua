local mType = Game.createMonsterType("Pirate Meddler")
local monster = {}

monster.name = "Pirate Meddler"
monster.description = "pirate meddler"
monster.experience = 575000
monster.outfit = {
	lookType = 98,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 145000
monster.maxHealth = 145000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 420
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 25
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
	staticAttackChance = 1,
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
	chance = 50,
	{text = "Argh mate!", yell = true},
	{text = "Wash the starboard deck!", yell = true}
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
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 1500, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -7500, maxDamage = -11000, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 45,
	armor = 10,
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 7000, maxDamage = 12000, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 25, speed = {min = 0, max = 0}, duration = 0, effect = CONST_ME_MAGIC_GREEN}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 30},
	{name = "platinum coin", chance = 75000, maxCount = 50},
	{name = "platinum coin", chance = 50000, maxCount = 80},
	{name = "experience scroll", chance = 2500, maxCount = 3},
	{ name = "hook", chance = 600 },
	{ name = "eye patch", chance = 500 },
	{ name = "peg leg", chance = 600 },
	-- weapons lvl 1000
	{id = 7368, chance = 250},
	{id = 895, chance = 250}, 
	{id = 7390, chance = 250}, 
	{id = 7415, chance = 250},
	{id = 3303, chance = 250},
	-- weapons lvl 500	
	{id = 7366, chance = 350},
	{id = 7426, chance = 350}, 
	{id = 7420, chance = 350}, 
	{id = 3296, chance = 350},
	{id = 7437, chance = 350},
	-- weapons lvl 100
	{name = "magic sword", chance = 500},
	{ id = 3319, chance = 500 }, 
	{ id = 3309, chance = 500 }, 
	{id = 3341, chance = 500},
	{name = "throwing star", chance = 500},
	
	{name = "demon helmet", chance = 750},
	{name = "demon legs", chance = 750},
	{name = "demon shield", chance = 750},
	{id = 6529, chance = 750}, -- soft boots	
}

mType:register(monster)




