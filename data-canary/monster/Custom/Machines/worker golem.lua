local mType = Game.createMonsterType("worker golem")
local monster = {}

monster.name = "Worker Golem"
monster.description = "a worker golem"
monster.experience = 1250
monster.outfit = {
	lookType = 304,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1400
monster.maxHealth = 1400
monster.runHealth = 0
monster.race = "venom"
monster.corpse = 9801
monster.speed = 270
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
	interval = 2500,
	chance = 10,
	{text = "INTRUDER ALARM!", yell = false},
	{text = "klonk klonk klonk", yell = false},
	{text = "Rrrtttarrrttarrrtta", yell = false},
	{text = "Awaiting orders.", yell = false},
	{text = "Secret objective complete.", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 40},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 25},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -230},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -95, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_EXPLOSION}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 100, maxDamage = 220, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "nail", chance = 1500, maxCount = 5, description2 = "nails"},
	{name = "gear wheel", chance = 700, maxCount = 2, description2 = "gear wheele"},
	{name = "gold coin", chance = 100000, maxCount = 75, description2 = "gps"},
	{name = "gold coin", chance = 100000, maxCount = 75, description2 = "gps"},
	{name = "iron ore", chance = 1500, description2 = "iron ore"},
	{name = "great health potion", chance = 900, description2 = "ghp"},
	{name = "great spirit potion", chance = 900, description2 = "gsp"},
	{name = "spiked squelcher", chance = 700, description2 = "spiked squelcher"},
	{id = 2853, chance = 100000, child = {
			{name = "small diamond", chance = 1500, maxCount = 2, description2 = "small diamond"},
			{name = "berserk potion", chance = 700, description2 = "berserk potion"},
			{name = "life crystal", chance = 800, description2 = "life crystal"},
			{id = 9811, chance = 700, description2 = "rusty legs"},
			{id = 9808, chance = 700, description2 = "rusty armor"},
			{id = 3048, chance = 750, description2 = "might ring"},
			{name = "war hammer", chance = 700, description2 = "war hammer"},
			{id = 9063, chance = 700, description2 = "crystal pedestal"},
			{name = "bonebreaker", chance = 200, description2 = "bonebreaker"},
			{id = 3091, chance = 300, description2 = "sword ring"}
		}
	}
}

mType:register(monster)



