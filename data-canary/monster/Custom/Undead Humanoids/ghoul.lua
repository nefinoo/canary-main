local mType = Game.createMonsterType("ghoul")
local monster = {}

monster.name = "ghoul"
monster.description = "a ghoul"
monster.experience = 6500000
monster.outfit = {
	lookType = 18,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 11500
monster.maxHealth = 11500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5976
monster.speed = 144
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -260, maxDamage = -560 },
	{ name = "combat", interval = 3000, chance = 22, type = COMBAT_LIFEDRAIN, minDamage = -125, maxDamage = -290, range = 1, radius = 1, target = true }
}

monster.defenses = {
	defense = 24,
	armor = 22,
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_HEALING, minDamage = 9, maxDamage = 15, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {

	-- Consumibles y progresion nivel 450 (64 ghouls en el respawn)
	{ name = "strong health potion", chance = 9000 },
	{ name = "strong mana potion", chance = 8500 },
	{ name = "mana potion", chance = 9500 },
	-- Knight Set
	{ name = "knight armor", chance = 1100 },
	{ name = "knight legs", chance = 1050 },
	{ name = "knight axe", chance = 850 },
	{ name = "devil helmet", chance = 800 },
	{ name = "tower shield", chance = 750 },
	{ id = 3079, chance = 750 }, -- Boots of Haste
	-- Crown Set: raro
	{ name = "crown armor", chance = 350 },
	{ name = "crown legs", chance = 330 },
	{ name = "crown helmet", chance = 420 },
	{ name = "crown shield", chance = 300 },
	{ id = 10386, chance = 300 }, -- Zaoan Shoes
	{ id = 3055, chance = 3500 }, -- Platinum Amulet
	{ name = "platinum coin", chance = 80000, maxCount = 2 },
	{ name = "brown piece of cloth", chance = 2500 }, -- material original conservado
}

mType:register(monster)





