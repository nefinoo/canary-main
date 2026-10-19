local mType = Game.createMonsterType("Cicno")
local monster = {}

monster.description = "a titan goddess of water"
monster.experience = 160000000000
monster.outfit = {
	lookType = 463,
	lookHead = 94,
	lookBody = 86,
	lookLegs = 79,
	lookFeet = 79,
	lookAddons = 3,
	lookMount = 0,
}

-- monster.bosstiary = {
	-- bossRaceId = 8007,
	-- bossRace = RARITY_NEMESIS,
-- }

monster.health = 15000000
monster.maxHealth = 15000000
monster.race = "blood"
monster.corpse = 111
monster.speed = 111
monster.manaCost = 695

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	rewardBoss = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Outis emoi g' onoma.", yell = false },
	{ text = "Whack da humy!", yell = false },
	{ text = "Ai humy phary ty kaynon", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 82920, maxCount = 70 },
	{ id = 3093, chance = 90 }, -- club ring
	{ name = "battle axe", chance = 5450 },
	{ name = "double axe", chance = 880 },
	{ name = "battle hammer", chance = 5200 },
	{ name = "heavy machete", chance = 2000 },
	{ name = "dark helmet", chance = 200 },
	{ name = "plate shield", chance = 2000 },
	{ name = "battle shield", chance = 6190 },
	{ name = "meat", chance = 49950 },
	{ id = 7398, chance = 140 }, -- cyclops trophy
	{ name = "spiked squelcher", chance = 150 },
	{ name = "strong health potion", chance = 390 },
	{ name = "cyclops toe", chance = 10280 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -32000, maxDamage = -35000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -17000, maxDamage = -27000, range = 7, shootEffect = CONST_ANI_WHIRLWINDCLUB, target = false },
	{ name = "drunk", interval = 2000, chance = 10, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_STUN, target = false, duration = 4000 },
	-- 🔵 Nuevo ataque 1: Explosión de Agua (daño en área)
	{ name = "combat", interval = 3000, chance = 25, type = COMBAT_ICEDAMAGE,
	  minDamage = -20000, maxDamage = -30000, radius = 4, target = false, effect = CONST_ME_ICETORNADO },

	-- 🌀 Nuevo ataque 2: Water Crush (golpe en línea)
	{ name = "combat", interval = 2500, chance = 20, type = COMBAT_PHYSICALDAMAGE,
	  minDamage = -18000, maxDamage = -28000, length = 7, spread = 0, effect = CONST_ME_WATERSPLASH },
}

monster.defenses = {
    defense = 82,
    armor = 86,
    mitigation = 1.58,
}

monster.elements = {
    { type = COMBAT_PHYSICALDAMAGE, percent = 10 },
    { type = COMBAT_ENERGYDAMAGE, percent = 20 },
    { type = COMBAT_EARTHDAMAGE, percent = -10 },
    { type = COMBAT_FIREDAMAGE, percent = 10 },
    { type = COMBAT_LIFEDRAIN, percent = 0 },
    { type = COMBAT_MANADRAIN, percent = 0 },
    { type = COMBAT_DROWNDAMAGE, percent = 10 },
    { type = COMBAT_ICEDAMAGE, percent = 15 },
    { type = COMBAT_HOLYDAMAGE, percent = 20 },
    { type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)




