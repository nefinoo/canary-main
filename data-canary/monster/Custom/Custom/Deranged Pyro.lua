local mType = Game.createMonsterType("Deranged Pyro")
local monster = {}

monster.name = "Deranged Pyro"
monster.description = "a deranged pyro"
monster.experience = 275000000
monster.outfit = {
	lookType = 194,
	lookHead = 132,
	lookBody = 114,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 60000
monster.maxHealth = 60000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 4311
monster.speed = 250
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
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, mminDamage = -3460, maxDamage = -4500, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_EXPLOSIONHIT},
	{name ="melee", interval = 1500, chance = 100, minDamage = -3460, maxDamage = -4500}
}

monster.defenses = {
	defense = 12,
	armor = 15,
	{name ="speed", interval = 1000, chance = 15, speed = {min = 290, max = 290}, duration = 6000, effect = CONST_ME_MAGIC_RED},
	{name = "outfit", interval = 10000, chance = 15, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000, outfitMonster = "pig" },
	{name ="melee", interval = 1000, chance = 100, skill = 200, attack = 200}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 7},
	{name = "platinum coin", chance = 75000, maxCount = 10},
	{name = "platinum coin", chance = 50000, maxCount = 15},
	{name = "experience scroll", chance = 2500, maxCount = 2},
	{name = "green gem", chance = 1850},
	{name = "blue gem", chance = 1750},
	{name = "green gem", chance = 1500},
	{name = "violet gem", chance = 750},
	{name = "demon helmet", chance = 750},
	{name = "demon legs", chance = 750},
	{name = "demon shield", chance = 750},
	{id = 6529, chance = 750}, -- soft boots
	-- Reward Box
	{id = 50854, chance = 15},
	{id = 3082, chance = 5000}, -- elven amulet
}

mType:register(monster)





