local mType = Game.createMonsterType("Satanic Minion")
local monster = {}

monster.name = "Satanic Minion"
monster.description = "a satanic minion"
monster.experience = 745
monster.outfit = {
	lookType = 283,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 800
monster.maxHealth = 800
monster.runHealth = 80
monster.race = "blood"
monster.corpse = 7969
monster.speed = 170
monster.summonCost = 0

monster.changeTarget = {
	interval = 5,
	chance = 30
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
	chance = 50,
	{text = "Fchu?", yell = false},
	{text = "Rooawwrr", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 60, attack = 40},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_ICEDAMAGE, minDamage = -50, maxDamage = -160, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -60, maxDamage = -120, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ICE}
}

monster.defenses = {
	defense = 38,
	armor = 25
}

monster.loot = {
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 25}
		}
	},
	{name = "gold coin", chance = 100000, maxCount = 26},
	{name = "dragon ham", chance = 5000},
	{name = "health potion", chance = 5000}
}

mType:register(monster)




