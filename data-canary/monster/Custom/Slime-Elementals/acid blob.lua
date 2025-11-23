local mType = Game.createMonsterType("acid blob")
local monster = {}

monster.name = "Acid Blob"
monster.description = "an acid blob"
monster.experience = 250
monster.outfit = {
	lookType = 314,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 250
monster.maxHealth = 250
monster.runHealth = 0
monster.race = "venom"
monster.corpse = 9962
monster.speed = 210
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0
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
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 8},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -10, maxDamage = -22, radius = 4, target = false, effect = CONST_ME_HITBYPOISON},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_EARTHDAMAGE, minDamage = -49, maxDamage = -54, length = 5, spread = 0, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 10,
	armor = 10
}

monster.maxSummons = 2
monster.summons = {
	{name = "Acid Blob", chance = 8, interval = 4000, max = 2}
}

monster.loot = {
	{name = "glob of acid slime", chance = 28000, description2 = "glob of acid"}
}

mType:register(monster)



