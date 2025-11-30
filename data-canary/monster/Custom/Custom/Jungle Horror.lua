local mType = Game.createMonsterType("Jungle Horror")
local monster = {}

monster.name = "Jungle Horror"
monster.description = "a jungle horror"
monster.experience = 825000
monster.outfit = {
	lookType = 215,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 300000
monster.maxHealth = 300000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 4372
monster.speed = 250
monster.summonCost = 0

monster.changeTarget = {
	interval = 3000,
	chance = 30
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
	interval = 2200,
	chance = 50,
	{text = "Feel the wrath of me dos attack!", yell = true},
	{text = "Gimme free gold!", yell = true},
	{text = "Gimme your password!", yell = true},
	{text = "Me have a cheating link for you!", yell = true},
	{text = "Me is GM!", yell = true},
	{text = "Me just need the code!", yell = true},
	{text = "Me not stink!", yell = true},
	{text = "Me other char is highlevel!", yell = true},
	{text = "Me sooo smart!", yell = true},
	{text = "You're next!", yell = true}
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
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -3461, maxDamage = -4500, range = 1, radius = 1, target = true},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -3461, maxDamage = -4500, range = 4, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS}
}

monster.defenses = {
	defense = 12,
	armor = 15,
	{name ="speed", interval = 1000, chance = 15, speed = {min = 290, max = 290}, duration = 6000, effect = CONST_ME_MAGIC_RED},
	{name = "outfit", interval = 10000, chance = 15, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000, outfitMonster = "pig" },
}

monster.maxSummons = 1
monster.summons = {
	{name = "Hydra", chance = 25, interval = 1000, max = 1}
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 10},
	{name = "valentine's cake", chance = 2000},
	{id = 6500, chance = 2000},
	{id = 6541, chance = 2000},
	{id = 6542, chance = 2000},
	{id = 6543, chance = 2000},
	{id = 6544, chance = 2000},
	{id = 6545, chance = 2000},
	{name = "candy", chance = 2000},
	{name = "experience scroll", chance = 3000},
	{name = "piece of draconian steel", chance = 500},
--	{id = 9743, chance = 2500}
}

mType:register(monster)




