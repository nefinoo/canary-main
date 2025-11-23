local mType = Game.createMonsterType("lost pirate")
local monster = {}

monster.name = "Lost Pirate"
monster.description = "lost pirate"
monster.experience = 2200000
monster.outfit = {
	lookType = 195,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 200000
monster.maxHealth = 200000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6070
monster.speed = 420
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 25
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
	{text = "~gargle~", yell = true},
	{text = "Oohh!", yell = true}
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
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -2500, maxDamage = -5000, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 45,
	armor = 10,
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 7000, maxDamage = 12000, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 25, speed = {min = 0, max = 0}, duration = 0, effect = CONST_ME_MAGIC_GREEN}
}

monster.loot = {
}

mType:register(monster)



