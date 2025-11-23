local mType = Game.createMonsterType("orc leader")
local monster = {}

monster.name = "orc leader"
monster.description = "a orc leader"
monster.experience = 270
monster.outfit = {
	lookType = 59,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 450
monster.maxHealth = 450
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6001
monster.speed = 230
monster.summonCost = 640

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
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
	{text = "Ulderek futgyr human!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 52, attack = 48},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -70, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGKNIFE}
}

monster.defenses = {
	defense = 30,
	armor = 20
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "gold coin", chance = 100000, maxCount = 30},
	{name = "throwing knife", chance = 50000, maxCount = 2},
	{id = 3307, chance = 10000},
	{name = "plate shield", chance = 5000},
	{id = 3578, chance = 20000},
	{name = "plate legs", chance = 1818},
	{name = "broadsword", chance = 2857},
	{name = "backpack", chance = 20000, child = {
			{name = "gold coin", chance = 2857}
		}
	},
	{id = 2853, chance = 100000, child = {
			{id = 3091, chance = 2000},
			{name = "royal spear", chance = 2000, maxCount = 2},
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



