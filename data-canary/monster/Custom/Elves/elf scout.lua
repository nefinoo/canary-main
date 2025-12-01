local mType = Game.createMonsterType("salazaari ranger")
local monster = {}

monster.name = "salazaari ranger"
monster.description = "a salazaari ranger"
monster.experience = 11500
monster.outfit = {
	lookType = 64,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8000
monster.maxHealth = 8000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6012
monster.speed = 280
monster.summonCost = 0

monster.changeTarget = {
	interval = 500,
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
	{text = "Evicor guide my arrow.", yell = false},
	{text = "Feel the sting of my arrows!", yell = false},
	{text = "Tha'shi Ab'Dendriel!", yell = false},
	{text = "Thy blood will quench the soil's thirst!", yell = false},
	{text = "Your existence will end here!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -670, maxDamage = -872 },
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -670, maxDamage = -872, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 80, type = COMBAT_ENERGYDAMAGE, minDamage = -670, maxDamage = -905, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 18,
	armor = 7,
	{name ="speed", interval = 4000, chance = 40, speed = {min = 0, max = 0}, duration = 0, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 5},
	{name = "throwing star", chance = 100},
	{name = "crown armor", chance = 2500},
	{name = "crown legs", chance = 2500},
	{name = "crown helmet", chance = 2500},
	{name = "experience scroll", chance = 2000},
	{ id = 5921, chance = 1130 }, -- heaven blossom
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




