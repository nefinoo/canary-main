local mType = Game.createMonsterType("massive water elemental")
local monster = {}

monster.name = "massive water elemental"
monster.description = "a massive water elemental"
monster.experience = 25000
monster.outfit = {
	lookType = 11,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 25000
monster.maxHealth = 25000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 2016
monster.speed = 500
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
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 95},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, minDamage = -380, maxDamage = -800},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = -255, maxDamage = -640, range = 7, radius = 6, target = false, effect = CONST_ME_LOSEENERGY},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -220, maxDamage = -540, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -335, maxDamage = -750, range = 7, radius = 6, target = false, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 22,
	armor = 20,
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 30, maxDamage = 50, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
}

mType:register(monster)



