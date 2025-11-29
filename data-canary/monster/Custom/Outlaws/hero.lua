local mType = Game.createMonsterType("frozenhell guard")
local monster = {}

monster.name = "frozenhell guard"
monster.description = "a frozenhell guard"
monster.experience = 70000
monster.outfit = {
	lookType = 73,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6081
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 400,
	chance = 10
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
	interval = 1,
	chance = 10,
	{text = "Have you seen princess Lumelia?", yell = true},
	{text = "I will sing a tune at your grave.", yell = true},
	{text = "Let's have a fight!", yell = true},
	{text = "Welcome to my battleground.", yell = true}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 200, attack = 200},
	{name ="combat", interval = 3000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -2000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ARROW, effect = CONST_ME_STUN},
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -1500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS}
}

monster.defenses = {
	defense = 20,
	armor = 30,
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_HEALING, minDamage = 750, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 25},
	{name = "warlord sword", chance = 50},
	{name = "experience scroll", chance = 2000},
	{ name = "red piece of cloth", chance = 2006 },
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




