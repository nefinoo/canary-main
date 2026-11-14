local mType = Game.createMonsterType("dragon lord")
local monster = {}

monster.name = "dragon lord"
monster.description = "a dragon lord"
monster.experience = 450000
monster.outfit = {
	lookType = 39,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 39
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Ankrahmun Dragon Lairs, Banshee Quest final room (level 60+ to open the door), \z
	Deeper Cyclopolis past the Dragon Spawn (level 30+ to open the door), Draconia, Edron Dragon Lair, \z
	Fibula Dungeon (level 50+ to open the door), Maze of Lost Souls (level 30+ to open the door), \z
	Pits of Inferno Dragon Lair, Dragon Lord hole in Plains of Havoc, Carlin Dragon Lair, \z
	Thais Dragon Lair, Goroma Dragon Lairs, Hot Spot, Venore Dragon Lair, Arena and Zoo Quarter(Yalahar), \z
	beneath Fenrock, Darashia Dragon Lair, Razachai, Dragonblaze Peaks, Ferumbras Citadel, Fury Dungeon, \z
	Lower Spike, Krailos Steppe.",
}


monster.health = 1180
monster.maxHealth = 1180
monster.runHealth = 110
monster.race = "blood"
monster.corpse = 5984
monster.speed = 240
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
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "ZCHHHHH", yell = true},
	{text = "YOU WILL BURN!", yell = true}
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
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -32, maxDamage = -90},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -28, maxDamage = -88, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 9, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -30, maxDamage = -95, length = 8, spread = 3, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="combat", interval = 3000, chance = 10, type = COMBAT_HEALING, minDamage = 15, maxDamage = 35, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{ name = "experience scroll", chance = 45 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	-- Oro, comida y pociones de caceria (nivel 50)
	{ name = "gold coin", chance = 90000, maxCount = 75 },
	{ name = "dragon ham", chance = 50000, maxCount = 3 },
	{ name = "health potion", chance = 9000 },
	{ name = "mana potion", chance = 8000 },
	{ name = "strong health potion", chance = 3200 },
	{ name = "strong mana potion", chance = 3000 },
	-- Materiales originales de criatura y bag de addon
	{ name = "red dragon leather", chance = 5000 },
	{ name = "red dragon scale", chance = 5000 },
	{ id = 12413, chance = 10500 },
	-- Plate Set: frecuente comparado con Knight y Crown
	{ name = "plate armor", chance = 6300 },
	{ name = "plate legs", chance = 6048 },
	{ name = "steel helmet", chance = 6741 },
	{ name = "bonelord shield", chance = 6048 },
	-- Armas de la etapa
	{ name = "barbarian axe", chance = 7000 },
	{ name = "clerical mace", chance = 6500 },
	{ id = 7385, chance = 6500 },
	-- Knight Set: raro
	{ name = "knight armor", chance = 2250 },
	{ name = "knight legs", chance = 2115 },
	{ name = "knight axe", chance = 1755 },
	{ name = "devil helmet", chance = 1643 },
	{ name = "tower shield", chance = 1552 },
	-- Botas de progresion por set
	{ id = 3079, chance = 968 }, -- Boots of Haste: Knight Set
}

mType:register(monster)





