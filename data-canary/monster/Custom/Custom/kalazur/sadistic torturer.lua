local mType = Game.createMonsterType("sadistic torturer")
local monster = {}

monster.name = "sadistic torturer"
monster.description = "a sadistic torturer"
monster.experience = 2500000
monster.outfit = {
	lookType = 234,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1500000
monster.maxHealth = 1500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6327
monster.speed = 390
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 3000,
	chance = 30,
	{text = "You like it, don't you?", yell = false},
	{text = "IahaEhheAie!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 40},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = -17},
	{type = COMBAT_DEATHDAMAGE , percent = 35}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -5000, maxDamage = -15000},
	{name ="combat", interval = 1500, chance = 83, type = COMBAT_PHYSICALDAMAGE, minDamage = -6000, maxDamage = -6000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGKNIFE},
	{name ="combat", interval = 2000, chance = 33, type = COMBAT_PHYSICALDAMAGE, minDamage = -5000, maxDamage = -9000, length = 4, spread = 3, effect = CONST_ME_SOUND_PURPLE}
}

monster.defenses = {
	defense = 35,
	armor = 25,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 7500, maxDamage = 12500, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 8},
	{name = "ham", chance = 33333, maxCount = 5, description2 = "ham"},
	{name = "golden legs", chance = 2000, description2 = "golden legs"},
	{name = "battle shield", chance = 9999, description2 = "battle shield"},
	{name = "demonic essence", chance = 4555, maxCount = 3, description2 = "demonic essence"},
	{id = 3305, chance = 12000, description2 = "carpenter hammer"},
	{id = 3461, chance = 11000, description2 = "saw"},
	{name = "soul orb", chance = 5555, description2 = "soul orb"},
	{id = 5801, chance = 1800},
	{name = "cat's paw", chance = 1666, description2 = "cat's paw"},
}

mType:register(monster)




