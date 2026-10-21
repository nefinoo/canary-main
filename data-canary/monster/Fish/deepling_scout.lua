local mType = Game.createMonsterType("Deepling Scout")
local monster = {}

monster.description = "a deepling scout"
monster.experience = 850000000
monster.outfit = {
	lookType = 413,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 734
monster.Bestiary = {
	class = "Aquatic",
	race = BESTY_RACE_AQUATIC,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Fiehonja, Sunken Mines near Dwarf Mines.",
}

monster.health = 160000
monster.maxHealth = 160000
monster.race = "blood"
monster.corpse = 12684
monster.speed = 65
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
	runHealth = 50,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Njaaarh!!", yell = false },
	{ text = "Begjone, intrjuder!!", yell = false },
	{ text = "Djon't djare stjare injo the eyes of the djeep!", yell = false },
	{ text = "Ljeave this sjacred pljace while you cjan", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 75000, maxCount = 50 },
	{ id = 3052, chance = 2127 }, -- life ring
	{ name = "rusted armor", chance = 925 },
	{ name = "heavy trident", chance = 505 },
	{ name = "eye of a deepling", chance = 310 },
	{ name = "fish fin", chance = 310 },
	{ name = "small emerald", chance = 121 },
	{ name = "flask of rust remover", chance = 111 },
	{ name = "foxtail", chance = 10 },,
	-- Frozen Hell: catch reward finances consumables and produces Super Foods.
	{name = "crystal coin", chance = 100000, maxCount = 6},
	{name = "salmon", chance = 80000, maxCount = 2},
	{id = 3581, chance = 35000, maxCount = 2}, -- shrimp,
	{name = "rainbow trout", chance = 20000},
	{name = "green perch", chance = 18000}
}

-- Frozen Hell: high-value Fishing catch, adjusted for a solo Knight.
monster.attacks = {
	{name = "melee", interval = 2000, chance = 100, minDamage = -2400, maxDamage = -3200, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", interval = 3000, chance = 65, type = COMBAT_DROWNDAMAGE, minDamage = -2200, maxDamage = -3000, range = 7, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_LOSEENERGY, target = true}
}

monster.defenses = {
	defense = 10,
	armor = 7,
	mitigation = 0.56,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

