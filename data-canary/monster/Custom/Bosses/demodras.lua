local mType = Game.createMonsterType("Demodras")
local monster = {}

monster.name = "Demodras"
monster.description = "Demodras"
monster.experience = 4000
monster.outfit = {
	lookType = 204,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4500
monster.maxHealth = 4500
monster.runHealth = 300
monster.race = "blood"
monster.corpse = 5984
monster.speed = 230
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.bosstiary = {
	bossRaceId = 5001,
	bossRace = RARITY_NEMESIS,
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
	{text = "I WILL SET THE WORLD IN FIRE!", yell = true},
	{text = "I WILL PROTECT MY BROOD!", yell = true}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -160, maxDamage = -600},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -250, maxDamage = -350, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 10, range = 7, radius = 6, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -250, maxDamage = -550, length = 8, spread = 3, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 25,
	armor = 35,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 400, maxDamage = 700, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 2
monster.summons = {
	{name = "dragon", chance = 17, interval = 1000, max = 2}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "dragon ham", chance = 20000, maxCount = 2},
	{name = "golden mug", chance = 1818},
	{id = 2842, chance = 3333},
	{name = "broadsword", chance = 5000},
	{name = "royal helmet", chance = 588},
	{id = 3361, chance = 333},
	{name = "power bolt", chance = 2222, maxCount = 10},
	{id = 3449, chance = 2222, maxCount = 5},
	{name = "green mushroom", chance = 6666},
	{name = "worm", chance = 50000, maxCount = 10},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "small emerald", chance = 833, maxCount = 2},
			{name = "fire sword", chance = 1428},
			{name = "small sapphire", chance = 2222, maxCount = 2},
			{name = "tower shield", chance = 1333},
			{name = "red dragon leather", chance = 5000},
			{name = "red dragon scale", chance = 5000},
			{id = 5919, chance = 1000}
		}
	}
}

mType:register(monster)




