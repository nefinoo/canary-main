local mType = Game.createMonsterType("santa's little helper")
local monster = {}

monster.name = "santa's little helper"
monster.description = "santa's little helper"
monster.experience = 5000000000
monster.outfit = {
	lookType = 296,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500000
monster.maxHealth = 500000
monster.runHealth = 5000
monster.race = "blood"
monster.corpse = 2940
monster.speed = 720
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
	illusionable = true,
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
	interval = 1500,
	chance = 10,
	{text = "Me slave him!", yell = false},
	{text = "Zig Zag! Gobo attack!", yell = false},
	{text = "Help! Santa!", yell = false},
	{text = "Bugga! Bugga!", yell = false},
	{text = "Me green, me mean!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -5000, maxDamage = -8000},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -1500, maxDamage = -2500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_REDSTAR}
}

monster.defenses = {
	defense = 8,
	armor = 6
}

monster.loot = {
	{name = "moon backpack", chance = 3000, child = {
			{name = "cookie", chance = 100000, maxCount = 75},
			{name = "flower wreath", chance = 100000},
			{name = "stone skin amulet", chance = 100000}
		}
	},
	{id = 9058, chance = 3000, maxCount = 5},
	{name = "crystal coin", chance = 100000, maxCount = 75},
	{name = "crystal coin", chance = 100000, maxCount = 50}
}

mType:register(monster)





