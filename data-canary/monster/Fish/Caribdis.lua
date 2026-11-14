local mType = Game.createMonsterType("Caribdis")
local monster = {}

monster.description = "a caribdis"
monster.experience = 300000000000
monster.outfit = {
	lookType = 593,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- monster.bosstiary = {
	-- bossRaceId = 8002,
	-- bossRace = RARITY_NEMESIS,
-- }

monster.health = 25000000
monster.maxHealth = 25000000
monster.race = "blood"
monster.corpse = 20163
monster.speed = 180
monster.manaCost = 0

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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	rewardBoss = true,
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
	{ name = "small emerald", chance = 11000, maxCount = 2 },
	{ name = "small amethyst", chance = 12000, maxCount = 3 },
	{ name = "platinum coin", chance = 100000, maxCount = 9 },
	{ name = "blue robe", chance = 1500 },
	{ name = "great mana potion", chance = 40000, maxCount = 2 },
	{ name = "ultimate health potion", chance = 18000 },
	{ name = "small topaz", chance = 16000, maxCount = 2 },
	{ name = "blue crystal shard", chance = 11000 },
	{ name = "blue crystal splinter", chance = 13000 },
	{ name = "cyan crystal fragment", chance = 18000 },
	{ name = "trapped bad dream monster", chance = 17000 },
	{ name = "bowl of terror sweat", chance = 14000 },
}

monster.attacks = {
	-- melee fuerte ya que es boss superior a Ryujin
	{ name = "melee", interval = 2000, chance = 100, minDamage = -9500, maxDamage = -13500 },

	-- poison wave
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 20,
	  minDamage = -20000, maxDamage = -26000, radius = 7, effect = CONST_ME_YELLOW_RINGS, target = false },

	-- manadrain mejorado
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_MANADRAIN,
	  minDamage = -16000, maxDamage = -25000, radius = 5, effect = CONST_ME_MAGIC_RED, target = false },

	-- skill reducer (no cambia)
	{ name = "feversleep skill reducer", interval = 2000, chance = 10, target = false },

	-- lifedrain
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_LIFEDRAIN,
	  minDamage = -15000, maxDamage = -20000, length = 6, spread = 3,
	  effect = CONST_ME_YELLOWENERGY, target = true },

	-- death explosion
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE,
	  minDamage = -16000, maxDamage = -23000, radius = 1,
	  shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 55,
	armor = 85,
	mitigation = 1.28,

	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING,
	  minDamage = 30000, maxDamage = 45000, effect = CONST_ME_MAGIC_BLUE, target = false },

	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_HITAREA },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 18 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 10 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 25 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 60 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)




