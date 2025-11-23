local mType = Game.createMonsterType("ungreez")
local monster = {}

monster.name = "ungreez"
monster.description = "ungreez"
monster.experience = 5000
monster.outfit = {
	lookType = 35,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8200
monster.maxHealth = 8200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5995
monster.speed = 330
monster.summonCost = 10000

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
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
	interval = 5000,
	chance = 10,
	{text = "I'll teach you that even heros can die", yell = true},
	{text = "You wil die Begging like the others did", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 105, attack = 100},
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -110, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -250, range = 7, radius = 7, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -400, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_PURPLEENERGY},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -380, length = 8, spread = 0, effect = CONST_ME_PURPLEENERGY}
}

monster.defenses = {
	defense = 55,
	armor = 55,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 90, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "great mana potion", chance = 3000},
	{name = "great health potion", chance = 3000}
}

mType:register(monster)



