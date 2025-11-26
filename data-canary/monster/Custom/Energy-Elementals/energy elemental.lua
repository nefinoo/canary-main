local mType = Game.createMonsterType("energy elemental")
local monster = {}

monster.name = "energy elemental"
monster.description = "an energy elemental"
monster.experience = 450
monster.outfit = {
	lookType = 293,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500
monster.maxHealth = 500
monster.runHealth = 1
monster.race = "undead"
monster.corpse = 1495
monster.speed = 250
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 15
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
	canPushCreatures = false,
	staticAttackChance = 85,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 55, attack = 50, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -168, maxDamage = -220, range = 6, radius = 2, target = false, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_PURPLEENERGY},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_ENERGYDAMAGE, minDamage = 0, maxDamage = -130, range = 3, radius = 1, target = false, effect = CONST_ME_ENERGYHIT},
	{name ="condition", interval = 1000, chance = 15, type = CONDITION_ENERGY, startDamage = 0, tick = 10000, radius = 3, target = false, effect = false}
}

monster.defenses = {
	defense = 50,
	armor = 50,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 90, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "energy soil", chance = 1500, maxCount = 2},
	{name = "berserk potion", chance = 2100},
	{name = "small amethyst", chance = 4500, maxCount = 3},
	{name = "wand of starstorm", chance = 1000}
}

mType:register(monster)




