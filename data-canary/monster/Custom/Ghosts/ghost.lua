local mType = Game.createMonsterType("ghost")
local monster = {}

monster.name = "ghost"
monster.description = "a ghost"
monster.experience = 29000000
monster.outfit = {
	lookType = 48,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 9000
monster.maxHealth = 9000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5993
monster.speed = 160
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
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
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
	{text = "Huh!", yell = false},
	{text = "Shhhhhh", yell = false},
	{text = "Buuuuuh", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -195, maxDamage = -400 },
	{ name = "combat", interval = 3000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -85, maxDamage = -210, range = 1, radius = 1, target = true }
}

monster.defenses = {
	defense = 22,
	armor = 24
}

monster.loot = {

	-- Moneda y consumibles (nivel 450; 44 ghosts en el respawn)
	{ name = "platinum coin", chance = 75000, maxCount = 2 },
	{ name = "strong health potion", chance = 8000 },
	{ name = "strong mana potion", chance = 8000 },
	-- Knight Set: poco frecuente
	{ name = "knight armor", chance = 800 },
	{ name = "knight legs", chance = 750 },
	{ name = "knight axe", chance = 650 },
	{ name = "devil helmet", chance = 600 },
	{ name = "tower shield", chance = 550 },
	{ id = 3079, chance = 550 }, -- Boots of Haste
	-- Crown Set: muy raro
	{ name = "crown armor", chance = 250 },
	{ name = "crown legs", chance = 240 },
	{ name = "crown helmet", chance = 300 },
	{ name = "crown shield", chance = 220 },
	{ id = 10386, chance = 220 }, -- Zaoan Shoes
	{ id = 3055, chance = 3000 }, -- Platinum Amulet
	{ name = "white piece of cloth", chance = 5000 }, -- material original conservado
}

mType:register(monster)





