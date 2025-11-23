local mType = Game.createMonsterType("nightmare scion")
local monster = {}

monster.name = "Nightmare Scion"
monster.description = "a nightmare scion"
monster.experience = 1350
monster.outfit = {
	lookType = 321,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1400
monster.maxHealth = 1400
monster.runHealth = 300
monster.race = "blood"
monster.corpse = 9919
monster.speed = 340
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
	interval = 7500,
	chance = 20,
	{text = "Weeeheeheee!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 45},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 65, attack = 65},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -180, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -125, range = 2, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="speed", interval = 1000, chance = 19, speed = {min = 460, max = 460}, duration = 8000, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_HEALING, minDamage = 150, maxDamage = 230, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 70, description2 = "gps"},
	{name = "gold coin", chance = 100000, maxCount = 70, description2 = "gps"},
	{name = "platinum coin", chance = 25000, maxCount = 3, description2 = "platinum coin"},
	{name = "meat", chance = 20000, maxCount = 4, description2 = "meat"},
	{id = 6299, chance = 7300, description2 = "death ring"},
	{name = "ham", chance = 40000, maxCount = 2, description2 = "ham"},
	{id = 3115, chance = 37500, description2 = "bone"},
	{name = "bar of chocolate", chance = 1300, description2 = "bar of chocolate"},
	{name = "demonic essence", chance = 6500, description2 = "demonic essence"},
	{id = 2853, chance = 100000, child = {
			{name = "double axe", chance = 8800, description2 = "double axe"},
			{name = "crown helmet", chance = 3000, description2 = "crown helmet"},
			{name = "focus cape", chance = 3400, description2 = "focus cape"},
			{name = "shadow sceptre", chance = 1100, description2 = "shadow sceptre"}
		}
	}
}

mType:register(monster)



