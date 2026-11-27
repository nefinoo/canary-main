local mType = Game.createMonsterType("salazaari defender")
local monster = {}

monster.name = "salazaari defender"
monster.description = "a salazaari defender"
monster.experience = 3750000
monster.outfit = {
	lookType = 62,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7000
monster.maxHealth = 7000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6003
monster.speed = 285
monster.summonCost = 0

monster.changeTarget = {
	interval = 500,
	chance = 10
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
	canPushItems = false,
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
	{text = "Bahaha aka!", yell = false},
	{text = "Death to the defilers!", yell = false},
	{text = "Flee as long as you can.", yell = false},
	{text = "Ulathil beia Thratha!", yell = false},
	{text = "You are not welcome here.", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -170, maxDamage = -330 },
	{ name = "combat", interval = 4000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -145, maxDamage = -345, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BURSTARROW },
	{ name = "combat", interval = 6000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -180, maxDamage = -360, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD }
}

monster.defenses = {
	defense = 27,
	armor = 21,
	{ name = "speed", interval = 4000, chance = 20, speed = {min = 100, max = 100}, duration = 5000, effect = CONST_ME_MAGIC_RED }
}

monster.loot = {
	-- Oro y consumibles: zona nivel 300+
	{ name = "platinum coin", chance = 90000, maxCount = 5 },
	{ name = "ham", chance = 35000, maxCount = 3 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 12000 },
	{ name = "strong health potion", chance = 9500 },
	{ name = "strong mana potion", chance = 9500 },
	{ name = "great health potion", chance = 4500 },
	{ name = "great mana potion", chance = 4500 },
	{ name = "great spirit potion", chance = 2500 },
	-- Gemas y materiales de addon originales
	{ id = 3039, chance = 2500 }, -- red gem
	{ id = 5921, chance = 1000 }, -- heaven blossom
	{ id = 12413, chance = 16500 }, -- bag de addon
	-- Scroll de experiencia muy raro (ID 51670, venta a NPC: 50000 gp)
	{ name = "experience scroll", chance = 190 },
	-- Set 1: Knight (nivel 30)
	{ id = 3351, chance = 8860 },
	{ id = 3357, chance = 7450 },
	{ id = 3557, chance = 8420 },
	{ id = 3554, chance = 9180 },
	{ id = 3428, chance = 7670 },
	-- Set 2: Knight (nivel 50)
	{ id = 3396, chance = 4540 },
	{ id = 3397, chance = 3400 },
	{ id = 3398, chance = 3940 },
	{ id = 4033, chance = 4860 },
	{ id = 3419, chance = 3730 },
	-- Set 3: Knight (nivel 100)
	{ id = 875, chance = 2380 },
	{ id = 21167, chance = 1620 },
	{ id = 21168, chance = 1940 },
	{ id = 21169, chance = 2590 },
	{ id = 14088, chance = 1940 },
	-- Amuleto y armas anteriores (sin recompensas de quest)
	{ id = 3055, chance = 3300 }, -- Platinum Amulet
	{ name = "knight axe", chance = 3198 },
	{ name = "fire sword", chance = 850 },
	{ name = "fire axe", chance = 1000 },
	{ name = "dragonbone staff", chance = 800 },
}

monster.raceId = 62
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Yalahar Foreigner Quarter and Trade Quarter, Maze of Lost Souls, Orc Fort (unreachable), \z
		Hellgate, Shadowthorn, Ab'Dendriel elf caves, Elvenbane, north of Thais.",
}


mType:register(monster)





