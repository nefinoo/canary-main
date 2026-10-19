local mType = Game.createMonsterType("hell soldier")
local monster = {}

monster.name = "hell soldier"
monster.description = "a hell soldier"
monster.experience = 19650
monster.outfit = {
	lookType = 37,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15500
monster.maxHealth = 15500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5963
monster.speed = 230
monster.summonCost = 0

monster.changeTarget = {
	interval = 220,
	chance = 10
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
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
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1223, maxDamage = -1500},
	{name ="combat", interval = 2000, chance = 65, type = COMBAT_PHYSICALDAMAGE, minDamage = -1223, maxDamage = -1500, range = 1, radius = 1, target = true}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 5},
	{name = "platinum coin", chance = 50000, maxCount = 10},
	{id = 7366, chance = 50},
	{id = 7426, chance = 50 }, 
	{id = 7420, chance = 50 }, 
	{id = 3296, chance = 50},
	{id = 7437, chance = 50},
	{name = "magic sword", chance = 100},
	{ id = 3319, chance = 100 }, 
	{ id = 3309, chance = 100 }, 
	{id = 3341, chance = 100},
	{name = "throwing star", chance = 100},
	{name = "experience scroll", chance = 2000, maxCount = 2},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




