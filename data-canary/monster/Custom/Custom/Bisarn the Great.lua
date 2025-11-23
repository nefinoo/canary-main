local mType = Game.createMonsterType("Bisarn the Great")
local monster = {}

monster.name = "Bisarn the Great"
monster.description = "bisarn the great"
monster.experience = 12500000
monster.outfit = {
	lookType = 253,
	lookHead = 88,
	lookBody = 94,
	lookLegs = 58,
	lookFeet = 114,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 5000000
monster.maxHealth = 5000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 500
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 100
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
	staticAttackChance = 85,
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
	interval = 2000,
	chance = 100,
	{text = "Surrender now you cannot defeat the great!", yell = true},
	{text = "Muahaahaah", yell = true}
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
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -1000, maxDamage = -3000},
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -1000, range = 5, radius = 1, target = true, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_HITAREA},
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -750, radius = 2, target = false, effect = CONST_ME_MAGIC_GREEN}
}

monster.defenses = {
	defense = 50,
	armor = 60,
	{name ="combat", interval = 2000, chance = 60, type = COMBAT_HEALING, minDamage = 3000, maxDamage = 10000, effect = CONST_ME_MAGIC_GREEN}
}

monster.loot = {
}

mType:register(monster)



