local mType = Game.createMonsterType("Kiraigori the Dark")
local monster = {}

monster.name = "Kiraigori the Dark"
monster.description = "kiraigori the dark"
monster.experience = 15000000
monster.outfit = {
	lookType = 133,
	lookHead = 116,
	lookBody = 95,
	lookLegs = 50,
	lookFeet = 132,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 5500000
monster.maxHealth = 5500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 500
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 100
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
	staticAttackChance = 85,
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
	interval = 2000,
	chance = 100,
	{text = "Blllaaa bla blaa", yell = true},
	{text = "Blllaaa bla blaa", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
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
	{name ="melee", interval = 1000, chance = 100, minDamage = -1000, maxDamage = -3000},
	{name ="combat", interval = 1000, chance = 80, type = COMBAT_ENERGYDAMAGE, minDamage = -1000, maxDamage = -1500, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA},
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -300, maxDamage = -1000, radius = 3, target = false, effect = CONST_ME_SMALLPLANTS}
}

monster.defenses = {
	defense = 50,
	armor = 6,
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, effect = CONST_ME_MAGIC_GREEN}
}

monster.loot = {
}

mType:register(monster)




