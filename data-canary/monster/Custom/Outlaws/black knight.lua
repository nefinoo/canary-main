local mType = Game.createMonsterType("black knight")
local monster = {}

monster.name = "black knight"
monster.description = "a black knight"
monster.experience = 1600
monster.outfit = {
	lookType = 131,
	lookHead = 95,
	lookBody = 95,
	lookLegs = 95,
	lookFeet = 95,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 1800
monster.maxHealth = 1800
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 450
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
	{text = "MINE!", yell = true},
	{text = "No prisoners!", yell = true},
	{text = "NO MERCY!", yell = true},
	{text = "By Bolg's Blood!", yell = false},
	{text = "You're no match for me!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 22},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 95},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = -16},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -65, maxDamage = -145, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR},
	{name ="melee", interval = 3000, chance = 15, minDamage = -80, maxDamage = -155}
}

monster.defenses = {
	defense = 30,
	armor = 25
}

monster.loot = {
	{name = "steel helmet", chance = 10000},
	{name = "battle hammer", chance = 7000},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "knight armor", chance = 800},
	{name = "dark armor", chance = 1428},
	{name = "dark helmet", chance = 6666},
	{name = "halberd", chance = 9000},
	{name = "spear", chance = 20000},
	{id = 2853, chance = 100000, child = {
			{name = "knight legs", chance = 1000},
			{name = "brown bread", chance = 20000, maxCount = 2},
			{name = "brass legs", chance = 13000},
			{id = 3369, chance = 2000},
			{name = "plate armor", chance = 2500},
			{name = "gold coin", chance = 100000, maxCount = 15},
			{id = 3003, chance = 20000},
			{name = "double axe", chance = 6666},
			{name = "two handed sword", chance = 2857},
			{name = "knight axe", chance = 1333},
			{name = "dragon lance", chance = 909},
			{name = "boots of haste", chance = 555},
			{name = "ruby necklace", chance = 800}
		}
	}
}

mType:register(monster)



