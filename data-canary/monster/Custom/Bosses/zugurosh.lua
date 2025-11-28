local mType = Game.createMonsterType("Zugurosh")
local monster = {}

monster.name = "Zugurosh"
monster.description = "Zugurosh"
monster.experience = 2000000
monster.outfit = {
	lookType = 12,
	lookHead = 2,
	lookBody = 35,
	lookLegs = 57,
	lookFeet = 91,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1000000
monster.maxHealth = 1000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 340
monster.summonCost = 0

monster.changeTarget = {
	interval = 30,
	chance = 15
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 85,
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
	interval = 2200,
	chance = 30,
	{text = "I sense your strength fading!", yell = true},
	{text = "One little mistake and your all are mine!", yell = true},
	{text = "You will run out of resources soon enough!!", yell = true}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 500, attack = 500},
	{name ="combat", interval = 3000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -1500, maxDamage = -2000, radius = 4, target = true, effect = CONST_ME_EXPLOSIONHIT},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -3000, radius = 4, target = false, effect = CONST_ME_SMALLCLOUDS},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -2000, maxDamage = -5000, radius = 5, target = false, effect = CONST_ME_WATERSPLASH},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -500, length = 7, spread = 0, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 20000, effect = CONST_ME_MAGIC_GREEN}
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 20},
	{name = "demon helmet", chance = 10000},
	{name = "demon legs", chance = 10000},
	{name = "demon shield", chance = 10000},
	{id = 6529, chance = 500},
	{name = "justice seeker", chance = 5},
	{name = "experience scroll", chance = 3000},
	{name = "Huge Chunk of Crude Iron", chance = 250},
	{name = "flask of warrior's sweat", chance = 500},
	{name = "Damaged Steel Helmet", chance = 13000, unique = true },
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




