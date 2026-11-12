local mType = Game.createMonsterType("Hydra")
local monster = {}

monster.name = "Hydra"
monster.description = "a hydra"
monster.experience = 25000
monster.outfit = {
	lookType = 121,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 121
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Northern Hydra Mountain in east Tiquanda, southern Hydra Mountain, Hydra Egg Quest in Tiquanda \z
	north-east of the Elephant Tusk Quest, Forbidden Lands hydra cave, Deeper Banuta, Talahu surface, \z
	Ferumbras Citadel, Yalahar Arena and Zoo Quarter, Yalahar Foreigner Quarter (Crystal Lake), Oramond Hydra/Bog Raider Cave.",
}


monster.health = 850
monster.maxHealth = 850
monster.runHealth = 110
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 40},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -25, maxDamage = -58},
	{name ="speed", interval = 1000, chance = 12, speed = {min = -350, max = -350}, duration = 7000, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -20, maxDamage = -65, length = 8, spread = 3, effect = CONST_ME_LOSEENERGY},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_EARTHDAMAGE, minDamage = -20, maxDamage = -52, length = 8, spread = 3, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 35,
	armor = 25,
	{name ="combat", interval = 4000, chance = 8, type = COMBAT_HEALING, minDamage = 25, maxDamage = 45, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{ name = "gold coin", chance = 85000, maxCount = 70 },
	{ name = "meat", chance = 35000, maxCount = 3 },
	{ name = "ham", chance = 45000, maxCount = 3 },
	{ name = "health potion", chance = 8000 },
	{ name = "mana potion", chance = 7000 },
	{ name = "strong health potion", chance = 2000 },
	{ name = "strong mana potion", chance = 1500 },
	{ name = "hydra head", chance = 4000 }, -- creature product: conserva el valor de NPC
	{ name = "hydra egg", chance = 500 }, -- loot especial conservado
	{ id = 12413, chance = 7500 }, -- bolsa de objetos aleatorios de addon
	-- Plate Set: raro en esta etapa (2.6% por pieza)
	{ name = "plate armor", chance = 2600 },
	{ name = "plate legs", chance = 2600 },
	{ name = "steel helmet", chance = 2600 },
	{ name = "bonelord shield", chance = 2600 },
	-- Knight Set: muy raro; piezas clasicas del set
	{ name = "knight armor", chance = 200 },
	{ name = "knight legs", chance = 200 },
	{ name = "knight axe", chance = 250 },
	{ name = "devil helmet", chance = 180 },
	{ name = "tower shield", chance = 130 },
	-- Armas para la progresion de axe, club y sword
	{ name = "barbarian axe", chance = 3200 },
	{ name = "clerical mace", chance = 2600 },
	{ name = "crimson sword", chance = 2600 },
	-- Botas de progresion por set
	{ id = 3079, chance = 130 }, -- Boots of Haste: Knight Set
}

mType:register(monster)




