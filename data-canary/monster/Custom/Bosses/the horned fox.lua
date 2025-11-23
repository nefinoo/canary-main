local mType = Game.createMonsterType("the horned fox")
local monster = {}

monster.name = "The Horned Fox"
monster.description = "the Horned Fox"
monster.experience = 200
monster.outfit = {
	lookType = 202,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 265
monster.maxHealth = 265
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5983
monster.speed = 210
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
	{text = "You will never get me!", yell = false},
	{text = "I'll be back!", yell = false},
	{text = "Catch me, if you can!", yell = false},
	{text = "Help me, boys!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, skill = 54, attack = 38},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -120, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BOLT},
	{name ="condition", interval = 1000, chance = 17, type = CONDITION_POISON, startDamage = 0, tick = 4000, minDamage = -50, maxDamage = -120, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BOLT}
}

monster.defenses = {
	defense = 16,
	armor = 17,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 25, maxDamage = 75, effect = CONST_ME_MAGIC_RED},
	{name ="invisible", interval = 1000, chance = 10, duration = 2000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 6
monster.summons = {
	{name = "minotaur archer", chance = 13, interval = 1000, max = 2},
	{name = "minotaur guard", chance = 13, interval = 1000, max = 2},
	{name = "minotaur mage", chance = 13, interval = 1000, max = 2}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 30},
	{name = "throwing knife", chance = 50000, maxCount = 2},
	{id = 3307, chance = 10000},
	{name = "plate shield", chance = 5000},
	{id = 3578, chance = 20000},
	{name = "plate legs", chance = 1818},
	{name = "broadsword", chance = 2857},
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "nose ring", chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "wand of cosmic energy", chance = 1333},
			{id = 3091, chance = 2000},
			{name = "meat", chance = 33333, maxCount = 2},
			{name = "dagger", chance = 6666},
			{id = 3369, chance = 1000},
			{name = "longsword", chance = 10000},
			{name = "green tunic", chance = 2500},
			{name = "brass legs", chance = 2857},
			{name = "plate armor", chance = 1818}
		}
	}
}

mType:register(monster)



