local mType = Game.createMonsterType("deathpincer")
local monster = {}

monster.name = "deathpincer"
monster.description = "a deathpincer"
monster.experience = 90000
monster.outfit = {
	lookType = 79,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6021
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 400,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1153, maxDamage = -1500, condition = {type = CONDITION_POISON, startDamage = 100, interval = 5000}},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -1153, maxDamage = -1500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_FIREWORK_RED},
	{name ="speed", interval = 1000, chance = 13, speed = {min = -700, max = -700}, duration = 25000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_YELLOWENERGY},
	{name ="condition", interval = 3000, chance = 50, type = CONDITION_POISON, startDamage = 0, tick = 5000, minDamage = -1153, maxDamage = -1500, radius = 5, target = false, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="speed", interval = 1000, chance = 8, speed = {min = 350, max = 350}, duration = 9000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 10},
	{name = "warlord sword", chance = 50},
	{name = "experience scroll", chance = 2500},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




