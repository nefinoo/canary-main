local mType = Game.createMonsterType("Modified Gnarlhound")
local monster = {}

monster.description = "a modified gnarlhound"
monster.experience = 12000
monster.outfit = {
	lookType = 515,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 877
monster.Bestiary = {
	class = "Mammal",
	race = BESTY_RACE_MAMMAL,
	toKill = 25,
	FirstUnlock = 5,
	SecondUnlock = 10,
	CharmsPoints = 1,
	Stars = 0,
	Occurrence = 1,
	Locations = "South of Stonehome, deep under Telas's house.",
}

monster.health = 280
monster.maxHealth = 280
monster.race = "blood"
monster.corpse = 10333
monster.speed = 225
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 20,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
	isPreyExclusive = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Gnarllll!", yell = false },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -12, maxDamage = -54 },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 20 },
	{ name = "health potion", chance = 22000 },
	{ name = "mana potion", chance = 22000 },
	{ name = "ham", chance = 45000, maxCount = 2 },
	{ name = "steel helmet", chance = 1300 },
	{ name = "paladin armor", chance = 910 },
	{ name = "spellbook of enlightenment", chance = 1110 },
	{ name = "plate armor", chance = 1040 },
	{ id = 3295, chance = 1000 }, -- bright sword
	{ id = 7456, chance = 1000 }, -- noble axe
	{ id = 3333, chance = 1000 }, -- crystal mace
	{ id = 7378, chance = 1000 }, -- royal spear
	{ id = 3067, chance = 1000 }, -- hailstorm rod
	{ id = 3071, chance = 1000 }, -- wand of inferno
}

monster.defenses = {
	defense = 10,
	armor = 7,
	mitigation = 0.25,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
