-- Frozen Hell Fishing: criatura normal (nivel 3000), combate individual orientativo 30-45 s.
local mType = Game.createMonsterType("Fishing Deepling Elite")
local monster = {}

monster.description = "a deepling elite"
monster.experience = 1400000000
monster.outfit = {
	lookType = 441,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 862
monster.Bestiary = {
	class = "Aquatic",
	race = BESTY_RACE_AQUATIC,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 1,
	Locations = "Fiehonja (Tanjis lair).",
}

monster.health = 68000
monster.maxHealth = 68000
monster.race = "blood"
monster.corpse = 13713
monster.speed = 165
monster.manaCost = 0

monster.faction = FACTION_DEEPLING
monster.enemyFactions = { FACTION_PLAYER, FACTION_DEATHLING }

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 30,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false,
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
	{ id = 3579, chance = 44000, maxCount = 4 },
	{ id = 3581, chance = 37200, maxCount = 4 },
	{ id = 7159, chance = 30000, maxCount = 2 },
	{ id = 7158, chance = 22400, maxCount = 2 },
	{ name = "fish fin", chance = 9000, maxCount = 2 },
	{ name = "deepling ridge", chance = 19200, maxCount = 2 },
	{ name = "platinum coin", chance = 56000, maxCount = 16 },
	{ name = "small diamond", chance = 6000 },
	{ name = "experience scroll", chance = 330 }
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1300, maxDamage = -2900, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -600, maxDamage = -1300, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = true },
}

monster.defenses = {
	defense = 45,
	armor = 45,
	mitigation = 1.37,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 650, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

