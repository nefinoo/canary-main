local mType = Game.createMonsterType("deathpincer")
local monster = {}

monster.name = "deathpincer"
monster.description = "a deathpincer"
monster.experience = 50000000
monster.outfit = {
	lookType = 1055,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2646,
	bossRace = RARITY_NEMESIS,
}

monster.health = 85000
monster.maxHealth = 85000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6021
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 400,
	chance = 10
}

monster.flags = {
	rewardBoss = true,
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = true,
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -435, maxDamage = -1050, condition = {type = CONDITION_POISON, startDamage = 90, interval = 5000} },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -1080, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_FIREWORK_RED },
	{ name = "speed", interval = 2000, chance = 10, speed = {min = -350, max = -350}, duration = 7000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_YELLOWENERGY },
	{ name = "condition", interval = 4000, chance = 15, type = CONDITION_BLEEDING, startDamage = 0, tick = 5000, minDamage = -170, maxDamage = -490, radius = 3, target = false, effect = CONST_ME_POISONAREA }
}

monster.defenses = {
	defense = 45,
	armor = 48,
	{ name = "speed", interval = 4000, chance = 15, speed = {min = 250, max = 250}, duration = 6000, effect = CONST_ME_MAGIC_RED }
}

monster.loot = {
	{ name = "crystal coin", chance = 100000, maxCount = 3 },
	{ id = 51670, chance = 3500, maxCount = 1},
	{ id = 51671, chance = 1200, maxCount = 1},
	{ id = 51673, chance = 500, maxCount = 1},
	{ id = 51672, chance = 150, maxCount = 1},
	{ name = "silver token", chance = 15000, maxCount = 1},	
	--maximiluis montura
	{id = 12304, chance = 1500},	
	
	{id = 5879, chance = 50000, maxCount = 3},	--spider silk
	{ name = "holy orchid", chance = 21000, maxCount = 3 },
	{ id = 5921, chance = 9400, maxCount = 3 }, -- heaven blossom
	{ name = "iron ore", chance = 14000, maxCount = 3 },
	{id = 5925, chance = 12500, maxCount = 3}, -- hardbone
	{name = "red dragon scale", chance = 25000, maxCount = 3},
	{name = "red dragon leather", chance = 25000, maxCount = 3},
	{name = "green dragon scale", chance = 25000, maxCount = 3},
	{name = "green dragon leather", chance = 20000, maxCount = 3},
	
	{ id = 37609, chance = 5000, unique = true}, -- green demon helmet
	{ id = 37608, chance = 5000, unique = true}, -- green demon armor
	{ id = 37607, chance = 5000, unique = true}, -- green demon legs
	{ id = 37610, chance = 5000, unique = true}, -- green demon boots
	{ id = 29420, chance = 5000, unique = true}, -- quinta pieza del set de nivel 1000 (ID solicitado)
	

	-- Knight Set (sin Plate Set)
	{ name = "knight armor", chance = 5000 },
	{ name = "knight legs", chance = 4700 },
	{ name = "knight axe", chance = 4200 },
	{ name = "devil helmet", chance = 3800 },
	{ name = "tower shield", chance = 3500 },
	{ id = 3079, chance = 3500 }, -- Boots of Haste

	-- Crown Set
	{ name = "crown armor", chance = 2200 },
	{ name = "crown legs", chance = 2100 },
	{ name = "crown helmet", chance = 2600 },
	{ name = "crown shield", chance = 2000 },
	{ id = 3055, chance = 6500 }, -- Platinum Amulet (Crown Set)
	{ id = 10386, chance = 2000 }, -- Zaoan Shoes

	-- { id = 51230, chance = 1250}, -- paladin helmet
	-- { id = 51231, chance = 1250}, -- paladin armor
	-- { id = 51232, chance = 1250}, -- paladin legs
	-- { id = 51233, chance = 1250}, -- paladin boots
	-- { id = 52367, chance = 1250}, -- paladin shield
	
	-- { id = 51226, chance = 1250}, -- knight helmet
	-- { id = 51229, chance = 1250}, -- knight armor
	-- { id = 51212, chance = 1250}, -- knight legs
	-- { id = 51228, chance = 1250}, -- knight boots
	-- { id = 51697, chance = 1250}, -- knight shield
	
	-- { id = 51070, chance = 1250}, -- druid helmet
	-- { id = 51071, chance = 1250}, -- druid armor
	-- { id = 51072, chance = 1250}, -- druid legs
	-- { id = 51073, chance = 1250}, -- druid boots
	-- { id = 51074, chance = 1250}, -- druid shield
	
	-- { id = 51081, chance = 1000, unique = true}, -- wand
	-- { id = 53278, chance = 1000, unique = true}, -- bow
	-- { id = 50730, chance = 1000, unique = true}, -- crossbow
	-- { id = 52376, chance = 1000, unique = true}, -- sword
	-- { id = 52365, chance = 1000, unique = true}, -- axe
	-- { id = 52366, chance = 1000, unique = true}, -- club
	-- { id = 51075, chance = 1000, unique = true}, -- rod
}

mType:register(monster)





