local mType = Game.createMonsterType("ashmunrah")
local monster = {}

monster.name = "Ashmunrah"
monster.description = "a ashmunrah"
monster.experience = 3100
monster.outfit = {
	lookType = 87,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5000
monster.maxHealth = 5000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6031
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
	{text = "No mortal or undead will steal my secrets!", yell = false},
	{text = "Ahhhh all those long years.", yell = false}
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
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -17},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -600, condition = {type = CONDITION_POISON, startDamage = 55, interval = 4000}},
	{name ="combat", interval = 3000, chance = 7, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -700, range = 1, radius = 1, target = true},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 3000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = -120, maxDamage = -750, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_MORTAREA},
	{name ="speed", interval = 3000, chance = 25, speed = {min = -650, max = -650}, duration = 50000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -550, length = 8, spread = 3, effect = CONST_ME_YELLOW_RINGS}
}

monster.defenses = {
	defense = 30,
	armor = 25,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 1000, chance = 7, duration = 2000, effect = CONST_ME_MAGIC_BLUE},
	{name = "outfit", interval = 1000, chance = 3, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000, outfitMonster = "ancient scarab" },
}

monster.maxSummons = 4
monster.summons = {
	{name = "ancient scarab", chance = 100, interval = 1000, max = 2},
	{name = "green djinn", chance = 100, interval = 1000, max = 2}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "pharaoh sword", chance = 220},
	{name = "orb", chance = 2000},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 70},
			{name = "scythe", chance = 10000},
			{name = "candy cane", chance = 4000, maxCount = 5},
			{name = "scarab shield", chance = 900},
			{name = "phoenix shield", chance = 200},
			{name = "griffin shield", chance = 400},
			{name = "noble armor", chance = 300},
			{name = "white dress", chance = 100},
			{name = "wand of inferno", chance = 800},
			{name = "small ruby", chance = 4000, maxCount = 2},
			{name = "coconut", chance = 4000, maxCount = 4},
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "roll", chance = 4000, maxCount = 4}
		}
	}
}

mType:register(monster)



