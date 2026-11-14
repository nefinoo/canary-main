local mType = Game.createMonsterType("Nightstalker")
local monster = {}

monster.name = "Nightstalker"
monster.description = "a nightstalker"
monster.experience = 500000
monster.outfit = {
	lookType = 320,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 700
monster.maxHealth = 700
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 9915
monster.speed = 260
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
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
	interval = 5000,
	chance = 10,
	{text = "The sunlight is so depressing.", yell = true},
	{text = "Come with me, my child.", yell = true},
	{text = "I've been in the shadow under your bed last night.", yell = true},
	{text = "You never know what hides in the night.", yell = false},
	{text = "I remember your face - and I know where you sleep", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -25},
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -105},
	{name ="speed", interval = 3000, chance = 10, speed = {min = -600, max = -600}, duration = 30000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="divine missile", interval = 2000, chance = 24, minDamage = -90, maxDamage = -170}
}

monster.defenses = {
	defense = 55,
	armor = 50,
	{name ="speed", interval = 1000, chance = 15, speed = {min = 200, max = 200}, duration = 20000, effect = CONST_ME_MAGIC_RED},
	{name ="invisible", interval = 5000, chance = 20, duration = 5000, effect = CONST_ME_MAGIC_RED},
	{name = "outfit", interval = 1500, chance = 10, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "the count" },
	{name = "outfit", interval = 1500, chance = 10, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "grim reaper" },
	{name = "outfit", interval = 1500, chance = 10, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "tarantula" },
	{name = "outfit", interval = 1500, chance = 10, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "ferumbras" },
	{name = "outfit", interval = 1500, chance = 10, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "werewolf" },
	{name = "outfit", interval = 1500, chance = 20, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "nightstalker" },
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 65, description2 = "gps"},
	{name = "gold coin", chance = 100000, maxCount = 45, description2 = "gps"},
	{name = "shadow herb", chance = 10000, description2 = "shadow herb"},
	{name = "strong mana potion", chance = 900, description2 = "smp"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{id = 3007, chance = 1500, description2 = "crystal ring"},
			{name = "protection amulet", chance = 1500, description2 = "protection amulet"},
			{name = "platinum amulet", chance = 800, description2 = "platinum amulet"},
			{name = "spirit cloak", chance = 800, description2 = "spirit cloak"},
			{name = "haunted blade", chance = 500, description2 = "haunted blade"},
			{name = "chaos mace", chance = 400, description2 = "chaos mace"},
			{name = "crystal of balance", chance = 300, description2 = "crystal of balance"},
			{name = "boots of haste", chance = 200, description2 = "boh"}
		}
	}
}

mType:register(monster)





