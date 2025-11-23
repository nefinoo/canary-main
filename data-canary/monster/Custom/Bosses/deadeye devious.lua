local mType = Game.createMonsterType("deadeye devious")
local monster = {}

monster.name = "Deadeye Devious"
monster.description = "Deadeye Devious"
monster.experience = 500
monster.outfit = {
	lookType = 151,
	lookHead = 115,
	lookBody = 76,
	lookLegs = 35,
	lookFeet = 117,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 2000
monster.maxHealth = 2000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 300
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
	interval = 5000,
	chance = 10,
	{text = "Let's kill 'em", yell = false},
	{text = "Arrrgh!", yell = false},
	{text = "You'll never take me alive!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -250, maxDamage = -550},
	{name ="combat", interval = 4000, chance = 60, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -250, shootEffect = CONST_ANI_THROWINGKNIFE}
}

monster.defenses = {
	defense = 50,
	armor = 35,
	{name ="combat", interval = 6000, chance = 65, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "deadeye devious' eye patch", chance = 100000},
	{name = "gold coin", chance = 100000, maxCount = 65},
	{name = "knight armor", chance = 1200},
	{name = "plate armor", chance = 4000},
	{id = 3114, chance = 100000, maxCount = 2},
	{name = "pirate backpack", chance = 4000},
	{name = "meat", chance = 100000}
}

mType:register(monster)



