local mType = Game.createMonsterType("undead mage")
local monster = {}

monster.name = "undead mage"
monster.description = "an undead mage"
monster.experience = 70000
monster.outfit = {
	lookType = 9,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15000
monster.maxHealth = 15000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 220
monster.summonCost = 0

monster.changeTarget = {
	interval = 220,
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
	targetDistance =5,
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
	{text = "Taste the sweetness of death!", yell = false},
	{text = "Your corpse will be mine!", yell = false}
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
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -923, maxDamage = -1200, condition = {type = CONDITION_POISON, startDamage = 90, interval = 5000}},
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -980, maxDamage = -1275, range = 1, radius = 1, target = true, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -980, maxDamage = -1275, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 42, maxDamage = 68, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 4
monster.summons = {
	{name = "ghost", chance = 15, interval = 1000, max = 4},
	{name = "ghoul", chance = 17, interval = 1000, max = 4},
	{name = "mummy", chance = 13, interval = 1000, max = 4}
}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 5},
	{id = 3341, chance = 100},
	{name = "experience scroll", chance = 2500},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




