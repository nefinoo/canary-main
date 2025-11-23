local mType = Game.createMonsterType("mawnstur")
local monster = {}

monster.name = "mawnstur"
monster.description = "a mawnstur"
monster.experience = 2500000
monster.outfit = {
	lookType = 244,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1750000
monster.maxHealth = 1750000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6336
monster.speed = 450
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
	{text = "WAHHHH!", yell = false},
	{text = "RAAARRR!", yell = false},
	{text = "GRRRRRR!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 40},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = -15},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -10000, maxDamage = -14230},
	{name ="combat", interval = 1000, chance = 28, type = COMBAT_PHYSICALDAMAGE, minDamage = -2800, maxDamage = -9200, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="speed", interval = 1000, chance = 12, speed = {min = 480, max = 480}, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, description2 = "gold coin"},
	{name = "platinum coin", chance = 100000, description2 = "platinum coin"},
	{name = "meat", chance = 20000, maxCount = 8, description2 = "meat"},
	{name = "dragon ham", chance = 10000, maxCount = 3, description2 = "dragon ham"},
	{name = "dirty fur", chance = 10000, description2 = "dirty fur"},
	{id = 3113, chance = 5000, description2 = "broken pottery"},
	{name = "heavy mace", chance = 444, description2 = "heavy mace"},
	{id = 6558, chance = 2500, description2 = "concentrated demonic blood"},
	{id = 6558, chance = 2500, description2 = "concentrated demonic blood"},
	{name = "demonic essence", chance = 1429, description2 = "demonic essence"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{name = "soul orb", chance = 1333, description2 = "soul orb"},
			{name = "dragon hammer", chance = 1667, description2 = "dragon hammer"},
			{name = "golden armor", chance = 333, description2 = "golden armor"},
			{name = "golden legs", chance = 400, description2 = "golden legs"},
			{name = "spiked squelcher", chance = 600, description2 = "spiked squelcher"}
		}
	}
}

mType:register(monster)



