local mType = Game.createMonsterType("divine slimemaster")
local monster = {}

monster.name = "divine slimemaster"
monster.description = "a divine slimemaster"
monster.experience = 2500000
monster.outfit = {
	lookType = 299,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1300000
monster.maxHealth = 1300000
monster.runHealth = 1
monster.race = "venom"
monster.corpse = 8123
monster.speed = 370
monster.summonCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
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
	staticAttackChance = 15,
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
	{text = "Tchhh!", yell = false},
	{text = "Slurp!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = -25},
	{type = COMBAT_FIREDAMAGE, percent = -80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -5000, maxDamage = -8500},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -5000, maxDamage = -7400, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -6000, maxDamage = -7075, radius = 2, target = false, shootEffect = CONST_ANI_SMALLEARTH, effect = false}, -- effect = false para suprimir la alerta
	{name ="combat", interval = 3000, chance = 40, type = COMBAT_PARALYZEDAMAGE, minDamage = 0, maxDamage = 0, duration = 5000, effect = CONST_ME_MAGIC_RED} -- paralyze convertido a combat
}

monster.defenses = {
	defense = 15,
	armor = 10,
	{name ="combat", interval = 5000, chance = 60, type = COMBAT_HEALING, minDamage = 500, maxDamage = 8000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 121, description2 = "gold coin"},
	{name = "plate legs", chance = 5000, description2 = "plate legs"},
	{name = "belted cape", chance = 2000, description2 = "belted cape"},
	{name = "springsprout rod", chance = 5000, description2 = "springsprout rod"},
	{name = "great spirit potion", chance = 5000, description2 = "great spirit potion"},
	{name = "ultimate health potion", chance = 3000, description2 = "ultimate health potion"},
	{name = "hibiscus dress", chance = 2500, description2 = "hibiscus dress"},
	{name = "paladin armor", chance = 2800, description2 = "paladin armor"}
}

mType:register(monster)



