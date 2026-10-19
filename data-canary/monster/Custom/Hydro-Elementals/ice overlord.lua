local mType = Game.createMonsterType("Ice God")
local monster = {}

monster.name = "Ice God"
monster.description = "an ice god"
monster.experience = 110000000
monster.outfit = {
	lookType = 11,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 65000
monster.maxHealth = 65000
monster.runHealth = 1
monster.race = "blood"
monster.corpse = 7344
monster.speed = 390
monster.summonCost = 0

monster.changeTarget = {
	interval = 390,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
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
	{name ="melee", interval = 1000, chance = 100, skill = 140, attack = 135},
	{name ="speed", interval = 2000, chance = 18, speed = {min = -800, max = -800}, duration = 5000, radius = 6, target = false, effect = CONST_ME_ICETORNADO},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -2000, maxDamage = -3000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_HEALING, minDamage = 500, maxDamage = 750, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 10},
	{id = 7426, chance = 50},
	{name = "experience scroll", chance = 2500},
--	{id = 9743, chance = 2500}
}

mType:register(monster)





