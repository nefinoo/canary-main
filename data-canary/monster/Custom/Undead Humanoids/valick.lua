local mType = Game.createMonsterType("valick")
local monster = {}

monster.name = "valick"
monster.description = "a valick"
monster.experience = 15500000
monster.outfit = {
	lookType = 68,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}
monster.raceId = 2636
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Check the teleport bitch.",
}

monster.health = 13000
monster.maxHealth = 13000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6006
monster.speed = 200
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
	interval = 5000,
	chance = 100,
	{text = "BLOOD!", yell = true},
	{text = "I call you, my bats! Come!", yell = false},
	{text = "I smell warm blood.", yell = false},
	{text = "Let me kiss your neck.", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -965, maxDamage = -1025},
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -965, maxDamage = -1625, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="speed", interval = 2000, chance = 12, speed = {min = -600, max = -600}, duration = 60000, radius = 6, target = false, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 4000, chance = 37, type = COMBAT_PHYSICALDAMAGE, minDamage = -965, maxDamage = -1425, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK}
}

monster.defenses = {
	defense = 23,
	armor = 40,
	{name = "outfit", interval = 1500, chance = 60, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "bat" },
	{name = "outfit", interval = 1500, chance = 50, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "vampire" },
	{name ="speed", interval = 1500, chance = 100, speed = {min = 300, max = 300}, duration = 30000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 3},
	{name = "platinum coin", chance = 50000, maxCount = 8},
	{name = "experience scroll", chance = 850},
	{name = "magic plate armor", chance = 130},
	{name = "fire axe", chance = 1500},
	{name = "yellow gem", chance = 3500},
	{name = "green gem", chance = 2000},
	{name = "violet gem", chance = 500},
	{name = "demonrage sword", chance = 410},
	{id = 5905, chance = 120},
	{id = 12413, chance = 12500},
	{id = 3399, chance = 350},
	{id = 8095, chance = 350},
	{id = 3408, chance = 350},
}

mType:register(monster)





