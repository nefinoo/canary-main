local mType = Game.createMonsterType("Deepling Elite")
local monster = {}

monster.description = "a deepling elite"
monster.experience = 2100000000
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

monster.health = 330000
monster.maxHealth = 330000
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
	{ name = "gold coin", chance = 100000, maxCount = 100 },
	{ name = "gold coin", chance = 100000, maxCount = 86 },
	{ name = "great health potion", chance = 25000 },
	{ name = "eye of a deepling", chance = 25000 },
	{ name = "deepling filet", chance = 25000 },
	{ name = "deepling warts", chance = 24400 },
	{ name = "great mana potion", chance = 24200 },
	{ name = "deeptags", chance = 20600 },
	{ name = "deepling ridge", chance = 19500 },
	{ name = "small emerald", chance = 6890, maxCount = 2 },
	{ id = 3052, chance = 5360 }, -- life ring
	{ name = "heavy trident", chance = 3680 },
	{ name = "fish fin", chance = 2300 },
	{ name = "warrior's shield", chance = 1534 },
	{ name = "warrior's axe", chance = 820 },
	{ name = "foxtail", chance = 15 },
	-- Frozen Hell: catch reward finances consumables and produces Super Foods.
	{name = "crystal coin", chance = 100000, maxCount = 14},
	{name = "salmon", chance = 100000, maxCount = 4},
	{id = 3581, chance = 65000, maxCount = 2}, -- shrimp
	{name = "rainbow trout", chance = 55000},
	{name = "green perch", chance = 55000}
}

-- Frozen Hell: high-value Fishing catch, adjusted for a solo Knight.
monster.attacks = {
	{name = "melee", interval = 2000, chance = 100, minDamage = -4400, maxDamage = -6000, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", interval = 3000, chance = 70, type = COMBAT_PHYSICALDAMAGE, minDamage = -3000, maxDamage = -4000, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = true}
}

monster.defenses = {
	defense = 45,
	armor = 45,
	mitigation = 1.37,
	{name = "combat", interval = 4000, chance = 30, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 3500, effect = CONST_ME_MAGIC_BLUE, target = false}
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

