local mType = Game.createMonsterType("Haunted Treeling")
local monster = {}

monster.name = "Haunted Treeling"
monster.description = "a haunted treeling"
monster.experience = 310000
monster.outfit = {
	lookType = 310,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 450
monster.maxHealth = 450
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 9867
monster.speed = 260
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
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
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150},
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_MANADRAIN, minDamage = -30, maxDamage = -90, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MAGIC_RED},
	{name ="speed", interval = 3000, chance = 20, speed = {min = -600, max = -600}, duration = 30000, length = 8, spread = 0, effect = CONST_ME_SMALLPLANTS},
	{name ="terra strike", interval = 2000, chance = 12},
	{name ="combat", interval = 1000, chance = 14, minDamage = 0, maxDamage = -90}
}

monster.defenses = {
	defense = 55,
	armor = 50
}

monster.loot = {
	{name = "white mushroom", chance = 50000, maxCount = 2, description2 = "white mushroom"},
	{id = 3136, chance = 50000, description2 = "wooden trash"},
	{name = "orange mushroom", chance = 50000, description2 = "orange mushroom"},
	{name = "gold coin", chance = 100000, maxCount = 89, description2 = "gps"},
	{id = 2853, chance = 100000, child = {
			{name = "red mushroom", chance = 10000, description2 = "red mushroom"},
			{name = "health potion", chance = 3000, description2 = "health potion"},
			{name = "strong health potion", chance = 1200, description2 = "strong health potion"},
			{name = "small sapphire", chance = 1500, description2 = "small emerald"},
			{id = 3097, chance = 800, description2 = "dwarven ring"},
			{name = "bullseye potion", chance = 300, description2 = "bullseye potion"},
			{name = "guardian shield", chance = 200, description2 = "guardian shield"}
		}
	}
}

mType:register(monster)





