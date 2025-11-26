local mType = Game.createMonsterType("general murius")
local monster = {}

monster.name = "general murius"
monster.description = "the general Murius"
monster.experience = 300
monster.outfit = {
	lookType = 202,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 550
monster.maxHealth = 550
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5983
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
	{text = "Feel the power of the Mooh'Tah!", yell = false},
	{text = "You will get what you deserve!", yell = false},
	{text = "For the king!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, skill = 70, attack = 55},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -120, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BOLT},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -80, radius = 3, target = false, effect = CONST_ME_HITAREA}
}

monster.defenses = {
	defense = 22,
	armor = 16,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 4
monster.summons = {
	{name = "minotaur archer", chance = 15, interval = 1000, max = 2},
	{name = "minotaur guard", chance = 12, interval = 1000, max = 2}
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
	{name = "backpack", chance = 2857, child = {
			{name = "gold coin", chance = 2857}
		}
	},
	{id = 2853, chance = 100000, child = {
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




