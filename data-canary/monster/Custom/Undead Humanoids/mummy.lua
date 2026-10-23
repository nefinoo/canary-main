local mType = Game.createMonsterType("mummy")
local monster = {}

monster.name = "mummy"
monster.description = "a mummy"
monster.experience = 15000000
monster.outfit = {
	lookType = 65,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 11500
monster.maxHealth = 11500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6004
monster.speed = 180
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	canPushCreatures = false,
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
	{text = "I will ssswallow your sssoul!", yell = false},
	{text = "Mort ulhegh dakh visss.", yell = false},
	{text = "Flesssh to dussst!", yell = false},
	{text = "I will tassste life again!", yell = false},
	{text = "Ahkahra exura belil mort!", yell = false},
	{text = "Yohag Sssetham!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -965, maxDamage = -1025, condition = {type = CONDITION_POISON, startDamage = 25, minDamage = -65, maxDamage = -95, interval = 4000}},
	{name ="combat", interval = 1500, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -965, maxDamage = -1525, range = 1, radius = 1, target = true},
	{name ="speed", interval = 2500, chance = 10, speed = {min = -350, max = -350}, duration = 6500, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED}
}

monster.defenses = {
	defense = 20,
	armor = 14
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 5},
	{name = "platinum coin", chance = 50000, maxCount = 8},
	{id = 3046, chance = 1818},
	{name = "yellow piece of cloth", chance = 5000},
	-- Frozen Hell: normal loot supports 650-750 Knight potion costs without increasing rare-set rates.
	{name = "small diamond", chance = 60000, maxCount = 3},
	{name = "green gem", chance = 1500},
	{name = "crystal coin", chance = 8000},
	{id = 3420, chance = 500}, -- demon shield: equipo de transicion
	{id = 12413, chance = 12250},
	{id = 3399, chance = 100},
	{id = 8095, chance = 750}, -- Frozen Hell: primary rare drop (Ranger Legs), 0.75%
	{id = 3408, chance = 100},
}

mType:register(monster)





