local mType = Game.createMonsterType("juggernaut")
local monster = {}

monster.name = "juggernaut"
monster.description = "a juggernaut"
monster.experience = 6500
monster.outfit = {
	lookType = 244,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 20000
monster.maxHealth = 20000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6336
monster.speed = 280
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
	{name ="melee", interval = 3000, chance = 100, minDamage = -200, maxDamage = -1423},
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -280, maxDamage = -620, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="speed", interval = 1000, chance = 12, speed = {min = 480, max = 480}, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000},
	{name = "platinum coin", chance = 100000},
	{name = "meat", chance = 20000, maxCount = 8},
	{name = "dragon ham", chance = 10000, maxCount = 3},
	{name = "dirty fur", chance = 10000},
	{id = 3113, chance = 5000},
	{name = "heavy mace", chance = 444},
	{id = 6558, chance = 2500},
	{id = 6558, chance = 2500},
	{name = "demonic essence", chance = 1429},
	{id = 2853, chance = 100000, child = {
			{name = "soul orb", chance = 1333},
			{name = "dragon hammer", chance = 1667},
			{name = "golden armor", chance = 333},
			{name = "golden legs", chance = 400},
			{name = "spiked squelcher", chance = 600}
		}
	}
}

mType:register(monster)




