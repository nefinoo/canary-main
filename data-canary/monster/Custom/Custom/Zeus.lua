local mType = Game.createMonsterType("Zeus")
local monster = {}

monster.name = "Zeus"
monster.description = "a shining light"
monster.experience = 100000
monster.outfit = {
	lookType = 130,
	lookHead = 57,
	lookBody = 79,
	lookLegs = 78,
	lookFeet = 132,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 100000
monster.maxHealth = 100000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 4311
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 3000,
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
	canPushCreatures = false,
	staticAttackChance = 70,
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
	interval = 5000,
	chance = 5,
	{text = "Feel the wrath of me dos attack!", yell = false},
	{text = "Gimme free gold!", yell = false},
	{text = "Gimme your password!", yell = false},
	{text = "Me have a cheating link for you!", yell = false},
	{text = "Me is GM!", yell = false},
	{text = "Me just need the code!", yell = false},
	{text = "Me not stink!", yell = false},
	{text = "Me other char is highlevel!", yell = false},
	{text = "Me sooo smart!", yell = false},
	{text = "You're next!", yell = false}
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
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 1500, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -2884, maxDamage = -3750, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_FIREWORK_YELLOW},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -5000, maxDamage = -6000, range = 6, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 12,
	armor = 15,
	{name ="speed", interval = 1000, chance = 15, speed = {min = 290, max = 290}, duration = 6000, effect = CONST_ME_MAGIC_RED},
	{name = "outfit", interval = 10000, chance = 15, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000, outfitMonster = "pig" },
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 6300, maxDamage = 7500, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 3
monster.summons = {
	{name = "Ares", chance = 20, interval = 1000, max = 3},
	{name = "Athena", chance = 20, interval = 1000, max = 3},
	{name = "Hercules", chance = 20, interval = 1000, max = 3}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 10},
	{name = "platinum coin", chance = 75000, maxCount = 30},
	{name = "platinum coin", chance = 50000, maxCount = 50},
	{name = "experience scroll", chance = 2500, maxCount = 2},
	-- weapons lvl 1000
	{id = 7368, chance = 150},
	{id = 895, chance = 150}, 
	{id = 7390, chance = 150}, 
	{id = 7415, chance = 150},
	{id = 3303, chance = 150},
	-- weapons lvl 500	
	{id = 7366, chance = 250},
	{id = 7426, chance = 250}, 
	{id = 7420, chance = 250}, 
	{id = 3296, chance = 250},
	{id = 7437, chance = 250},
	-- weapons lvl 100
	{name = "magic sword", chance = 350},
	{ id = 3319, chance = 350 }, 
	{ id = 3309, chance = 350 }, 
	{id = 3341, chance = 350},
	{name = "throwing star", chance = 350},
	
	{name = "demon helmet", chance = 350},
	{name = "demon legs", chance = 350},
	{name = "demon shield", chance = 350},
	{id = 6529, chance = 350}, -- soft boots
	
	-- Reward Box
	{id = 50854, chance = 15},
}

mType:register(monster)




