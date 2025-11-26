local mType = Game.createMonsterType("necropharus")
local monster = {}

monster.name = "necropharus"
monster.description = "Necropharus"
monster.experience = 700
monster.outfit = {
	lookType = 209,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 750
monster.maxHealth = 750
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 240
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
	{text = "You will rise as my servant!", yell = false},
	{text = "Praise to my master Urgith!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 35, attack = 45, condition = {type = CONDITION_POISON, startDamage = 95, interval = 4000}},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -80, maxDamage = -120, range = 1, radius = 1, target = true, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -140, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 60, maxDamage = 90, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 4
monster.summons = {
	{name = "ghoul", chance = 20, interval = 1000, max = 2},
	{name = "ghost", chance = 17, interval = 1000, max = 1},
	{name = "mummy", chance = 15, interval = 1000, max = 1}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 40},
	{id = 2902, chance = 10000},
	{name = "horseman helmet", chance = 150},
	{name = "fire sword", chance = 220},
	{name = "shadow herb", chance = 20000, maxCount = 2},
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "soul stone", chance = 2500},
	{name = "moonlight rod", chance = 500},
	{id = 2853, chance = 100000, child = {
			{name = "scale armor", chance = 8500},
			{name = "green mushroom", chance = 22500},
			{name = "big bone", chance = 6000},
			{id = 3115, chance = 30000},
			{name = "bone club", chance = 19900},
			{name = "bone shield", chance = 7500},
			{name = "katana", chance = 10000},
			{id = 3114, chance = 20000, maxCount = 3},
			{name = "grave flower", chance = 20000},
			{name = "skull staff", chance = 833},
			{name = "mystic turban", chance = 909},
			{name = "boots of haste", chance = 666},
			{name = "clerical mace", chance = 5000}
		}
	}
}

mType:register(monster)




