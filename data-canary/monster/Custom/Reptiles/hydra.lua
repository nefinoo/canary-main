local mType = Game.createMonsterType("hydra")
local monster = {}

monster.name = "Hydra"
monster.description = "a hydra"
monster.experience = 2100
monster.outfit = {
	lookType = 121,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 2350
monster.maxHealth = 2350
monster.runHealth = 300
monster.race = "blood"
monster.corpse = 6048
monster.speed = 260
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
	interval = 5000,
	chance = 10,
	{text = "FCHHHHH", yell = false},
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
	{type = COMBAT_PHYSICALDAMAGE, percent = -15},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 40},
	{type = COMBAT_HOLYDAMAGE , percent = 25},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 80, attack = 60},
	{name ="speed", interval = 1000, chance = 17, speed = {min = -600, max = -600}, duration = 15000, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_PHYSICALDAMAGE, minDamage = -150, maxDamage = -250, length = 8, spread = 3, effect = CONST_ME_LOSEENERGY},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -60, maxDamage = -300, length = 8, spread = 3, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 35,
	armor = 25,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 200, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 24000, maxCount = 90, description2 = "gold coin"},
	{name = "gold coin", chance = 24000, maxCount = 80, description2 = "gold coin"},
	{name = "gold coin", chance = 24000, maxCount = 80, description2 = "gold coin"},
	{name = "meat", chance = 37500, maxCount = 4, description2 = "meat"},
	{name = "ham", chance = 25000, maxCount = 4, description2 = "ham"},
	{name = "strong mana potion", chance = 200, description2 = "strong mana potion"},
	{name = "life crystal", chance = 500, description2 = "life crystal"},
	{name = "stone skin amulet", chance = 900, description2 = "stone skin amulet"},
	{name = "small sapphire", chance = 5000, description2 = "small sapphire"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{name = "hydra egg", chance = 600, description2 = "hydra egg"},
			{id = 3098, chance = 1050, description2 = "ring of healing"},
			{id = 3369, chance = 1000, description2 = "warrior helmet"},
			{name = "knight armor", chance = 1200, description2 = "knight armor"},
			{name = "medusa shield", chance = 200, description2 = "medusa shield"},
			{name = "royal helmet", chance = 200, description2 = "royal helmet"},
			{name = "boots of haste", chance = 120, description2 = "boots of haste"}
		}
	}
}

mType:register(monster)



