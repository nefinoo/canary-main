local mType = Game.createMonsterType("outlawed assassin")
local monster = {}

monster.name = "outlawed assassin"
monster.description = "an outlawed assassin"
monster.experience = 1250000
monster.outfit = {
	lookType = 160,
	lookHead = 58,
	lookBody = 114,
	lookLegs = 0,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5000000
monster.maxHealth = 5000000
monster.runHealth = 150
monster.race = "blood"
monster.corpse = 6007
monster.speed = 450
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 10
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{text = "Dust to dust.", yell = false},
	{text = "Earth is the strongest element.", yell = false},
	{text = "Hail Durin!", yell = false}
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
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -5000, maxDamage = -15000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_REDSTAR},
	{name ="combat", interval = 1200, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -5000, maxDamage = -10000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGKNIFE},
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_MANADRAIN, minDamage = -25000, maxDamage = -50000, range = 7, radius = 1, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "golden bag", chance = 100000, child = {
			{name = "elven brooch", chance = 100000}
		}
	},
	{id = 9058, chance = 100000, maxCount = 5},
	{name = "assassin star", chance = 8000}
}

mType:register(monster)




