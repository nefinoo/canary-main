local mType = Game.createMonsterType("war golem")
local monster = {}

monster.name = "War Golem"
monster.description = "a war golem"
monster.experience = 2550
monster.outfit = {
	lookType = 326,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4300
monster.maxHealth = 4300
monster.runHealth = 0
monster.race = "venom"
monster.corpse = 10005
monster.speed = 280
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
	{text = "Azerus barada nikto!", yell = false},
	{text = "Klonk klonk klonk", yell = false},
	{text = "Engaging Enemy!", yell = false},
	{text = "Threat level processed.", yell = false},
	{text = "Charging weapon systems!", yell = false},
	{text = "Auto repair in progress.", yell = false},
	{text = "The battle is joined!", yell = false},
	{text = "Termination initialized!", yell = false},
	{text = "Rrrtttarrrttarrrtta", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 35},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 45},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 25},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -280},
	{name ="combat", interval = 1000, chance = 7, type = COMBAT_ENERGYDAMAGE, minDamage = 0, maxDamage = -220, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = 0, maxDamage = -280, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT},
	{name = "outfit", interval = 1000, chance = 9, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000, outfitMonster = "skeleton" },
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="speed", interval = 1000, chance = 7, speed = {min = 290, max = 290}, duration = 4000, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 200, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "nail", chance = 50000, maxCount = 5, description2 = "nails"},
	{name = "gold coin", chance = 100000, maxCount = 170, description2 = "gps"},
	{id = 2853, chance = 100000, child = {
			{name = "lightning boots", chance = 400, description2 = "lightning boots"},
			{name = "crystal of power", chance = 300, description2 = "crystal of power"},
			{name = "steel boots", chance = 400, description2 = "steel boots"},
			{name = "iron ore", chance = 20000, description2 = "iron ore"},
			{name = "berserker", chance = 250, description2 = "berserker"},
			{name = "jade hammer", chance = 250, description2 = "jade hammer"}
		}
	}
}

mType:register(monster)



