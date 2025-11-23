local mType = Game.createMonsterType("minotaur mage")
local monster = {}

monster.name = "minotaur mage"
monster.description = "a minotaur mage"
monster.experience = 150
monster.outfit = {
	lookType = 23,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 155
monster.maxHealth = 155
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5981
monster.speed = 170
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	targetDistance = 4,
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
	{text = "Learrn tha secrret uf deathhh!", yell = false},
	{text = "Kaplar!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 18, attack = 15},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_ENERGYDAMAGE, minDamage = -15, maxDamage = -45, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -35, maxDamage = -95, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="energyfield", interval = 1000, chance = 12, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY}
}

monster.defenses = {
	defense = 20,
	armor = 18
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 20},
	{id = 2920, chance = 10000},
	{name = "leather helmet", chance = 8000},
	{name = "leather legs", chance = 8000},
	{name = "minotaur leather", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "wand of cosmic energy", chance = 1333},
			{name = "combat knife", chance = 10000},
			{name = "carrot of doom", chance = 20000, maxCount = 5},
			{id = 3998, chance = 10000},
			{name = "heavy magic missile rune", chance = 2857},
			{name = "brass armor", chance = 4000},
			{name = "chain legs", chance = 4000},
			{name = "taurus mace", chance = 1000}
		}
	}
}

mType:register(monster)



