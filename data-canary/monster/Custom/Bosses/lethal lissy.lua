local mType = Game.createMonsterType("Lethal Lissy")
local monster = {}

monster.name = "Lethal Lissy"
monster.description = "Lethal Lissy"
monster.experience = 1000000
monster.outfit = {
	lookType = 155,
	lookHead = 77,
	lookBody = 0,
	lookLegs = 76,
	lookFeet = 132,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 200000
monster.maxHealth = 200000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6081
monster.speed = 240
monster.summonCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
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
	canPushCreatures = false,
	staticAttackChance = 50,
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -1500, maxDamage = -2500}
}

monster.defenses = {
	defense = 50,
	armor = 35,
	{name ="combat", interval = 6000, chance = 65, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 2500, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 4
monster.summons = {
	{name = "pirate cutthroat", chance = 50, interval = 2000, max = 4}
}

monster.loot = {
	{name = "lethal lissy's shirt", chance = 100000, unique = true},
	{name = "gold coin", chance = 100000, maxCount = 40},
	{name = "knight armor", chance = 1200},
	{name = "double axe", chance = 1500},
	{name = "plate armor", chance = 4000},
	{name = "small diamond", chance = 100000},
	{id = 3114, chance = 100000},
}

mType:register(monster)




