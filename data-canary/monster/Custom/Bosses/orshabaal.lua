local mType = Game.createMonsterType("Orshabaal")
local monster = {}

monster.name = "Orshabaal"
monster.description = "Orshabaal"
monster.experience = 288000000
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


monster.health = 150000
monster.maxHealth = 150000
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

-- Frozen Hell Knight progression; Orshabaal
monster.attacks = {
	{name = "melee", interval = 1500, chance = 100, minDamage = -1650, maxDamage = -2300},
	{name = "combat", interval = 2500, chance = 70, type = COMBAT_PHYSICALDAMAGE, minDamage = -1700, maxDamage = -2350, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name = "combat", interval = 4000, chance = 50, type = COMBAT_FIREDAMAGE, minDamage = -1700, maxDamage = -2250, radius = 3, target = false, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 70,
	armor = 65,
	{name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 400, maxDamage = 700, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 1
monster.summons = {
	{name = "demon", chance = 12, interval = 8000, max = 1}
}

-- Nephy resale and ultra-rare Yalahari; Eventshop remains the primary option.
monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 7},
	{name = "platinum coin", chance = 100000, maxCount = 35},
	{name = "experience scroll", chance = 2400},
	{name = "demonic essence", chance = 12000, maxCount = 2},
	{name = "small diamond", chance = 40000, maxCount = 5},
	{name = "violet gem", chance = 2000},
	{name = "green gem", chance = 3500},
	{name = "magic plate armor", chance = 700},
	{name = "demon shield", chance = 1100},
	{name = "demonrage sword", chance = 450},
	{name = "blue robe", chance = 850},
	{name = "gold ring", chance = 1000},
	{id = 8864, chance = 8}, -- Yalahari mask, 0.008%,
	{id = 8863, chance = 7}, -- Yalahari legs, 0.007%,
	{id = 3423, chance = 5}, -- Yalahari shield, 0.005%
}

mType:register(monster)





