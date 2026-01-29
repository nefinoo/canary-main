local mType = Game.createMonsterType("Shark")
local monster = {}

monster.description = "a shark"
monster.experience = 6700
monster.outfit = {
	lookType = 453,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 782
monster.Bestiary = {
	class = "Aquatic",
	race = BESTY_RACE_AQUATIC,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Fiehonja, Seacrest Grounds, Krailos Steppe underwater cave.",
}

monster.health = 4500
monster.maxHealth = 4500
monster.race = "blood"
monster.corpse = 13860
monster.speed = 145
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Rarr chomp chomp!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 50000, maxCount = 200 },
	{ name = "gold coin", chance = 41000, maxCount = 76 },
	{ id = 3578, chance = 25430, maxCount = 4 }, -- fish
	{ name = "salmon", chance = 2430, maxCount = 2 }, -- fish
	{ name = "small sapphire", chance = 1090 },
	{ id = 281, chance = 390 }, -- giant shimmering pearl (green)
	{name = "experience scroll", chance = 850},
	{ name = "fish fin", chance = 161 },
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, minDamage = -120, maxDamage = -180, effect = CONST_ME_DRAWBLOOD },
	{name ="combat", interval = 2000, chance = 34, type = COMBAT_ENERGYDAMAGE, minDamage = -250, maxDamage = -380, range = 7, radius = 4, target = true, shootEffect = 68, effect = 176},
	{name ="combat", interval = 3000, chance = 44, type = COMBAT_ENERGYDAMAGE, minDamage = -310, maxDamage = -500, length = 8, spread = 3, effect = 38}
}

monster.defenses = {
	defense = 15,
	armor = 32,
	mitigation = 0.43,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 55 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
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



