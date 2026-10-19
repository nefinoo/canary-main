local mType = Game.createMonsterType("Tibia Bug")
local monster = {}

monster.name = "Tibia Bug"
monster.description = "a Tibia Bug"
monster.experience = 50
monster.outfit = {
	lookType = 45,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 270
monster.maxHealth = 270
monster.runHealth = 0
monster.race = "venom"
monster.corpse = 5990
monster.speed = 240
monster.summonCost = 250

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
	canPushItems = false,
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
	{text = "My father was a year 2k bug.", yell = false},
	{text = "Psst, I'll make you rich.", yell = false},
	{text = "You are bugged ... by me!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 43, attack = 20},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_ENERGYDAMAGE, minDamage = -5, maxDamage = -35, length = 4, spread = 0, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 15,
	armor = 10,
	{name ="invisible", interval = 1000, chance = 17, duration = 2000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 10
monster.summons = {
	{name = "tibia bug", chance = 15, interval = 1000, max = 10}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 11, description2 = "Gold Coin"},
	{id = 6570, chance = 5538, description2 = "Blue Surprise Bag"},
	{id = 6571, chance = 1538, description2 = "Red Surprise Bag"}
}

mType:register(monster)




