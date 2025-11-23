local mType = Game.createMonsterType("lavahole")
local monster = {}

monster.name = "Lavahole"
monster.description = "a lavahole"
monster.experience = 0
monster.outfit = {
	lookTypeEx = 389
}

monster.health = 100
monster.maxHealth = 100
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 0
monster.speed = 0
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
}

monster.flags = {
	attackable = false,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 100,
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
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -111, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 1,
	armor = 1
}

monster.loot = {
}

mType:register(monster)



