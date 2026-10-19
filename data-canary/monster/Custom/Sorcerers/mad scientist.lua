local mType = Game.createMonsterType("Mad Scientist")
local monster = {}

monster.name = "Mad Scientist"
monster.description = "a mad scientist"
monster.experience = 3000000
monster.outfit = {
	lookType = 133,
	lookHead = 97,
	lookBody = 0,
	lookLegs = 38,
	lookFeet = 97,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 25000000
monster.maxHealth = 25000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 220
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
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

monster.events = {
	"MadScientistDeath",
}

monster.voices = {
	interval = 3000,
	chance = 10,
	{text = "Die in the name of Science!", yell = false},
	{text = "You will regret interrupting my studies!", yell = false},
	{text = "Let me test this!", yell = false},
	{text = "I will study your corpse!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -15000, maxDamage = -35000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, minDamage = -36000, maxDamage = -56000, range = 7, radius = 3, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_POFF, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -20000, maxDamage = -36000, shootEffect = CONST_ANI_POISON, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "speed", interval = 2000, chance = 10, speedChange = -300, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_SMALLPLANTS, target = true, duration = 2000 },
}

monster.defenses = {
	defense = 20,
	armor = 15,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 10, maxDamage = 30, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "orange backpack", chance = 100},
	{name = "crystal coin", chance = 10000, maxCount = 30},
	{name = "experience scroll", chance = 3000, maxCount = 3},
	{name = "silver token", chance = 1500, maxCount = 2},
	{id = 12308, chance = 1200},
	{id = 3006, chance = 2600 },
	{ name = "magic sulphur", chance = 600, maxCount = 10},
}

mType:register(monster)




