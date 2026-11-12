local mType = Game.createMonsterType("salazaari windwalker")
local monster = {}

monster.name = "salazaari windwalker"
monster.description = "a salazaari windwalker"
monster.experience = 850000
monster.outfit = {
	lookType = 63,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8300
monster.maxHealth = 8300
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6011
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
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
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
	{text = "Feel my wrath!", yell = false},
	{text = "For the Daughter of the Stars!", yell = false},
	{text = "I'll bring balance upon you!", yell = false},
	{text = "Tha'shi Cenath!", yell = false},
	{text = "Vihil Ealuel!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -170, maxDamage = -320 },
	{ name = "combat", interval = 4000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -205, maxDamage = -430, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ARROW },
	{ name = "combat", interval = 6000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -220, maxDamage = -450, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH }
}

monster.defenses = {
	defense = 23,
	armor = 19,
	{ name = "combat", interval = 4000, chance = 20, type = COMBAT_HEALING, minDamage = 45, maxDamage = 90, effect = CONST_ME_MAGIC_BLUE },
	{ name = "speed", interval = 4000, chance = 20, speed = {min = 250, max = 250}, duration = 7000, effect = CONST_ME_MAGIC_RED }
}

monster.loot = {
	-- Moneda: una sola tirada para evitar duplicacion de platinum coins
	{ name = "platinum coin", chance = 85000, maxCount = 3 },
	{ name = "ham", chance = 35000, maxCount = 3 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 12000 },
	{ name = "strong health potion", chance = 6500 },
	{ name = "strong mana potion", chance = 6500 },
	-- Gemas y materiales de addon originales
	{ name = "violet gem", chance = 500 },
	{ name = "yellow gem", chance = 2000 },
	{ name = "holy orchid", chance = 2400 },
	{ id = 12413, chance = 12500 }, -- bag de addon
	-- Scroll de experiencia muy raro (ID 51670, compra NPC: 50000 gp)
	{ name = "experience scroll", chance = 145 },
	-- Plate Set
	{ name = "plate armor", chance = 1850 },
	{ name = "plate legs", chance = 1750 },
	{ name = "steel helmet", chance = 2000 },
	{ name = "bonelord shield", chance = 1750 },
	-- Knight Set
	{ name = "knight armor", chance = 1550 },
	{ name = "knight legs", chance = 1450 },
	{ name = "knight axe", chance = 1200 },
	{ name = "devil helmet", chance = 1100 },
	{ name = "tower shield", chance = 950 },
	-- Crown Set: recompensa rara de la zona
	{ name = "crown armor", chance = 560 },
	{ name = "crown legs", chance = 530 },
	{ name = "crown helmet", chance = 670 },
	{ name = "crown shield", chance = 490 },
	{ id = 3055, chance = 4500 }, -- Platinum Amulet (Crown Set)
	-- Fire Sword, Fire Axe y Dragonbone Staff: armas raras
	{ name = "fire sword", chance = 1200 },
	{ name = "fire axe", chance = 1300 },
	{ name = "dragonbone staff", chance = 1100 },
	-- Botas de progresion por set
	{ id = 3079, chance = 950 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 490 }, -- Zaoan Shoes: Crown Set
}

monster.raceId = 63
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Yalahar Foreigner Quarter, Demona, Shadowthorn, northwest of Ab'Dendriel, Maze of Lost Souls, \z
		Cyclopolis, Elvenbane, near Mount Sternum.",
}


mType:register(monster)





