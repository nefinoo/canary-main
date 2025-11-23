local mType = Game.createMonsterType("grim reaper")
local monster = {}

monster.name = "Grim Reaper"
monster.description = "a grim reaper"
monster.experience = 4500
monster.outfit = {
	lookType = 300,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4100
monster.maxHealth = 4100
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 8955
monster.speed = 400
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
	interval = 5000,
	chance = 10,
	{text = "Death!", yell = true},
	{text = "Come a little closer!", yell = true},
	{text = "The end is near!", yell = true}
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
	{type = COMBAT_EARTHDAMAGE, percent = -20},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 130, attack = 135},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -350, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -600, length = 7, spread = 0, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -395, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -300, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 50,
	armor = 50,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 100, maxDamage = 195, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 40000, maxCount = 98, description2 = "gold coin"},
	{name = "gold coin", chance = 40000, maxCount = 100, description2 = "gold coin"},
	{name = "platinum coin", chance = 20000, maxCount = 4, description2 = "Platinum Coin"},
	{name = "small amethyst", chance = 10000, maxCount = 3, description2 = "small amethyst"},
	{id = 6558, chance = 7500, description2 = "concentrated demonic blood"},
	{name = "demonic essence", chance = 7500, description2 = "demonic essence"},
	{id = 6299, chance = 7500, description2 = "death ring"},
	{name = "white piece of cloth", chance = 12500, description2 = "white piece of cloth"},
	{name = "dark shield", chance = 25000, description2 = "dark shield"},
	{id = 2853, chance = 100000, child = {
			{name = "orichalcum pearl", chance = 40000, maxCount = 4, description2 = "orichalcum pearl"},
			{name = "skullcracker armor", chance = 1500, description2 = "skullcracker armor"},
			{name = "nightmare blade", chance = 3000, description2 = "nightmare blade"},
			{name = "strong mana potion", chance = 5000, description2 = "strong mana potion"},
			{name = "underworld rod", chance = 3333, description2 = "underworld rod"},
			{name = "ultimate health potion", chance = 3333, description2 = "ultimate health potion"}
		}
	}
}

mType:register(monster)



