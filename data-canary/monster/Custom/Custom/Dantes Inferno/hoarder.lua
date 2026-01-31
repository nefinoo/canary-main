local mType = Game.createMonsterType("Hoarder")
local monster = {}

monster.name = "Hoarder"
monster.description = "hoarder"
monster.experience = 1500000
monster.outfit = {
	lookType = 274,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 290000
monster.maxHealth = 290000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 276
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
	interval = 2200,
	chance = 50,
	{text = "Ahh! I will get you!", yell = true},
	{text = "Hehe.. all this money to myself..", yell = true}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 100, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -5500, maxDamage = -8000, range = 1, radius = 1, target = true, effect = CONST_ME_HITAREA},
	{name ="combat", interval = 85, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -3500, maxDamage = -4250, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 45,
	armor = 10
}

monster.loot = {
	{name = "gold coin", chance = 100, maxCount = 100},
	{name = "platinum coin", chance = 75, maxCount = 60},
	{name = "crystal coin", chance = 50, maxCount = 10}
}

mType:register(monster)




