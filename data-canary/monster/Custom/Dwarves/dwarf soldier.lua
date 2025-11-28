local mType = Game.createMonsterType("outlawed ranger")
local monster = {}

monster.name = "outlawed ranger"
monster.description = "an outlawed ranger"
monster.experience = 24000
monster.outfit = {
	lookType = 71,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 22500
monster.maxHealth = 22500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6014
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
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
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
	{text = "Hail Durin!", yell = false}
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
	{name ="melee", interval = 1000, chance = 100, skill = 100, attack = 100},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -400, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BOLT},
	{name ="combat", interval = 1000, chance = 100, minDamage = -300, maxDamage = -600, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 20,
	armor = 9
}

monster.loot = {
	{name = "small ruby", chance = 100000, maxCount = 7},
	{name = "violet gem", chance = 25000},
	{name = "crystal coin", chance = 50000, maxCount = 3},
	{name = "throwing star", chance = 100},
	{name = "dragon lance", chance = 2500},
	{name = "golden armor", chance = 2500},
	{name = "magic plate armor", chance = 2500},
	{name = "demon shield", chance = 2500},
	{name = "experience scroll", chance = 2000},
	{ name = "iron ore", chance = 600 },
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




