local mType = Game.createMonsterType("salazaari ranger")
local monster = {}

monster.name = "salazaari ranger"
monster.description = "a salazaari ranger"
monster.experience = 4000000
monster.outfit = {
	lookType = 64,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7300
monster.maxHealth = 7300
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6012
monster.speed = 275
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
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 3,
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
	{text = "Evicor guide my arrow.", yell = false},
	{text = "Feel the sting of my arrows!", yell = false},
	{text = "Tha'shi Ab'Dendriel!", yell = false},
	{text = "Thy blood will quench the soil's thirst!", yell = false},
	{text = "Your existence will end here!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -90, maxDamage = -210 },
	{ name = "combat", interval = 4000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -165, maxDamage = -355, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_FIREAREA },
	{ name = "combat", interval = 6000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -175, maxDamage = -375, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD }
}

monster.defenses = {
	defense = 22,
	armor = 18,
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
	{ name = "green gem", chance = 2500 },
	{ id = 5921, chance = 1200 }, -- heaven blossom
	{ id = 12413, chance = 17500 }, -- bag de addon
	-- Scroll de experiencia muy raro (ID 51670, venta a NPC: 50000 gp)
	{ name = "experience scroll", chance = 210 },
	-- Set 1: Paladin (nivel 30)
	{ id = 3403, chance = 9510 },
	{ id = 3404, chance = 8000 },
	{ id = 3560, chance = 9050 },
	{ id = 9017, chance = 9860 },
	{ id = 3428, chance = 8240 },
	-- Set 2: Paladin (nivel 50)
	{ id = 3385, chance = 4870 },
	{ id = 3381, chance = 3650 },
	{ id = 3382, chance = 4230 },
	{ id = 21981, chance = 5220 },
	{ id = 3419, chance = 4000 },
	-- Set 3: Paladin (nivel 100)
	{ id = 10385, chance = 2550 },
	{ id = 10384, chance = 1740 },
	{ id = 10387, chance = 2090 },
	{ id = 10386, chance = 2780 },
	{ id = 14088, chance = 2090 },
	{ id = 3055, chance = 3403 }, -- Platinum Amulet
	-- Armas nivel 30
	{ id = 3347, chance = 5200 }, -- hunting spear
	-- Armas nivel 50
	{ id = 7378, chance = 4200 }, -- royal spear
	-- Armas nivel 100: drop muy raro
	{ id = 3287, chance = 120 }, -- throwing star
}


monster.raceId = 64
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Yalahar Foreigner Quarter, Shadowthorn, northwest of Ab'Dendriel, north and west of Mount Sternum, \z
		Hellgate, Maze of Lost Souls, near Knightwatch Tower in the Plains of Havoc. \z
		Two may also spawn when a Desperate White Deer or an Enraged White Deer is killed.",
}

mType:register(monster)





