local mType = Game.createMonsterType("barbaria")
local monster = {}

monster.name = "Barbaria"
monster.description = "barbaria"
monster.experience = 355
monster.outfit = {
	lookType = 264,
	lookHead = 78,
	lookBody = 116,
	lookLegs = 95,
	lookFeet = 121,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 555
monster.maxHealth = 555
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6081
monster.speed = 280
monster.summonCost = 0

monster.changeTarget = {
	interval = 60000,
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
	interval = 2000,
	chance = 5,
	{text = "To me, creatures of the wild!", yell = false},
	{text = "My instincts tell me about your cowardice.", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -20},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 60, attack = 20},
	{name ="combat", interval = 2000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -30, maxDamage = -80, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SNOWBALL},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -35, maxDamage = -70, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 10,
	armor = 10,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 1
monster.summons = {
	{name = "War Wolf", chance = 40, interval = 2000, max = 1}
}

monster.loot = {
	{name = "gold coin", chance = 48000, maxCount = 35, description2 = "gold coins"},
	{name = "chain armor", chance = 11000, description2 = "chain armor"},
	{name = "hunting spear", chance = 12500, description2 = "hunting spear"},
	{name = "fur bag", chance = 100000, description2 = "fur bag", child = {
			{id = 2920, chance = 25000, description2 = "torch"},
			{id = 2816, chance = 15000, description2 = "grey book"}
		}
	}
}

mType:register(monster)



