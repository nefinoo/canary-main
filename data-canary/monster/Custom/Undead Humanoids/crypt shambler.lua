local mType = Game.createMonsterType("deathwalker")
local monster = {}

monster.name = "deathwalker"
monster.description = "a deathwalker"
monster.experience = 15000
monster.outfit = {
	lookType = 100,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10200
monster.maxHealth = 10200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6029
monster.speed = 220
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
	{text = "Aaaaahhhh!", yell = false},
	{text = "Chhhhhhh!", yell = false},
	{text = "Hoooohhh!", yell = false},
	{text = "Uhhhhhhh!", yell = false}
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
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -807, maxDamage = -1049},
	{name ="combat", interval = 2000, chance = 75, type = COMBAT_FIREDAMAGE, minDamage = -807, maxDamage = -1049, range = 1, radius = 1, target = true}
}

monster.defenses = {
	defense = 10,
	armor = 15
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 5},
	{name = "magic sword", chance = 100},
	{name = "experience scroll", chance = 2500},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




