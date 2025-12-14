local mType = Game.createMonsterType("Morgaroth")
local monster = {}

monster.name = "Morgaroth"
monster.description = "Morgaroth"
monster.experience = 2000000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 94,
	lookLegs = 79,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1000000
monster.maxHealth = 1000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 30,
	chance = 20
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
	staticAttackChance = 98,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 2200,
	chance = 30,
	{text = "I AM MORGAROTH, LORD OF THE TRIANGLE... AND YOU ARE LOST!", yell = true},
	{text = "MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!", yell = true},
	{text = "THE TRIANGLE OF TERROR WILL RISE!", yell = true},
	{text = "ZATHROTH! LOOK AT THE DESTRUCTION I AM CAUSING IN YOUR NAME!", yell = true}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -3749, maxDamage = -4874},
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -3749, maxDamage = -4874, range = 7, radius = 7, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="melee", interval = 2000, chance = 100, minDamage = -3749, maxDamage = -4874},
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -3749, maxDamage = -4874, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 2500, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -3749, maxDamage = -4874, range = 7, radius = 5, target = false, effect = CONST_ME_MAGIC_GREEN},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -3749, maxDamage = -4874, range = 7, radius = 13, target = false, effect = CONST_ME_SOUND_RED},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -3749, maxDamage = -4874, radius = 14, target = false, effect = CONST_ME_LOSEENERGY},
	{name ="melee", interval = 3000, chance = 100, minDamage = -3749, maxDamage = -4874},
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 4000, chance = 80, speed = {min = 440, max = 440}, duration = 6000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 6
monster.summons = {
	{name = "demon", chance = 33, interval = 1000, max = 6}
}

monster.loot = {
	{name = "grey backpack", chance = 100000, child = {
			{name = "demon helmet", chance = 2000},
			{name = "demon armor", chance = 2000},
			{name = "demon legs", chance = 6000},
			{id = 3410, chance = 5600}
		}
	},
	{name = "crystal coin", chance = 100000, maxCount = 20},
	{id = 3046, chance = 50000},
	{name = "crown shield", chance = 500},
	{name = "vampire shield", chance = 5000},
	{name = "experience scroll", chance = 3000},
	{name = "Huge Chunk of Crude Iron", chance = 500},
	{name = "flask of warrior's sweat", chance = 1500},
	{name = "Damaged Steel Helmet", chance = 56000, unique = true },
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




