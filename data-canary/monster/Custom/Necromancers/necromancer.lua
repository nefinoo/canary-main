local mType = Game.createMonsterType("undead mage")
local monster = {}

monster.name = "undead mage"
monster.description = "an undead mage"
monster.experience = 30650000
monster.outfit = {
	lookType = 9,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 11750
monster.maxHealth = 11750
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
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
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance =5,
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
	{text = "Taste the sweetness of death!", yell = false},
	{text = "Your corpse will be mine!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -650, maxDamage = -950, condition = {type = CONDITION_POISON, startDamage = 90, interval = 5000}},
	{name ="combat", interval = 2000, chance = 90, type = COMBAT_PHYSICALDAMAGE, minDamage = -550, maxDamage = -850, range = 1, radius = 1, target = true, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -650, maxDamage = -950, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 42, maxDamage = 68, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 1
monster.summons = {
	{name = "ghost", chance = 15, interval = 6000, max = 1},
	{name = "ghoul", chance = 10, interval = 7000, max = 1},
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 5},
	{name = "platinum coin", chance = 50000, maxCount = 10},
	{name = "experience scroll", chance = 950, maxCount = 2},
	{name = "golden legs", chance = 300},
    {name = "demon shield", chance = 500},
    {name = "gold ring", chance = 800},    
    {name = "giant sword", chance = 728},
	{name = "yellow gem", chance = 3500},
	{name = "green gem", chance = 2000},
}

mType:register(monster)





