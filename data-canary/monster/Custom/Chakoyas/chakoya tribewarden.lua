local mType = Game.createMonsterType("chakoya tribewarden")
local monster = {}

monster.name = "Chakoya Tribewarden"
monster.description = "a Chakoya Tribewarden"
monster.experience = 40
monster.outfit = {
	lookType = 259,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 68
monster.maxHealth = 68
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 7320
monster.speed = 270
monster.summonCost = 305

monster.changeTarget = {
	interval = 60000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 50,
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
	interval = 2000,
	chance = 5,
	{text = "Quisavu tukavi!", yell = false},
	{text = "Si siyoqua jamjam!", yell = false},
	{text = "Achuq! jinuma!", yell = false},
	{text = "Si ji jusipa!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 30, attack = 30}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.loot = {
	{name = "gold coin", chance = 3333, maxCount = 10},
	{name = "ham", chance = 10000},
	{id = 3578, chance = 10000, maxCount = 3},
	{name = "bone shield", chance = 333},
	{name = "mace", chance = 3000},
	{name = "mammoth whopper", chance = 600}
}

mType:register(monster)



