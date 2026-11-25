local mType = Game.createMonsterType("Hydra")
local monster = {}

monster.name = "Hydra"
monster.description = "a hydra"
monster.experience = 485000
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


monster.health = 1050
monster.maxHealth = 1050
monster.runHealth = 0
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -32, maxDamage = -112},
	{name ="speed", interval = 6000, chance = 15, speed = {min = -100, max = -100}, duration = 3000, range = 5, radius = 2, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -24, maxDamage = -65, length = 5, spread = 2, effect = CONST_ME_LOSEENERGY},
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_EARTHDAMAGE, minDamage = -25, maxDamage = -75, length = 5, spread = 2, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 24,
	armor = 15,
	{name ="combat", interval = 5000, chance = 15, type = COMBAT_HEALING, minDamage = 35, maxDamage = 60, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 28 },
	{ name = "health potion", chance = 30000 },
	{ name = "mana potion", chance = 30000 },
	{ name = "strong health potion", chance = 20000 },
	{ name = "strong mana potion", chance = 20000 },
	{ name = "meat", chance = 35000, maxCount = 3 },
	{ name = "ham", chance = 55000, maxCount = 3 },
	{ name = "hydra head", chance = 5000 },
	{ name = "hydra egg", chance = 800 },
	{ name = "steel helmet", chance = 3200 },
	{ name = "hat of the mad", chance = 3200 },
	{ name = "plate legs", chance = 3000 },
	{ name = "blue legs", chance = 2900 },
	{ name = "bonelord shield", chance = 2700 },
	{ name = "spellbook of enlightenment", chance = 2700 },
	{ name = "plate armor", chance = 2500 },
	{ name = "focus cape", chance = 2350 },
	{ name = "paladin armor", chance = 2200 },
	{ id = 3295, chance = 2600 }, -- bright sword
	{ id = 7456, chance = 2600 }, -- noble axe
	{ id = 3333, chance = 2600 }, -- crystal mace
	{ id = 7378, chance = 2600 }, -- royal spear
	{ id = 3067, chance = 2600 }, -- hailstorm rod
	{ id = 3071, chance = 2600 }, -- wand of inferno
}

mType:register(monster)




