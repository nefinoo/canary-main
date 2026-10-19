local mType = Game.createMonsterType("Shark")
local monster = {}

monster.description = "a shark"
monster.experience = 22500000
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

monster.health = 6700
monster.maxHealth = 6700
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
	{name = "gold coin", chance = 100000, maxCount = 90},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "platinum coin", chance = 64000, maxCount = 10},
	{name = "platinum coin", chance = 44000, maxCount = 12},
	{ id = 3578, chance = 55430, maxCount = 20}, -- fish
	{ name = "salmon", chance = 32430, maxCount = 10}, -- salmon
	{ name = "small sapphire", chance = 1090 },
	{ id = 281, chance = 390 }, -- giant shimmering pearl (green)
	{name = "experience scroll", chance = 3650},
	{ name = "fish fin", chance = 161 },
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, minDamage = -288, maxDamage = -500, effect = CONST_ME_DRAWBLOOD },
	{name ="combat", interval = 2000, chance = 34, type = COMBAT_ENERGYDAMAGE, minDamage = -250, maxDamage = -380, range = 7, radius = 4, target = true, shootEffect = 68, effect = 176},
	{name ="combat", interval = 3000, chance = 44, type = COMBAT_ENERGYDAMAGE, minDamage = -310, maxDamage = -500, length = 8, spread = 3, effect = 38},
	{name ="speed", interval = 6000, chance = 10, speed = {min = -600, max = -600}, duration = 20000, range = 5, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
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




