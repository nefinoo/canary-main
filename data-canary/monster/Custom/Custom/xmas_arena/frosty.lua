local mType = Game.createMonsterType("frosty")
local monster = {}

monster.name = "frosty"
monster.description = "frosty"
monster.experience = 5500000
monster.outfit = {
	lookTypeEx = 7172
}

monster.health = 1500000
monster.maxHealth = 1500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 0
monster.speed = 820
monster.summonCost = 0

monster.changeTarget = {
	interval = 500,
	chance = 10
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
	interval = 1500,
	chance = 10,
	{text = "Freee Meeeee!", yell = false},
	{text = "You no be here, you go, you go!", yell = false},
	{text = "Thy blood will quench the soil's thirst!", yell = false},
	{text = "Your existence will end here!", yell = false}
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
	{name ="melee", interval = 1000, chance = 100, minDamage = -8000, maxDamage = -11000},
	{name ="combat", interval = 1000, chance = 765, type = COMBAT_ICEDAMAGE, minDamage = -4000, maxDamage = -6000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_POFF},
	{name ="combat", interval = 1100, chance = 75, type = COMBAT_ICEDAMAGE, minDamage = -4000, maxDamage = -6000, radius = 4, target = false, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 18,
	armor = 7,
	{name ="speed", interval = 4000, chance = 40, speed = {min = 0, max = 0}, duration = 0, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.loot = {
}

mType:register(monster)



