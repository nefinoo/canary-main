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

monster.health = 7200
monster.maxHealth = 7200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6003
monster.speed = 280
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -145, maxDamage = -290 },
	{ name = "combat", interval = 4000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -110, maxDamage = -300, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_BURSTARROW },
	{ name = "Berserk", interval = 6000, chance = 20, minDamage = -165, maxDamage = -330, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD }
}

monster.defenses = {
	defense = 27,
	armor = 21,
	{ name = "speed", interval = 4000, chance = 20, speed = {min = 250, max = 250}, duration = 7000, effect = CONST_ME_MAGIC_RED }
}

monster.loot = {
	-- Moneda: una sola tirada para evitar duplicacion de platinum coins
	{ name = "platinum coin", chance = 80000, maxCount = 3 },
	{ name = "ham", chance = 35000, maxCount = 3 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 12000 },
	{ name = "strong health potion", chance = 6500 },
	{ name = "strong mana potion", chance = 6500 },
	-- Gemas y materiales de addon originales
	{ id = 3039, chance = 2500 }, -- red gem
	{ id = 5921, chance = 1000 }, -- heaven blossom
	{ id = 12413, chance = 12000 }, -- bag de addon
	-- Scroll de experiencia muy raro (ID 51670, compra NPC: 50000 gp)
	{ name = "experience scroll", chance = 90 },
	-- Plate Set
	{ name = "plate armor", chance = 8900 },
	{ name = "plate legs", chance = 8544 },
	{ name = "steel helmet", chance = 9523 },
	{ name = "bonelord shield", chance = 8544 },
	-- Knight Set
	{ name = "knight armor", chance = 4100 },
	{ name = "knight legs", chance = 3854 },
	{ name = "knight axe", chance = 3198 },
	{ name = "devil helmet", chance = 2993 },
	{ name = "tower shield", chance = 2829 },
	-- Crown Set: recompensa rara de la zona
	{ name = "crown armor", chance = 550 },
	{ name = "crown legs", chance = 528 },
	{ name = "crown helmet", chance = 660 },
	{ name = "crown shield", chance = 495 },
	{ id = 3055, chance = 3300 }, -- Platinum Amulet (Crown Set)
	-- Fire Sword, Fire Axe y Dragonbone Staff: armas raras
	{ name = "fire sword", chance = 850 },
	{ name = "fire axe", chance = 1000 },
	{ name = "dragonbone staff", chance = 800 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1763 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 495 }, -- Zaoan Shoes: Crown Set
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





