local mType = Game.createMonsterType("medusa")
local monster = {}

monster.name = "Medusa"
monster.description = "a medusa"
monster.experience = 7000000
monster.outfit = {
	lookType = 330,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 750000
monster.maxHealth = 750000
monster.runHealth = 275
monster.race = "blood"
monster.corpse = 9607
monster.speed = 400
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
	{text = "Are you tired or why are you moving thhat sslow", yell = false},
	{text = "There isss no chhhanccce of esscape", yell = false},
	{text = "You will ssuch a fine ssstatue!", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -800, maxDamage = -15000},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -5500, maxDamage = -6500, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -5500, maxDamage = -7500, range = 6, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -2000, maxDamage = -4000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_CARNIPHILA},
	{name ="paralyze", interval = 1000, chance = 30, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 1000, chance = 18, type = COMBAT_HEALING, minDamage = 200, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "helmet of ultimate terror", chance = 1500},
	{name = "orange backpack", chance = 500},
	{name = "crystal coin", chance = 100000, maxCount = 50},
	{name = "crystal coin", chance = 100000, maxCount = 50},
	{name = "assassin star", chance = 5},
	{name = "justice seeker", chance = 5},
	{name = "experience scroll", chance = 3000},
	{name = "deadly wand", chance = 5}
}

mType:register(monster)



