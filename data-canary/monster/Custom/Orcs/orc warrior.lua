local mType = Game.createMonsterType("orc warrior")
local monster = {}

monster.name = "orc warrior"
monster.description = "a orc warrior"
monster.experience = 50
monster.outfit = {
	lookType = 7,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 125
monster.maxHealth = 125
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 5979
monster.speed = 190
monster.summonCost = 360

monster.changeTarget = {
	interval = 190,
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
	canPushItems = false,
	canPushCreatures = false,
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
	{text = "Alk!", yell = false},
	{text = "Grow truk grrrr.", yell = false},
	{text = "Trak grrrr brik.", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -20, maxDamage = -30}
}

monster.defenses = {
	defense = 14,
	armor = 8
}

monster.loot = {
	{id = 2853, chance = 100000, child = {
			{id = 2875, chance = 20000},
			{name = "sabre", chance = 6666},
			{name = "machete", chance = 5000},
			{name = "studded club", chance = 5000},
			{name = "chain armor", chance = 5000}
		}
	},
	{name = "gold coin", chance = 100000, maxCount = 12},
	{name = "wooden shield", chance = 10000},
	{name = "copper shield", chance = 4000},
	{name = "meat", chance = 40000, maxCount = 2},
	{name = "worm", chance = 50000, maxCount = 10}
}

mType:register(monster)




