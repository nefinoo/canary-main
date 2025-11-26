local mType = Game.createMonsterType("Latrivan")
local monster = {}

monster.name = "Latrivan"
monster.description = "Latrivan"
monster.experience = 1000000
monster.outfit = {
	lookType = 12,
	lookHead = 120,
	lookBody = 128,
	lookLegs = 121,
	lookFeet = 111,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500000
monster.maxHealth = 500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 340
monster.summonCost = 0

monster.changeTarget = {
	interval = 20,
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
	{text = "I might reward you for killing my brother ~ with a swift dead!", yell = true}
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
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 400, attack = 400},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -1000, maxDamage = -2000, length = 7, spread = 0, effect = CONST_ME_EXPLOSIONHIT}
}

monster.defenses = {
	defense = 100,
	armor = 100
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 20},
	{id = 3046, chance = 50000},
	{name = "crown shield", chance = 500},
	{id = 3410, chance = 5000},
	{name = "vampire shield", chance = 5000},
	{name = "experience scroll", chance = 3000},
	{id = 9743, chance = 2500}
}

mType:register(monster)




