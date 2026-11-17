-- Frozen Hell Fishing: criatura normal (nivel 2600), combate individual orientativo 30-45 s.
local mType = Game.createMonsterType("Fishing Deepling Spellsinger")
local monster = {}

monster.description = "a deepling spellsinger"
monster.experience = 1000000000
monster.outfit = {
	lookType = 443,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 772
monster.Bestiary = {
	class = "Aquatic",
	race = BESTY_RACE_AQUATIC,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Fiehonja.",
}

monster.health = 54000
monster.maxHealth = 54000
monster.race = "blood"
monster.corpse = 13771
monster.speed = 95
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
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 60,
	targetDistance = 1,
	runHealth = 60,
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
	{ text = "Jey Obu giotja!!", yell = false },
	{ text = "Mmmmmoooaaaaaahaaa!!", yell = false },
}

monster.loot = {
	{ id = 3579, chance = 42000, maxCount = 4 },
	{ id = 3581, chance = 35400, maxCount = 4 },
	{ id = 7159, chance = 28000, maxCount = 2 },
	{ id = 7158, chance = 20800, maxCount = 2 },
	{ name = "fish fin", chance = 9000, maxCount = 2 },
	{ name = "spellsinger's seal", chance = 18400, maxCount = 2 },
	{ name = "platinum coin", chance = 56000, maxCount = 12 },
	{ name = "small diamond", chance = 5000 },
	{ name = "experience scroll", chance = 270 }
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1050, maxDamage = -2400, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -720, length = 10, spread = 3, effect = CONST_ME_ICETORNADO, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DROWNDAMAGE, minDamage = -350, maxDamage = -800, radius = 4, effect = CONST_ME_BUBBLES, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -330, maxDamage = -770, range = 7, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -250, maxDamage = -550, range = 7, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "deepling spellsinger skill reducer", interval = 2000, chance = 5, range = 5, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 42,
	mitigation = 1.29,
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
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

