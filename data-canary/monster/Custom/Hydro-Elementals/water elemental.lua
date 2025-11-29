local mType = Game.createMonsterType("water elemental")
local monster = {}

monster.name = "water elemental"
monster.description = "a water elemental"
monster.experience = 12000
monster.outfit = {
	lookType = 286,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 12000
monster.maxHealth = 12000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 9582
monster.speed = 450
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 70},
	{type = COMBAT_ENERGYDAMAGE, percent = -25},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -380, maxDamage = -700, condition = { type = CONDITION_POISON, totalDamage = 1200, interval = 4000 } },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_DROWNDAMAGE, minDamage = -255, maxDamage = -340, range = 7, radius = 2, effect = CONST_ME_LOSEENERGY, target = true },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -250, maxDamage = -340, range = 7, shootEffect = CONST_ANI_SMALLICE, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 35, minDamage = -255, maxDamage = -550, radius = 5, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 22,
	armor = 20,
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 30, maxDamage = 50, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "experience scroll", chance = 2900},
	{id = 3578, chance = 45000, maxCount = 3},--fish
	{name = "salmon", chance = 30000, maxCount = 2},
	{name = "green perch", chance = 7500, maxCount = 2}
}

mType:register(monster)




