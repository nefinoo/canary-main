local mType = Game.createMonsterType("behemoth")
local monster = {}

monster.name = "behemoth"
monster.description = "a behemoth"
monster.experience = 2500
monster.outfit = {
	lookType = 55,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4000
monster.maxHealth = 4000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5999
monster.speed = 280
monster.summonCost = 0

monster.changeTarget = {
	interval = 280,
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
	{text = "Crush the intruders!", yell = true},
	{text = "Human flesh - delicious!", yell = false},
	{text = "You're so little!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -90, maxDamage = -430},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -185, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="speed", interval = 1000, chance = 7, speed = {min = 290, max = 290}, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{id = 2853, chance = 100000, child = {
			{name = "crystal necklace", chance = 300},
			{name = "gold coin", chance = 100000, maxCount = 40},
			{name = "strange talisman", chance = 3333},
			{name = "wand of decay", chance = 1000},
			{name = "crowbar", chance = 15000},
			{name = "plate armor", chance = 2000},
			{name = "dark armor", chance = 3000},
			{id = 3456, chance = 6000},
			{name = "steel boots", chance = 400},
			{name = "meat", chance = 40000, maxCount = 6},
			{name = "perfect behemoth fang", chance = 1200},
			{name = "behemoth claw", chance = 1500}
		}
	},
	{id = 2893, chance = 11000},
	{name = "gold coin", chance = 100000, maxCount = 70},
	{name = "small amethyst", chance = 4000, maxCount = 2},
	{name = "strange symbol", chance = 800},
	{name = "big bone", chance = 7000},
	{name = "two handed sword", chance = 4000},
	{name = "double axe", chance = 2000},
	{name = "giant sword", chance = 688},
	{name = "war axe", chance = 488},
	{name = "ham", chance = 10000, maxCount = 3},
	{name = "behemoth claw", chance = 400}
}

mType:register(monster)




