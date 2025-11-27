local mType = Game.createMonsterType("giant spider")
local monster = {}

monster.name = "giant spider"
monster.description = "a giant spider"
monster.experience = 900
monster.outfit = {
	lookType = 38,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1300
monster.maxHealth = 1300
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5977
monster.speed = 280
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 6},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -80, maxDamage = -220},
	{name ="poisonfield", interval = 1000, chance = 17, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="speed", interval = 1000, chance = 6, speed = {min = 310, max = 310}, duration = 20000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 2
monster.summons = {
	{name = "poison spider", chance = 30, interval = 1000, max = 2}
}

monster.loot = {
	-- {id = 3053, chance = 700},
	{name = "gold coin", chance = 100000, maxCount = 50},
	{name = "plate armor", chance = 4000},
	{name = "platinum amulet", chance = 400},
	{name = "iron helmet", chance = 20000},
	{id = 5879, chance = 5000},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 40},
			{name = "steel helmet", chance = 5000},
			{name = "knight armor", chance = 700},
			{name = "knight legs", chance = 500},
			{name = "brass legs", chance = 10000},
			-- {id = 3053, chance = 800}
		}
	}
}

mType:register(monster)




