local mType = Game.createMonsterType("dark magician")
local monster = {}

monster.name = "dark magician"
monster.description = "a dark magician"
monster.experience = 185
monster.outfit = {
	lookType = 133,
	lookHead = 116,
	lookBody = 95,
	lookLegs = 50,
	lookFeet = 132,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 325
monster.maxHealth = 325
monster.runHealth = 800
monster.race = "blood"
monster.corpse = 6080
monster.speed = 220
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 30
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
	{text = "Feel the power of my runes!", yell = false},
	{text = "Killing you is getting expensive!", yell = false},
	{text = "My secrets are mine alone!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 8},
	{type = COMBAT_EARTHDAMAGE, percent = 8},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 8},
	{type = COMBAT_HOLYDAMAGE , percent = 5},
	{type = COMBAT_DEATHDAMAGE , percent = -6}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -60, maxDamage = -120},
	{name ="combat", interval = 1000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -5, maxDamage = -38, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = 0, maxDamage = -27, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 20,
	armor = 15,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 60, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 5000, chance = 50, duration = 5000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "blank rune", chance = 1300},
	{name = "mana potion", chance = 1200},
	{id = 5934, chance = 1200},
	{name = "wand of decay", chance = 800}
}

mType:register(monster)




