local mType = Game.createMonsterType("deathwalker")
local monster = {}

monster.name = "deathwalker"
monster.description = "a deathwalker"
monster.experience = 15000000
monster.outfit = {
	lookType = 100,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10200
monster.maxHealth = 10200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6029
monster.speed = 220
monster.summonCost = 0

monster.changeTarget = {
	interval = 220,
	chance = 10
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = true,
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
	{text = "Aaaaahhhh!", yell = false},
	{text = "Chhhhhhh!", yell = false},
	{text = "Hoooohhh!", yell = false},
	{text = "Uhhhhhhh!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -907, maxDamage = -1149},
	{name ="combat", interval = 4000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -907, maxDamage = -1349, range = 1, radius = 1, target = true}
}

monster.defenses = {
	defense = 10,
	armor = 15
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 3},
	{name = "platinum coin", chance = 50000, maxCount = 8},
	{name = "experience scroll", chance = 850},
	{name = "golden legs", chance = 300},
    {name = "demon shield", chance = 500},
    {name = "gold ring", chance = 800},    
    {name = "giant sword", chance = 728},
	{name = "yellow gem", chance = 3500},
	{name = "green gem", chance = 2000},
	{id = 12413, chance = 12250},
	{id = 3399, chance = 300},
	{id = 8095, chance = 300},
	{id = 3408, chance = 750}, -- Frozen Hell: primary rare drop (Bonelord Helmet), 0.75%
}   	
mType:register(monster)


