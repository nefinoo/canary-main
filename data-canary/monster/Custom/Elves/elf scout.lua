local mType = Game.createMonsterType("salazaari ranger")
local monster = {}

monster.name = "salazaari ranger"
monster.description = "a salazaari ranger"
monster.experience = 800000
monster.outfit = {
	lookType = 64,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7900
monster.maxHealth = 7900
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6012
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -160, maxDamage = -330 },
	{ name = "combat", interval = 4000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -220, maxDamage = -430, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_FIREAREA },
	{ name = "combat", interval = 6000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -410, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD }
}

monster.defenses = {
	defense = 20,
	armor = 16,
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
	{ name = "green gem", chance = 2500 },
	{ id = 5921, chance = 1200 }, -- heaven blossom
	{ id = 12413, chance = 12000 }, -- bag de addon
	-- Scroll de experiencia muy raro (ID 51670, compra NPC: 50000 gp)
	{ name = "experience scroll", chance = 105 },
	-- Plate Set
	{ name = "plate armor", chance = 1800 },
	{ name = "plate legs", chance = 1700 },
	{ name = "steel helmet", chance = 1900 },
	{ name = "bonelord shield", chance = 1700 },
	-- Knight Set
	{ name = "knight armor", chance = 1350 },
	{ name = "knight legs", chance = 1250 },
	{ name = "knight axe", chance = 1050 },
	{ name = "devil helmet", chance = 950 },
	{ name = "tower shield", chance = 850 },
	-- Crown Set: recompensa rara de la zona
	{ name = "crown armor", chance = 400 },
	{ name = "crown legs", chance = 380 },
	{ name = "crown helmet", chance = 470 },
	{ name = "crown shield", chance = 350 },
	-- Fire Sword, Fire Axe y Dragonbone Staff: armas raras
	{ name = "fire sword", chance = 900 },
	{ name = "fire axe", chance = 1100 },
	{ name = "dragonbone staff", chance = 850 },
	-- Objetos raros originales preservados
	{ id = 3399, chance = 250 },
	{ id = 8095, chance = 250 },
	{ id = 3408, chance = 250 },
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





