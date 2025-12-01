local mType = Game.createMonsterType("Orshabaal")
local monster = {}

monster.name = "Orshabaal"
monster.description = "Orshabaal"
monster.experience = 30000
monster.outfit = {
	lookType = 201,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

-- monster.bosstiary = {
	-- bossRaceId = 201,
	-- bossRace = RARITY_NEMESIS,
-- }


monster.health = 32600
monster.maxHealth = 32600
monster.runHealth = 2500
monster.race = "fire"
monster.corpse = 5995
monster.speed = 270
monster.summonCost = 0

monster.changeTarget = {
	interval = 400,
	chance = 10
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
	{text = "Be prepared for the day my masters will come for you!", yell = false},
	{text = "ORSHABAAL IS BACK!", yell = true},
	{text = "PRAISED BE MY MASTERS, THE RUTHLESS SEVEN!", yell = true},
	{text = "SOULS FOR ORSHABAAL!", yell = true},
	{text = "YOU ARE DOOMED!", yell = true}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -1210, maxDamage = -1574},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_MANADRAIN, minDamage = -1210, maxDamage = -1574, range = 7, radius = 1, target = true},
	{name ="combat", interval = 1000, chance = 6, type = COMBAT_MANADRAIN, minDamage = -1210, maxDamage = -1574, radius = 5, target = false, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -1210, maxDamage = -1574, range = 7, radius = 7, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 10, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -1210, maxDamage = -1574, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 111,
	armor = 90,
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 2500, effect = CONST_ME_MAGIC_BLUE},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 5, speed = {min = 1901, max = 1901}, duration = 7000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 4
monster.summons = {
	{name = "demon", chance = 10, interval = 1000, max = 4}
}

monster.loot = {
	{name = "purple tome", chance = 2600},
	{name = "golden mug", chance = 7500},
	-- {id = 2989, chance = 14500},
	-- {name = "ring of the sky", chance = 3500},
	{id = 3007, chance = 5500},
	{name = "crystal necklace", chance = 1500},
	{id = 3025, chance = 3500},
	{name = "white pearl", chance = 12500, maxCount = 15},
	{name = "black pearl", chance = 15000, maxCount = 15},
	{name = "small diamond", chance = 9500, maxCount = 5},
	{name = "small sapphire", chance = 13500, maxCount = 10},
	{name = "small emerald", chance = 15500, maxCount = 10},
	{name = "small amethyst", chance = 13500, maxCount = 20},
	{name = "talon", chance = 14000, maxCount = 7},
	{name = "green gem", chance = 1500},
	{name = "blue gem", chance = 1500},
	{name = "crystal coin", chance = 50000, maxCount = 6},
	{id = 3046, chance = 11500},
	-- {id = 3049, chance = 9500},
	-- {id = 3051, chance = 13500},
	-- {name = "silver amulet", chance = 13000},
	{name = "platinum coin", chance = 75000, maxCount = 80},
	-- {name = "platinum amulet", chance = 45000, maxCount = 60},
	{name = "strange symbol", chance = 2500},
	{name = "orb", chance = 12000},
	{name = "life crystal", chance = 1000},
	{name = "mind stone", chance = 4000},
	{name = "gold ring", chance = 8000},
	{name = "snakebite rod", chance = 3500},
	{name = "necrotic rod", chance = 3500},
	{name = "moonlight rod", chance = 3500},
	{name = "wand of decay", chance = 2500},
	{id = 3076, chance = 2500},
	{name = "boots of haste", chance = 4000},
	{name = "stone skin amulet", chance = 4000},
	-- {id = 3098, chance = 13000},
	{name = "giant sword", chance = 12500},
	{name = "ice rapier", chance = 7500},
	{name = "silver dagger", chance = 15500},
	{name = "golden sickle", chance = 4500},
	-- {name = "thunder hammer", chance = 13500},
	{name = "fire axe", chance = 17000},
	{name = "dragon hammer", chance = 4500},
	{name = "skull staff", chance = 5000},
	{name = "golden legs", chance = 5000},
	{name = "magic plate armor", chance = 3000},
	{name = "mastermind shield", chance = 7500},
	{name = "demon shield", chance = 15500},
	-- {id = 3002, chance = 100}
}

mType:register(monster)




