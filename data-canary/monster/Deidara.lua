local mType = Game.createMonsterType("Deidara")
local monster = {}

monster.description = "an explosive clay master"
monster.experience = 1230000
monster.outfit = {
	lookType = 1907,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2638,
	bossRace = RARITY_ARCHFOE,
} 

monster.health = 6000000
monster.maxHealth = 6000000
monster.race = "blood"
monster.corpse = 6068
monster.speed = 300
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 5,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "hell soldier", chance = 30, interval = 10000, count = 1 },
		{ name = "salazaari defender", chance = 30, interval = 10000, count = 1 },
		{ name = "outlawed warrior", chance = 30, interval = 10000, count = 1 },
	},
}

monster.voices = {
	interval = 10000,
	chance = 10,
	{ text = "I will protect the secrets of my master!", yell = false },
	{ text = "Kaplar!", yell = false },
	{ text = "This isle will become ours alone", yell = false },
	{ text = "You already know too much.", yell = false },
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 3},
	{name = "crystal coin", chance = 75000, maxCount = 5},
	{name = "crystal coin", chance = 50000, maxCount = 8},
	{name = "experience scroll", chance = 5000, maxCount = 3},
	{ name = "silver token", chance = 2500, maxCount = 2},
	{ name = "hook", chance = 5200 },
	{ name = "eye patch", chance = 5300 },
	{ name = "peg leg", chance = 5200 },
	{ name = "bat wing", chance = 2000, maxCount = 2},
	{ name = "red piece of cloth", chance = 2006 },
	{name = "demonic essence", chance = 1818},
	{ name = "ankh", chance = 2240 },
	
	-- Reward Box
	{id = 50854, chance = 2500},
	
	-- items si tienen suerte
	{ id = 51076, chance = 150, unique = true}, -- sorcerer helmet
	{ id = 51077, chance = 150, unique = true}, -- sorcerer armor
	{ id = 51078, chance = 150, unique = true}, -- sorcerer legs
	{ id = 51079, chance = 150, unique = true}, -- sorcerer boots
	{ id = 51080, chance = 150, unique = true}, -- sorcerer shield
	
	{ id = 51230, chance = 150, unique = true}, -- paladin helmet
	{ id = 51231, chance = 150, unique = true}, -- paladin armor
	{ id = 51232, chance = 150, unique = true}, -- paladin legs
	{ id = 51233, chance = 150, unique = true}, -- paladin boots
	{ id = 52367, chance = 150, unique = true}, -- paladin shield
	
	{ id = 51226, chance = 150, unique = true}, -- knight helmet
	{ id = 51229, chance = 150, unique = true}, -- knight armor
	{ id = 51212, chance = 150, unique = true}, -- knight legs
	{ id = 51228, chance = 150, unique = true}, -- knight boots
	{ id = 51697, chance = 150, unique = true}, -- knight shield
	
	{ id = 51070, chance = 150, unique = true}, -- druid helmet
	{ id = 51071, chance = 150, unique = true}, -- druid armor
	{ id = 51072, chance = 150, unique = true}, -- druid legs
	{ id = 51073, chance = 150, unique = true}, -- druid boots
	{ id = 51074, chance = 150, unique = true}, -- druid shield
	
	{ id = 51081, chance = 100, unique = true}, -- wand 
	{ id = 53278, chance = 100, unique = true}, -- bow
	{ id = 50730, chance = 100, unique = true}, -- crossbow
	{ id = 52376, chance = 100, unique = true}, -- sword
	{ id = 52365, chance = 100, unique = true}, -- axe
	{ id = 52366, chance = 100, unique = true}, -- club
	{ id = 51075, chance = 100, unique = true}, -- rod
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, minDamage = -17300, maxDamage = -22500 },
	{ name = "energyfield", interval = 1250, chance = 12, range = 7, radius = 1, shootEffect = CONST_ANI_ENERGY, target = true },
	{ name = "combat", interval = 1250, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = -25000, maxDamage = -45000, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -25000, maxDamage = -45000, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 13,
	armor = 12,
	--	mitigation = ???,
	{ name = "combat", interval = 10000, chance = 15, type = COMBAT_HEALING, minDamage = 25000, maxDamage = 50000, effect = CONST_ME_MAGIC_BLUE, target = false },
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

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)



