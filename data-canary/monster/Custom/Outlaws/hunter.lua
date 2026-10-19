local mType = Game.createMonsterType("hunter")
local monster = {}

monster.name = "hunter"
monster.description = "a hunter"
monster.experience = 650
monster.outfit = {
	lookType = 129,
	lookHead = 95,
	lookBody = 116,
	lookLegs = 121,
	lookFeet = 115,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1500
monster.maxHealth = 1500
monster.runHealth = 10
monster.race = "blood"
monster.corpse = 6081
monster.speed = 215
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
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
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
	{text = "Guess who we're hunting, haha!", yell = false},
	{text = "Guess who we are hunting!", yell = false},
	{text = "Bullseye!", yell = false},
	{text = "You'll make a nice trophy!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -20},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -50},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -50, maxDamage = -100, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ARROW}
}

monster.defenses = {
	defense = 10,
	armor = 8
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "brass armor", chance = 10000},
	{name = "leather helmet", chance = 10000},
	{name = "leather legs", chance = 10000},
	{name = "ham", chance = 20000, maxCount = 2},
	{name = "sniper gloves", chance = 100},
	{id = 5907, chance = 100},
	{name = "small ruby", chance = 3333, maxCount = 2},
	{name = "orange", chance = 6666, maxCount = 4},
	{name = "roll", chance = 6666, maxCount = 4},
	{name = "brass legs", chance = 3333},
	{name = "green tunic", chance = 2222},
	{name = "dragon necklace", chance = 2500},
}

mType:register(monster)




