local mType = Game.createMonsterType("Frozen Giant")
local monster = {}

monster.name = "Frozen Giant"
monster.description = "a frozen giant"
monster.experience = 90000
monster.outfit = {
	lookType = 257,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 7330
monster.speed = 300
monster.summonCost = 0

monster.changeTarget = {
	interval = 300,
	chance = 5
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 50,
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
	chance = 5,
	{text = "Brore Smode!", yell = false},
	{text = "Forle Bramma!", yell = false},
	{text = "Hmm Humansoup", yell = false},
	{text = "Horre Sjan Flan!", yell = false},
	{text = "Joh Thun!", yell = false},
	{text = "Stand still ya tasy snack!", yell = false}
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
	{name ="melee", interval = 1000, chance = 100, skill = 100, attack = 100},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -1500, maxDamage = -2000, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA}
}

monster.defenses = {
	defense = 23,
	armor = 22
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 10},
	{name = "warlord sword", chance = 50},
	{name = "experience scroll", chance = 2000},
	{id = 9743, chance = 2500}
}

mType:register(monster)




