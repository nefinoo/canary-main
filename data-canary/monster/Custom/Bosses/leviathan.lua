local mType = Game.createMonsterType("leviathan")
local monster = {}

monster.name = "Leviathan"
monster.description = "a leviathan"
monster.experience = 5000
monster.outfit = {
	lookType = 275,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6000
monster.maxHealth = 6000
monster.runHealth = 600
monster.race = "blood"
monster.corpse = 8307
monster.speed = 758
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 50
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
	targetDistance = 0,
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
	interval = 3000,
	chance = 200,
	{text = "CHHHRRRR", yell = false},
	{text = "HISSSS", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 75, attack = 70},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_EARTHDAMAGE, minDamage = -130, maxDamage = -460, length = 9, spread = 3, effect = CONST_ME_BIGPLANTS},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -365, maxDamage = -491, length = 9, spread = 3, effect = CONST_ME_ICEAREA},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_DROWNDAMAGE, minDamage = -15, maxDamage = -20, radius = 4, target = true, effect = CONST_ME_LOSEENERGY}
}

monster.defenses = {
	defense = 30,
	armor = 20,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 40000, maxCount = 80, description2 = "gold coin"},
	{name = "platinum coin", chance = 40000, maxCount = 6, description2 = "platinum coin"},
	{name = "small sapphire", chance = 10000, maxCount = 3, description2 = "small saphire"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{name = "gold coin", chance = 40000, maxCount = 80, description2 = "gold coin"}
		}
	}
}

mType:register(monster)



