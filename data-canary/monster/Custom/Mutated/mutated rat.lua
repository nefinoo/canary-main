local mType = Game.createMonsterType("Infested Rat")
local monster = {}

monster.name = "Infested Rat"
monster.description = "an infested rat"
monster.experience = 575000
monster.outfit = {
	lookType = 305,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 105000
monster.maxHealth = 105000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 8957
monster.speed = 320
monster.summonCost = 0

monster.changeTarget = {
	interval = 320,
	chance = 8
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
	{text = "Fcccccchhhhhh", yell = false},
	{text = "Grrrrrrrrrrrrrr!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -4615, maxDamage = -6000, condition = {type = CONDITION_POISON, startDamage = 300, interval = 5000}},
	{name ="combat", interval = 1000, chance = 18, type = COMBAT_EARTHDAMAGE, minDamage = -4615, maxDamage = -6000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD},
	{name ="condition", interval = 3000, chance = 20, type = CONDITION_POISON, startDamage = 0, tick = 5000, minDamage = -4615, maxDamage = -6000, length = 8, spread = 0, effect = CONST_ME_SMALLPLANTS},
	{name ="speed", interval = 3000, chance = 10, speed = {min = -600, max = -600}, duration = 30000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -4615, maxDamage = -6000, range = 7, radius = 3, target = false, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 10},
	{id = 3673, chance = 50},
	{name = "experience scroll", chance = 2000},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




