local mType = Game.createMonsterType("hacker")
local monster = {}

monster.name = "Hacker"
monster.description = "a Hacker"
monster.experience = 45
monster.outfit = {
	lookType = 8,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 430
monster.maxHealth = 430
monster.runHealth = 429
monster.race = "blood"
monster.corpse = 5980
monster.speed = 250
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
	{text = "Feel the wrath of me dos attack!", yell = false},
	{text = "You're next!", yell = false},
	{text = "Gimme free gold!", yell = false},
	{text = "Me sooo smart!", yell = false},
	{text = "Me have a cheating link for you!", yell = false},
	{text = "Me is GM!", yell = false},
	{text = "Gimme your password!", yell = false},
	{text = "Me just need the code!", yell = false},
	{text = "Me not stink!", yell = false},
	{text = "Me other char is highlevel!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 20, attack = 55}
}

monster.defenses = {
	defense = 12,
	armor = 15,
	{name ="speed", interval = 1000, chance = 15, speed = {min = 290, max = 290}, duration = 6000, effect = CONST_ME_MAGIC_RED},
	{name = "outfit", interval = 10000, chance = 15, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000, outfitMonster = "pig" },
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 12},
	{name = "ham", chance = 50000},
	{id = 6570, chance = 5538},
	{id = 6571, chance = 1538},
	{id = 2914, chance = 6666},
	{id = 2853, chance = 100000, child = {
			{name = "halberd", chance = 10000},
			{id = 3274, chance = 10000},
			{name = "war hammer", chance = 5000},
			{name = "battle axe", chance = 5000}
		}
	}
}

mType:register(monster)



