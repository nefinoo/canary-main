local mType = Game.createMonsterType("dementor")
local monster = {}

monster.name = "dementor"
monster.description = "a dementor"
monster.experience = 10000
monster.outfit = {
	lookType = 78,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 18500
monster.maxHealth = 18500
monster.runHealth = 500
monster.race = "blood"
monster.corpse = 6019
monster.speed = 300
monster.summonCost = 0

monster.changeTarget = {
	interval = 450,
	chance = 15
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
	{text = "Are you ready to rock?", yell = false},
	{text = "Dance for me your dance of death!", yell = false},
	{text = "Feel my gentle kiss of death.", yell = false},
	{text = "I will mourn your death!", yell = false},
	{text = "IIIIEEEeeeeeehhhHHHHH!", yell = true},
	{text = "Let the music play!", yell = false},
	{text = "That's what I call easy listening!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -690, maxDamage = -900, condition = {type = CONDITION_POISON, startDamage = 150, interval = 5000}},
	{name ="speed", interval = 1000, chance = 50, speed = {min = -600, max = -600}, duration = 20000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 95, type = COMBAT_LIFEDRAIN, minDamage = -690, maxDamage = -900, radius = 4, target = false, effect = CONST_ME_SOUND_RED}
}

monster.defenses = {
	defense = 20,
	armor = 15,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 250, maxDamage = 350, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 10},
	{id = 7426, chance = 50},
	{name = "experience scroll", chance = 2500},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




