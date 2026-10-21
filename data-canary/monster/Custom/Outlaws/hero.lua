local mType = Game.createMonsterType("frozenhell guard")
local monster = {}

monster.name = "frozenhell guard"
monster.description = "a frozenhell guard"
monster.experience = 687000000
monster.outfit = {
	lookType = 73,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 245000
monster.maxHealth = 245000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6081
monster.speed = 400
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
	interval = 1,
	chance = 10,
	{text = "Have you seen princess Lumelia?", yell = true},
	{text = "I will sing a tune at your grave.", yell = true},
	{text = "Let's have a fight!", yell = true},
	{text = "Welcome to my battleground.", yell = true}
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

-- Frozen Hell Knight progression; Frozenhell Guard
monster.attacks = {
	{name = "melee", interval = 1300, chance = 100, minDamage = -2350, maxDamage = -3100},
	{name = "combat", interval = 2500, chance = 80, type = COMBAT_PHYSICALDAMAGE, minDamage = -2550, maxDamage = -3300, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ARROW, effect = CONST_ME_STUN},
	{name = "combat", interval = 4000, chance = 75, type = COMBAT_ICEDAMAGE, minDamage = -2300, maxDamage = -2900, range = 7, radius = 2, target = true, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEATTACK}
}

monster.defenses = {
	defense = 32,
	armor = 45,
	{name = "combat", interval = 3000, chance = 25, type = COMBAT_HEALING, minDamage = 650, maxDamage = 1000, effect = 567}
}

-- Nephy resale and ultra-rare Yalahari; Eventshop remains the primary option.
monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 12},
	{name = "platinum coin", chance = 100000, maxCount = 55},
	{name = "experience scroll", chance = 4000},
	{name = "silver token", chance = 400},
	{name = "magic plate armor", chance = 900},
	{name = "mastermind shield", chance = 950},
	{name = "golden legs", chance = 800},
	{name = "small diamond", chance = 50000, maxCount = 6},
	{name = "violet gem", chance = 2800},
	{name = "green gem", chance = 3800},
	{name = "blue gem", chance = 3000},
	{name = "iron ore", chance = 19000, maxCount = 4},
	{id = 8864, chance = 18}, -- Yalahari mask, 0.018%,
	{id = 8862, chance = 15}, -- Yalahari armor,
	{id = 8863, chance = 15}, -- Yalahari legs,
	{id = 23477, chance = 12}, -- Yalahari boots,
	{id = 3423, chance = 10} -- Yalahari shield
}

mType:register(monster)





