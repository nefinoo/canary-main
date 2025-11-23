local mType = Game.createMonsterType("overcharged energy elemental")
local monster = {}

monster.name = "overcharged energy elemental"
monster.description = "an orvercharged energy elemental"
monster.experience = 1300
monster.outfit = {
	lookType = 290,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1700
monster.maxHealth = 1700
monster.runHealth = 1
monster.race = "undead"
monster.corpse = 8966
monster.speed = 300
monster.summonCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 15
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
	interval = 5000,
	chance = 10,
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 95, attack = 85},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_ENERGYDAMAGE, minDamage = 0, maxDamage = -250, radius = 4, target = false, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_PURPLEENERGY},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = 0, maxDamage = -300, range = 3, radius = 1, target = true, effect = CONST_ME_PURPLEENERGY},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, radius = 4, target = false, effect = CONST_ME_POFF}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 90, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "energy soil", chance = 1500, maxCount = 2},
	{name = "berserk potion", chance = 2100},
	{name = "small amethyst", chance = 4500, maxCount = 3},
	{name = "wand of starstorm", chance = 1000}
}

mType:register(monster)



