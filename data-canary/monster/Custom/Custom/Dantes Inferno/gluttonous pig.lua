local mType = Game.createMonsterType("gluttonous pig")
local monster = {}

monster.name = "Gluttonous Pig"
monster.description = "gluttonous pig"
monster.experience = 2000000
monster.outfit = {
	lookType = 60,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 190000
monster.maxHealth = 190000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6000
monster.speed = 420
monster.summonCost = 0

monster.changeTarget = {
	interval = 5420,
	chance = 75
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
	{text = "Ugh!  Garbage!", yell = true},
	{text = "Urgh!", yell = true}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -5000, maxDamage = -6500, range = 1, radius = 1, target = true, effect = CONST_ME_HITAREA}
}

monster.defenses = {
	defense = 45,
	armor = 10,
	{name ="combat", interval = 2000, chance = 80, type = COMBAT_ENERGYDAMAGE, minDamage = -3000, maxDamage = -3500, range = 2, radius = 1, target = true, effect = CONST_ME_YELLOW_RINGS}
}

monster.loot = {
	{name = "broken bottle", chance = 75},
	{name = "broken bottle", chance = 75},
	{name = "rotten meat", chance = 95},
	{id = 3115, chance = 90}
}

mType:register(monster)



