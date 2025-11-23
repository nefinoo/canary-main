local mType = Game.createMonsterType("opportunist")
local monster = {}

monster.name = "Opportunist"
monster.description = "opportunist"
monster.experience = 325000
monster.outfit = {
	lookType = 128,
	lookHead = 79,
	lookBody = 94,
	lookLegs = 94,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 60000
monster.maxHealth = 60000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 3058
monster.speed = 420
monster.summonCost = 0

monster.changeTarget = {
	interval = 5420,
	chance = 10
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
	staticAttackChance = 1,
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
	interval = 2000,
	chance = 50,
	{text = "Ahh!! The hornets!!", yell = true},
	{text = "The maggots are tearing into my feet!", yell = true}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -2000, maxDamage = -3205, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS},
	{name ="combat", interval = 2000, chance = 95, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -1000, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 45,
	armor = 10
}

monster.loot = {
	{name = "worm", chance = 50, maxCount = 20}
}

mType:register(monster)



