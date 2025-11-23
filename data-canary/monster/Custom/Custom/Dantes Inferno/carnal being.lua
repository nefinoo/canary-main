local mType = Game.createMonsterType("carnal being")
local monster = {}

monster.name = "Carnal Being"
monster.description = "carnal being"
monster.experience = 450000
monster.outfit = {
	lookType = 294,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150000
monster.maxHealth = 150000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6324
monster.speed = 420
monster.summonCost = 0

monster.changeTarget = {
	interval = 5400,
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
	{text = "The winds of lust flow through me!", yell = true},
	{text = "Whooo!", yell = true}
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
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -2700, maxDamage = -5500, range = 2, radius = 1, target = true, shootEffect = CONST_ANI_ETHEREALSPEAR, effect = CONST_ME_ICETORNADO},
	{name ="combat", interval = 2000, chance = 95, type = COMBAT_LIFEDRAIN, minDamage = -1500, maxDamage = -2200, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 45,
	armor = 10
}

monster.loot = {
	{name = "burning heart", chance = 8}
}

mType:register(monster)



