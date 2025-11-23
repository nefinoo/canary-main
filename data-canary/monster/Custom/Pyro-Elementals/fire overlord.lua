local mType = Game.createMonsterType("fire overlord")
local monster = {}

monster.name = "Fire Overlord"
monster.description = "a fire overlord"
monster.experience = 2800
monster.outfit = {
	lookType = 243,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4000
monster.maxHealth = 4000
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 8964
monster.speed = 300
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 25},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 70, attack = 90, condition = {type = CONDITION_FIRE, startDamage = 0, interval = 9000}},
	{name ="firefield", interval = 2000, chance = 15, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -900, length = 1, spread = 3, effect = CONST_ME_FIREATTACK},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -350, radius = 4, target = true, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "platinum coin", chance = 8888, maxCount = 4},
	{name = "eternal flames", chance = 2200},
	{name = "lavos armor", chance = 900},
	{name = "magma coat", chance = 1210}
}

mType:register(monster)



