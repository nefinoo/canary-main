local mType = Game.createMonsterType("omruc")
local monster = {}

monster.name = "omruc"
monster.description = "a omruc"
monster.experience = 2950
monster.outfit = {
	lookType = 90,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4300
monster.maxHealth = 4300
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6025
monster.speed = 370
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
	targetDistance = 4,
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
	{text = "Now chhhou shhhee me ... Now chhhou don't!!", yell = false},
	{text = "Chhhhou are marked ashhh my prey.", yell = false},
	{text = "Psssst, I am over chhhere.", yell = false}
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
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -50, maxDamage = -300, condition = {type = CONDITION_POISON, startDamage = 65, interval = 4000}},
	{name ="combat", interval = 5000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -250, range = 1, radius = 1, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -500, shootEffect = CONST_ANI_POISONARROW},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -120, maxDamage = -450, range = 3, radius = 1, target = true, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_EXPLOSIONAREA},
	{name ="melee", interval = 3000, chance = 20, minDamage = -150, maxDamage = -500},
	{name ="speed", interval = 1000, chance = 25, speed = {min = -900, max = -900}, duration = 50000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 35,
	armor = 20,
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 100, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 2000, chance = 14, duration = 8000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 4
monster.summons = {
	{name = "stalkers", chance = 100, interval = 2000, max = 4}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "orb", chance = 2000},
	{name = "ravager's axe", chance = 450},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 70},
			{name = "scythe", chance = 10000},
			{name = "candy cane", chance = 4000, maxCount = 5},
			{name = "scarab shield", chance = 900},
			{name = "phoenix shield", chance = 200},
			{name = "griffin shield", chance = 400},
			{name = "noble armor", chance = 500},
			{name = "white dress", chance = 100},
			{name = "wand of cosmic energy", chance = 800},
			{name = "small ruby", chance = 4000, maxCount = 2},
			{name = "coconut", chance = 4000, maxCount = 4},
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "roll", chance = 4000, maxCount = 4}
		}
	}
}

mType:register(monster)



