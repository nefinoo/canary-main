local mType = Game.createMonsterType("Assasin")
local monster = {}

monster.name = "Assasin"
monster.description = "an assassin"
monster.experience = 105
monster.outfit = {
	lookType = 129,
	lookHead = 95,
	lookBody = 95,
	lookLegs = 95,
	lookFeet = 95,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 175
monster.maxHealth = 175
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 224
monster.summonCost = 450

monster.changeTarget = {
	interval = 2000,
	chance = 5
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
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
	interval = 5000,
	chance = 10,
	{text = "Die!", yell = false},
	{text = "Feel the hand of death!", yell = false},
	{text = "You are on my deathlist!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -12},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 45, attack = 45},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_PHYSICALDAMAGE, minDamage = -28, maxDamage = -38, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGSTAR},
	{name ="drunk", interval = 1000, chance = 10, drunkenness = 25, duration = 10000, range = 6, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 40,
	armor = 17,
	{name ="speed", interval = 1000, chance = 9, speed = {min = 1201, max = 1201}, duration = 3000, effect = CONST_ME_MAGIC_RED},
	{name ="invisible", interval = 1000, chance = 9, duration = 2000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "battle shield", chance = 1500},
	{name = "combat knife", chance = 4000},
	{name = "gold coin", chance = 80000, maxCount = 40},
	{name = "gold coin", chance = 15000, maxCount = 10},
	{name = "horseman helmet", chance = 200},
	{name = "knife", chance = 10000},
	{name = "leopard armor", chance = 500},
	{name = "plate shield", chance = 2000},
	{name = "small diamond", chance = 200},
	{name = "steel helmet", chance = 3000},
	{id = 3673, chance = 1500, maxCount = 4},
	{name = "steel shield", chance = 1000},
	{id = 2920, chance = 30000, maxCount = 2}
}

mType:register(monster)




