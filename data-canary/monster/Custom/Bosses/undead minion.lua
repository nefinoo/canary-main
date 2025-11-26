local mType = Game.createMonsterType("Undead Minion")
local monster = {}

monster.name = "Undead Minion"
monster.description = "an Undead Minion"
monster.experience = 550
monster.outfit = {
	lookType = 37,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 850
monster.maxHealth = 850
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 5963
monster.speed = 230
monster.summonCost = 620

monster.changeTarget = {
	interval = 5000,
	chance = 1
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
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 80, attack = 55},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -160, radius = 4, target = false, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 40},
	{name = "blank rune", chance = 10000},
	{name = "battle hammer", chance = 5000},
	{name = "battle shield", chance = 1000},
	{id = 6570, chance = 5538},
	{id = 6571, chance = 1538},
	{name = "guardian shield", chance = 5000}
}

mType:register(monster)




