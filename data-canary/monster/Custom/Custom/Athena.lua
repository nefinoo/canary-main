local mType = Game.createMonsterType("Athena")
local monster = {}

monster.name = "Athena"
monster.description = "Athena"
monster.experience = 225000
monster.outfit = {
	lookType = 139,
	lookHead = 79,
	lookBody = 116,
	lookLegs = 116,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 75000
monster.maxHealth = 75000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 4311
monster.speed = 250
monster.summonCost = 1000000000

monster.changeTarget = {
	interval = 3000,
	chance = 30
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 70,
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
	{text = "Gimme free gold!", yell = false},
	{text = "Gimme your password!", yell = false},
	{text = "Me have a cheating link for you!", yell = false},
	{text = "Me is GM!", yell = false},
	{text = "Me just need the code!", yell = false},
	{text = "Me not stink!", yell = false},
	{text = "Me other char is highlevel!", yell = false},
	{text = "Me sooo smart!", yell = false},
	{text = "You're next!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
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
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -2498, maxDamage = -3248, range = 1, radius = 1, target = true}
}

monster.defenses = {
	defense = 12,
	armor = 15,
	{name ="speed", interval = 1000, chance = 15, speed = {min = 290, max = 290}, duration = 6000, effect = CONST_ME_MAGIC_RED},
	{ name = "outfit", interval = 1000, chance = 15, effect = CONST_ME_GROUNDSHAKER, target = false, duration = 5000, outfitMonster = "pig" },
	{name ="combat", interval = 1, chance = 0, type = COMBAT_HEALING, minDamage = 8000, maxDamage = 10000, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 30},
	{name = "obsidian knife", chance = 1000},
	{name = "blessed wooden stake", chance = 1000},
	{name = "experience scroll", chance = 3000},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




