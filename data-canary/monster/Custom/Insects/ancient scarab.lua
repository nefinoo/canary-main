local mType = Game.createMonsterType("deathpincer")
local monster = {}

monster.name = "deathpincer"
monster.description = "a deathpincer"
monster.experience = 30000
monster.outfit = {
	lookType = 79,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.bosstiary = {
	bossRaceId = 8999,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 175000
monster.maxHealth = 175000
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -1153, maxDamage = -1500, condition = {type = CONDITION_POISON, startDamage = 400, interval = 5000}},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -1153, maxDamage = -1500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_FIREWORK_RED},
	{name ="speed", interval = 1000, chance = 13, speed = {min = -700, max = -700}, duration = 25000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_YELLOWENERGY},
	{name ="condition", interval = 3000, chance = 50, type = CONDITION_BLEEDING, startDamage = 0, tick = 5000, minDamage = -1153, maxDamage = -1500, radius = 5, target = false, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="speed", interval = 1000, chance = 8, speed = {min = 350, max = 350}, duration = 9000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{ name = "crystal coin", chance = 38000, maxCount = 20 },
	{ name = "experience scroll", chance = 2500, maxCount = 2 },
	{ name = "silver token", chance = 1500, maxCount = 1 },
	{ id = 37609, chance = 1250}, -- sorcerer helmet
	{ id = 37608, chance = 1250}, -- sorcerer armor
	{ id = 37607, chance = 1250}, -- sorcerer legs
	{ id = 37610, chance = 1250}, -- sorcerer boots
	{ id = 6390, chance = 1250}, -- sorcerer shield
	
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




