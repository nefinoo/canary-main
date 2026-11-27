local mType = Game.createMonsterType("rahemos")
local monster = {}

monster.name = "rahemos"
monster.description = "a rahemos"
monster.experience = 3100000
monster.outfit = {
	lookType = 87,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3700
monster.maxHealth = 3700
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
	{text = "It's a kind of magic.", yell = false},
	{text = "Abrah Kadabrah!", yell = false},
	{text = "Nothing hidden in my wrappings.", yell = false},
	{text = "It's not a trick, it's Rahemos.", yell = false},
	{text = "Meet my friend from hell.", yell = false},
	{text = "I will make you believe in magic.", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 92},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 94},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -750, condition = {type = CONDITION_POISON, startDamage = 65, interval = 4000}},
	{name ="combat", interval = 3000, chance = 7, type = COMBAT_LIFEDRAIN, minDamage = -75, maxDamage = -750, range = 1, radius = 1, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -60, maxDamage = -600, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -60, maxDamage = -600, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="speed", interval = 1000, chance = 12, speed = {min = -650, max = -650}, duration = 60000, radius = 6, target = false, effect = CONST_ME_POISONAREA},
	{name ="drunk", interval = 1000, chance = 8, drunkenness = 25, duration = 10000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA},
	{name = "outfit", interval = 1000, chance = 15, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 12000, outfitMonster = "pig" },
}

monster.defenses = {
	defense = 35,
	armor = 30,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE},
	{name = "outfit", interval = 1000, chance = 5, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 4000, outfitMonster = "demon" },
}

monster.maxSummons = 1
monster.summons = {
	{name = "demon", chance = 12, interval = 1000, max = 1}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "necrotic rod", chance = 833},
	{name = "orb", chance = 2000},
	{name = "daramian mace", chance = 1200},
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
			{name = "wand of cosmic energy", chance = 800},
			{name = "small ruby", chance = 4000, maxCount = 2},
			{name = "coconut", chance = 4000, maxCount = 4},
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "roll", chance = 4000, maxCount = 4}
		}
	}
}

mType:register(monster)





