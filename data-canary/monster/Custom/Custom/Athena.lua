local mType = Game.createMonsterType("Athena")
local monster = {}

monster.name = "Athena"
monster.description = "Athena"
monster.experience = 82500
monster.outfit = {
	lookType = 139,
	lookHead = 79,
	lookBody = 116,
	lookLegs = 116,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75000
monster.maxHealth = 75000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 4311
monster.speed = 250
monster.summonCost = 1000000000

monster.changeTarget = {
	interval = 3000,
	chance = 30
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
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
	chance = 10,
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
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 1500, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -2884, maxDamage = -3750, range = 1, radius = 1, target = true},
	{name ="combat", interval = 4000, chance = 40, type = COMBAT_ENERGYDAMAGE, minDamage = -2884, maxDamage = -3750, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 12,
	armor = 15,
	{name ="speed", interval = 1000, chance = 15, speed = {min = 290, max = 290}, duration = 6000, effect = CONST_ME_MAGIC_RED},
	{ name = "outfit", interval = 1000, chance = 15, effect = CONST_ME_GROUNDSHAKER, target = false, duration = 5000, outfitMonster = "pig" },
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_HEALING, minDamage = 4000, maxDamage = 5000, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 5},
	{name = "platinum coin", chance = 75000, maxCount = 15},
	{name = "platinum coin", chance = 50000, maxCount = 30},
	{name = "experience scroll", chance = 2500, maxCount = 2},
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
	
	-- Reward Box
	{id = 50854, chance = 15},
}

mType:register(monster)




