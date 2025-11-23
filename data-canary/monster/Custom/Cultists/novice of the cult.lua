local mType = Game.createMonsterType("novice of the cult")
local monster = {}

monster.name = "Novice Of The Cult"
monster.description = "a novice of the cult"
monster.experience = 100
monster.outfit = {
	lookType = 133,
	lookHead = 114,
	lookBody = 95,
	lookLegs = 114,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 285
monster.maxHealth = 285
monster.runHealth = 40
monster.race = "blood"
monster.corpse = 6080
monster.speed = 210
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
	pushable = true,
	canPushItems = true,
	canPushCreatures = false,
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
	{text = "Fear us!", yell = false},
	{text = "You will not tell anyone what you have seen.", yell = false},
	{text = "Your curiosity will be punished!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -15},
	{type = COMBAT_ENERGYDAMAGE, percent = -6},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 35, attack = 35},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_LIFEDRAIN, minDamage = -30, maxDamage = -40, range = 7, radius = 4, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_EARTHDAMAGE, minDamage = -30, maxDamage = -75, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 10,
	armor = 15,
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_HEALING, minDamage = 25, maxDamage = 49, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 3
monster.summons = {
	{name = "Chicken", chance = 100, interval = 2000, max = 3}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 20},
	{name = "scarf", chance = 2000},
	{name = "small diamond", chance = 5000, maxCount = 3},
	{name = "pirate voodoo doll", chance = 555},
	{id = 3097, chance = 1666},
	{name = "brass legs", chance = 6666},
	{name = "mace", chance = 18427},
	{id = 2853, chance = 100000, child = {
			{name = "garlic necklace", chance = 1818},
			{name = "wand of vortex", chance = 1538},
			{id = 6087, chance = 5000}
		}
	}
}

mType:register(monster)



