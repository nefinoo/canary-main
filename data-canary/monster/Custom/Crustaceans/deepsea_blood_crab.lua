local mType = Game.createMonsterType("Deepsea Blood Crab")
local monster = {}

monster.description = "a deepsea blood crab"
monster.experience = 16000
monster.outfit = {
	lookType = 200,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 437
monster.Bestiary = {
	class = "Aquatic",
	race = BESTY_RACE_AQUATIC,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Svargrond Sea Serpent Area, Drefia. There is also one under Rookgaard Academy, however it is unreachable.",
}

monster.health = 360
monster.maxHealth = 360
monster.race = "blood"
monster.corpse = 6075
monster.speed = 190
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	illusionable = true,
	canPushItems = false,
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
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 26 },
	{ name = "health potion", chance = 30000 },
	{ name = "mana potion", chance = 30000 },
	{ name = "fish", chance = 50000, maxCount = 2 },
	{ name = "bloody pincers", chance = 6980 },
	{ id = 3357, chance = 1120 },
	{ id = 3404, chance = 980 },
	{ id = 7463, chance = 1050 },
	{ name = "spellbook of enlightenment", chance = 1190 },
	{ id = 3295, chance = 1200 }, -- bright sword
	{ id = 7456, chance = 1200 }, -- noble axe
	{ id = 3333, chance = 1200 }, -- crystal mace
	{ id = 7378, chance = 1200 }, -- royal spear
	{ id = 3067, chance = 1200 }, -- hailstorm rod
	{ id = 3071, chance = 1200 }, -- wand of inferno
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -16, maxDamage = -65 },
}

monster.defenses = {
	defense = 15,
	armor = 10,
	mitigation = 0.25,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)

