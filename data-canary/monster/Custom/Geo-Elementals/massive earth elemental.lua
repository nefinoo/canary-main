local mType = Game.createMonsterType("venom")
local monster = {}

monster.name = "venom"
monster.description = "a venom"
monster.experience = 902000000
monster.outfit = {
	lookType = 285,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 455
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Forbidden Lands, on top of a hill in the northern part of the Arena and Zoo Quarter, \z
		Lower Spike, Truffels Garden and Mushroom Gardens.",
}

monster.health = 330000
monster.maxHealth = 330000
monster.runHealth = 100
monster.race = "undead"
monster.corpse = 8105
monster.speed = 350
monster.summonCost = 0

monster.changeTarget = {
	interval = 350,
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
	canPushCreatures = false,
	staticAttackChance = 80,
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
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

-- Frozen Hell Knight progression; Venom
monster.attacks = {
	{name = "melee", interval = 1500, chance = 100, minDamage = -2650, maxDamage = -3500},
	{name = "combat", interval = 2800, chance = 80, type = COMBAT_LIFEDRAIN, minDamage = -3300, maxDamage = -4650, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_CARNIPHILA},
	{name = "combat", interval = 5000, chance = 80, type = COMBAT_EARTHDAMAGE, minDamage = -2100, maxDamage = -2850, radius = 3, target = false, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

-- Nephy resale and ultra-rare Yalahari; Eventshop remains the primary option.
monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 16},
	{name = "platinum coin", chance = 100000, maxCount = 80},
	{name = "experience scroll", chance = 5000, maxCount = 2},
	{name = "silver token", chance = 700},
	{name = "demonic essence", chance = 19000, maxCount = 4},
	{name = "small diamond", chance = 55000, maxCount = 7},
	{name = "violet gem", chance = 3200},
	{name = "green gem", chance = 4500},
	{name = "blue gem", chance = 3700},
	{name = "golden legs", chance = 1100},
	{name = "magic plate armor", chance = 1000},
	{name = "mastermind shield", chance = 1300},
	{name = "iron ore", chance = 25000, maxCount = 5},
	{id = 8864, chance = 35}, -- Yalahari mask, 0.035%,
	{id = 8862, chance = 30}, -- Yalahari armor,
	{id = 8863, chance = 30}, -- Yalahari legs,
	{id = 23477, chance = 30}, -- Yalahari boots,
	{id = 3423, chance = 20} -- Yalahari shield
}

mType:register(monster)





