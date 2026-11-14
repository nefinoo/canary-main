local mType = Game.createMonsterType("lord of the elements")
local monster = {}

monster.name = "lord of the elements"
monster.description = "lord of the elements"
monster.experience = 8000000
monster.outfit = {
	lookType = 290,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10000
monster.maxHealth = 10000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 9009
monster.speed = 370
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 110, attack = 115}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 100, maxDamage = 195, effect = CONST_ME_MAGIC_BLUE},
	{ name = "outfit", interval = 1500, chance = 40, effect = CONST_ME_GROUNDSHAKER, target = false, duration = 3000, outfitMonster = "Ice Overlord" },
	{ name = "outfit", interval = 1500, chance = 40, effect = CONST_ME_GROUNDSHAKER, target = false, duration = 3000, outfitMonster = "Energy Overlord" },
	{ name = "outfit", interval = 1500, chance = 40, effect = CONST_ME_GROUNDSHAKER, target = false, duration = 3000, outfitMonster = "Fire Overlord" },
	{ name = "outfit", interval = 1500, chance = 40, effect = CONST_ME_GROUNDSHAKER, target = false, duration = 3000, outfitMonster = "Earth Overlord" },
}

monster.maxSummons = 2
monster.summons = {
	{name = "Blistering Fire fire elemental", chance = 50, interval = 4000, max = 2},
	{name = "Jagged Earth Elemental", chance = 50, interval = 4000, max = 2},
	{name = "Roaring Water Elemental", chance = 50, interval = 4000, max = 2},
	{name = "Overcharged Energy Elemental", chance = 50, interval = 4000, max = 2}
}

monster.loot = {
	{name = "platinum coin", chance = 40000, maxCount = 7}
}

mType:register(monster)





