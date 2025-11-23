local mType = Game.createMonsterType("poisonthrower")
local monster = {}

monster.name = "Poisonthrower"
monster.description = "a poisonthrower"
monster.experience = 0
monster.outfit = {
	lookTypeEx = 1560
}

monster.health = 9950
monster.maxHealth = 9950
monster.runHealth = 100
monster.race = "undead"
monster.corpse = 0
monster.speed = 0
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20
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
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	healthHidden = true,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 100},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 1, attack = 1},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -100, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 1,
	armor = 1
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20}
}

mType:register(monster)



