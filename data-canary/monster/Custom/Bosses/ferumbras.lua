local mType = Game.createMonsterType("Ferumbras")
local monster = {}

monster.name = "Ferumbras"
monster.description = "Ferumbras"
monster.experience = 12000
monster.outfit = {
	lookType = 229,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 35000
monster.maxHealth = 35000
monster.runHealth = 2500
monster.race = "blood"
monster.corpse = 6078
monster.speed = 320
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
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 2,
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
	chance = 20,
	{text = "NOONE WILL STOP ME THIS TIME!", yell = true},
	{text = "THE POWER IS MINE!", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -350},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -300, maxDamage = -700, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -250, maxDamage = -550, radius = 6, target = false, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -400, radius = 6, target = false, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 2000, chance = 16, type = COMBAT_MANADRAIN, minDamage = -225, maxDamage = -375, radius = 6, target = false, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 21, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -450, radius = 6, target = false, effect = CONST_ME_POFF},
	{name ="condition", interval = 3000, chance = 20, type = CONDITION_FIRE, startDamage = 0, tick = 9000, minDamage = -200, maxDamage = -800, range = 7, radius = 7, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -250, length = 8, spread = 0, effect = CONST_ME_HITBYPOISON}
}

monster.defenses = {
	defense = 120,
	armor = 100,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 900, maxDamage = 1500, effect = CONST_ME_MAGIC_GREEN},
	{name ="speed", interval = 3000, chance = 30, speed = {min = 360, max = 360}, duration = 7000, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 4000, chance = 20, duration = 5000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 3
monster.summons = {
	{name = "demon", chance = 12, interval = 3000, max = 3}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "gold coin", chance = 100000, maxCount = 25},
	{name = "giant sword", chance = 16060},
	{name = "mastermind shield", chance = 12050},
	{name = "magic plate armor", chance = 7000},
	{id = 2853, chance = 100000, child = {
			{name = "coconut", chance = 20000, maxCount = 3},
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "talon", chance = 12000, maxCount = 4},
			{name = "ferumbras' hat", chance = 10000},
			{name = "small emerald", chance = 15000, maxCount = 3},
			{name = "platinum amulet", chance = 30000},
			{name = "great axe", chance = 6000}
		}
	}
}

mType:register(monster)




