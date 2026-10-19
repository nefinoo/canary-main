local mType = Game.createMonsterType("Cerebrus")
local monster = {}

monster.name = "Cerebrus"
monster.description = "Cerebrus"
monster.experience = 750000
monster.outfit = {
	lookType = 240,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 300000
monster.maxHealth = 300000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6332
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
	{text = "Gahaha!!", yell = true},
	{text = "Mmmm...", yell = true}
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
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -6500, maxDamage = -10000, range = 10, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 45,
	armor = 10,
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.loot = {
	{name = "meat", chance = 50, maxCount = 15},
	{id = 3578, chance = 50, maxCount = 20},
	{name = "ham", chance = 50, maxCount = 22}
}

mType:register(monster)




