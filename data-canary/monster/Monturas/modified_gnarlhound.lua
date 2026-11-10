local mType = Game.createMonsterType("Modified Gnarlhound")
local monster = {}

monster.description = "a modified gnarlhound"
monster.experience = 7000
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

monster.health = 450
monster.maxHealth = 450
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
	runHealth = 25,
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -6, maxDamage = -42 },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 65 },
	{ name = "ham", chance = 40000, maxCount = 2 },
	{ name = "health potion", chance = 2500 },
	{ name = "mana potion", chance = 2500 },
	{ id = 12413, chance = 2500 }, -- bolsa aleatoria de objetos de addon
	{ name = "plate armor", chance = 600 }, -- equipo muy raro
	{ name = "plate legs", chance = 600 }, -- equipo muy raro
	{ name = "steel helmet", chance = 600 }, -- equipo muy raro
	{ name = "bonelord shield", chance = 600 }, -- equipo muy raro
}

monster.defenses = {
	defense = 5,
	armor = 12,
	mitigation = 0.25,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 90 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 90 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 90 },
	{ type = COMBAT_HOLYDAMAGE, percent = 100 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
