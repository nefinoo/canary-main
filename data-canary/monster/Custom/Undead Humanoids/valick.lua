local mType = Game.createMonsterType("valick")
local monster = {}

monster.name = "valick"
monster.description = "a valick"
monster.experience = 1500000
monster.outfit = {
	lookType = 68,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}
monster.raceId = 2636
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Check the teleport bitch.",
}

monster.health = 15500
monster.maxHealth = 15500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6006
monster.speed = 200
monster.summonCost = 0

monster.changeTarget = {
	interval = 400,
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
	chance = 100,
	{text = "BLOOD!", yell = true},
	{text = "I call you, my bats! Come!", yell = false},
	{text = "I smell warm blood.", yell = false},
	{text = "Let me kiss your neck.", yell = false}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -305, maxDamage = -630 },
	{ name = "combat", interval = 4000, chance = 22, type = COMBAT_PHYSICALDAMAGE, minDamage = -325, maxDamage = -755, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED },
	{ name = "speed", interval = 2000, chance = 8, speed = {min = -320, max = -320}, duration = 8000, radius = 6, target = false, effect = CONST_ME_MAGIC_RED },
	{ name = "combat", interval = 4000, chance = 28, type = COMBAT_PHYSICALDAMAGE, minDamage = -275, maxDamage = -685, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK }
}

monster.defenses = {
	defense = 30,
	armor = 36,
	{ name = "outfit", interval = 1500, chance = 60, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "bat" },
	{ name = "outfit", interval = 1500, chance = 50, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "vampire" },
	{ name = "speed", interval = 1500, chance = 25, speed = {min = 300, max = 300}, duration = 8000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED }
}

monster.loot = {
	-- Una sola tirada de moneda para equilibrar la economia
	{ name = "platinum coin", chance = 90000, maxCount = 5 },
	{ name = "ham", chance = 45000, maxCount = 3 },
	{ name = "health potion", chance = 12000 },
	{ name = "mana potion", chance = 12000 },
	{ name = "strong health potion", chance = 9000 },
	{ name = "strong mana potion", chance = 9000 },
	-- Gemas y materiales originales de addon
	{ name = "yellow gem", chance = 3500 },
	{ name = "green gem", chance = 2000 },
	{ name = "violet gem", chance = 500 },
	{ id = 5905, chance = 2000 }, -- vampire dust: material original
	{ id = 12413, chance = 15500 }, -- bag aleatoria de addon
	-- Bronze Experience Scroll (ID 51670): extremadamente raro
	{ name = "experience scroll", chance = 220 },
	-- Plate Set
	{ name = "plate armor", chance = 2600 },
	{ name = "plate legs", chance = 2500 },
	{ name = "steel helmet", chance = 2800 },
	{ name = "bonelord shield", chance = 2400 },
	-- Knight Set
	{ name = "knight armor", chance = 1800 },
	{ name = "knight legs", chance = 1700 },
	{ name = "knight axe", chance = 1450 },
	{ name = "devil helmet", chance = 1350 },
	{ name = "tower shield", chance = 1150 },
	-- Crown Set: recompensas raras de zona
	{ name = "crown armor", chance = 750 },
	{ name = "crown legs", chance = 730 },
	{ name = "crown helmet", chance = 900 },
	{ name = "crown shield", chance = 680 },
	{ id = 3055, chance = 5000 }, -- Platinum Amulet (Crown Set)
	-- Armas raras
	{ name = "fire sword", chance = 1900 },
	{ name = "fire axe", chance = 2200 },
	{ name = "dragonbone staff", chance = 1700 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1150 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 680 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





