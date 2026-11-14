local mType = Game.createMonsterType("Young Sea Serpent")
local monster = {}

monster.description = "a young sea serpent"
monster.experience = 12000000
monster.outfit = {
	lookType = 317,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 439
monster.Bestiary = {
	class = "Reptile",
	race = BESTY_RACE_REPTILE,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Sea Serpent Area.",
}

monster.health = 1000
monster.maxHealth = 1000
monster.race = "blood"
monster.corpse = 8965
monster.speed = 240
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 400,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
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
	{ text = "HISSSS", yell = true },
	{ text = "CHHHRRRR", yell = true },
}

monster.loot = {
	{ name = "small sapphire", chance = 1900, maxCount = 2 },
	{ name = "gold coin", chance = 50000, maxCount = 100 },
	{ name = "gold coin", chance = 48000, maxCount = 74 },
	{ id = 3049, chance = 1000 }, -- stealth ring
	{ name = "life crystal", chance = 300 },
	{ name = "battle axe", chance = 8000 },
	{ name = "morning star", chance = 40000 },
	{ name = "battle hammer", chance = 5000 },
	{ name = "strong health potion", chance = 5000 },
	{ name = "strong mana potion", chance = 4000 },
	{ id = 8894, chance = 7940 }, -- heavily rusted armor
	{ id = 8895, chance = 7940 }, -- rusted armor
	{ name = "sea serpent scale", chance = 5000 },
}

monster.attacks = {
    -- 1. Physical melee hit
    {name = "combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -4000, range = 1, target = false},

    -- 2. Physical ranged attack with energy projectile
    {
		name = "combat", interval = 1000, chance = 100,
		type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -3000,
		range = 7, target = true,
		effect = CONST_ME_BLACKSPARK, shootEffect = CONST_ANI_ENERGY
	},

    -- 3. Energy condition attack (energy field type)
    {
        name = "condition", interval = 2000, chance = 75,
        type = CONDITION_ENERGY, minDamage = -2000, maxDamage = -5000,
        range = 1, length = 10, spread = 0, radius = 3, target = false,
        effect = CONST_ME_ENERGYHIT
    },

    -- 4. Physical wave or cone
    {
        name = "combat", interval = 1000, chance = 100,
        type = COMBAT_PHYSICALDAMAGE, minDamage = -4000, maxDamage = -5000,
        range = 1, length = 7, spread = 3,
        effect = CONST_ME_POFF, target = false
    }
}

-- ====== DEFENSES ======
monster.defenses = {
    defense = 31,
    armor = 30,
    {name = "combat", interval = 2000, chance = 65, type = COMBAT_HEALING, minDamage = 25000, maxDamage = 30000, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)




