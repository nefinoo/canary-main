local mType = Game.createMonsterType("valick")
local monster = {}

monster.name = "valick"
monster.description = "a valick"
monster.experience = 15500
monster.outfit = {
	lookType = 68,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -1165, maxDamage = -1425},
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -1165, maxDamage = -1425, range = 1, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="speed", interval = 2000, chance = 12, speed = {min = -600, max = -600}, duration = 60000, radius = 6, target = false, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -1165, maxDamage = -1425, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK}
}

monster.defenses = {
	defense = 23,
	armor = 40,
	{name = "outfit", interval = 1500, chance = 60, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "bat" },
	{name = "outfit", interval = 1500, chance = 50, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 6000, outfitMonster = "vampire" },
	{name ="speed", interval = 1500, chance = 100, speed = {min = 300, max = 300}, duration = 30000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 10},
	{id = 7366, chance = 50},
	{name = "experience scroll", chance = 2500},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




