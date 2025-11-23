local mType = Game.createMonsterType("vampire bride")
local monster = {}

monster.name = "Vampire Bride"
monster.description = "a vampire bride"
monster.experience = 1050
monster.outfit = {
	lookType = 312,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1200
monster.maxHealth = 1200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 9660
monster.speed = 220
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
	interval = 4000,
	chance = 100,
	{text = "Kneel before your Mistress!", yell = false},
	{text = "Dead is the new alive.", yell = false},
	{text = "Come, let me kiss you, darling. Oh wait, I meant kill.", yell = false},
	{text = "Enjoy the pain - I know you love it.", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -200},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -150, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 8, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -150, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -170, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY}
}

monster.defenses = {
	defense = 23,
	armor = 17
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 84, description2 = "gps"},
	{name = "strong health potion", chance = 8000, description2 = "strong health potion"},
	{name = "strong mana potion", chance = 8000, description2 = "strong mana potion"},
	{name = "small diamond", chance = 6000, description2 = "small diamond"},
	{id = 3063, chance = 5000, description2 = "esmerald blange"},
	{id = 2853, chance = 100000, child = {
			{name = "moonlight rod", chance = 2000, description2 = "moonlight rod"},
			{id = 8923, chance = 2000, description2 = "velvet tapestry"},
			{id = 5670, chance = 1200, description2 = "voodo skull"},
			{id = 9808, chance = 1200, description2 = "rusty armor"},
			{name = "boots of haste", chance = 300, description2 = "boots of haste"}
		}
	}
}

mType:register(monster)



