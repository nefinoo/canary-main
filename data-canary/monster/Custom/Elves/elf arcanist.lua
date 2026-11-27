local mType = Game.createMonsterType("salazaari windwalker")
local monster = {}

monster.name = "salazaari windwalker"
monster.description = "a salazaari windwalker"
monster.experience = 4250000
monster.outfit = {
	lookType = 63,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7600
monster.maxHealth = 7600
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6011
monster.speed = 270
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
	targetDistance = 4,
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -85, maxDamage = -195 },
	{ name = "combat", interval = 4000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -140, maxDamage = -320, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ARROW },
	{ name = "combat", interval = 6000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -180, maxDamage = -380, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH }
}

monster.defenses = {
	defense = 24,
	armor = 20,
	{ name = "combat", interval = 4000, chance = 20, type = COMBAT_HEALING, minDamage = 45, maxDamage = 90, effect = CONST_ME_MAGIC_BLUE },
	{ name = "speed", interval = 4000, chance = 20, speed = {min = 100, max = 100}, duration = 5000, effect = CONST_ME_MAGIC_RED }
}

monster.loot = {
	-- Oro y consumibles: zona nivel 300+
	{ name = "platinum coin", chance = 90000, maxCount = 6 },
	{ name = "ham", chance = 35000, maxCount = 3 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 12000 },
	{ name = "strong health potion", chance = 9500 },
	{ name = "strong mana potion", chance = 9500 },
	{ name = "great health potion", chance = 4500 },
	{ name = "great mana potion", chance = 4500 },
	{ name = "great spirit potion", chance = 2500 },
	-- Gemas y materiales de addon originales
	{ name = "violet gem", chance = 500 },
	{ name = "yellow gem", chance = 2000 },
	{ name = "holy orchid", chance = 2400 },
	{ id = 12413, chance = 18500 }, -- bag de addon
	-- Scroll de experiencia muy raro (ID 51670, venta a NPC: 50000 gp)
	{ name = "experience scroll", chance = 230 },
	-- Set 1: Mage (nivel 30)
	{ id = 7458, chance = 10250 },
	{ id = 7463, chance = 8630 },
	{ id = 7464, chance = 9750 },
	{ id = 3550, chance = 10630 },
	{ id = 8072, chance = 8880 },
	-- Set 2: Mage (nivel 50)
	{ id = 7462, chance = 5250 },
	{ id = 22085, chance = 3940 },
	{ id = 22087, chance = 4560 },
	{ id = 3079, chance = 5630 },
	{ id = 8073, chance = 4310 },
	-- Set 3: Mage (nivel 100)
	{ id = 3573, chance = 2750 },
	{ id = 3567, chance = 1880 },
	{ id = 645, chance = 2250 },
	{ id = 32619, chance = 3000 },
	{ id = 8075, chance = 2250 },
	{ id = 3055, chance = 3500 }, -- Platinum Amulet
	-- Armas nivel 30
	{ id = 3065, chance = 5400 }, -- terra rod
	{ id = 3073, chance = 5400 }, -- wand of cosmic energy
	-- Armas nivel 50
	{ id = 3067, chance = 4400 }, -- hailstorm rod
	{ id = 3071, chance = 4400 }, -- wand of inferno
	-- Armas nivel 100: drop muy raro
	{ id = 3341, chance = 140 }, -- arcane staff
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





