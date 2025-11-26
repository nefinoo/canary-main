local mType = Game.createMonsterType("mahrdis")
local monster = {}

monster.name = "mahrdis"
monster.description = "a mahrdis"
monster.experience = 3050
monster.outfit = {
	lookType = 90,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3900
monster.maxHealth = 3900
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6025
monster.speed = 340
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
	{text = "Ashes to ashes!", yell = false},
	{text = "Fire, Fire!", yell = false},
	{text = "The eternal flame demands its due!", yell = false},
	{text = "This is why I'm hot.", yell = false},
	{text = "May my flames engulf you!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 45},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -25},
	{type = COMBAT_HOLYDAMAGE , percent = -22},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -400, condition = {type = CONDITION_POISON, startDamage = 65, interval = 4000}},
	{name ="combat", interval = 1600, chance = 7, type = COMBAT_PHYSICALDAMAGE, minDamage = -60, maxDamage = -600, range = 1, radius = 1, target = true},
	{name ="combat", interval = 1000, chance = 7, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -600, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="speed", interval = 2000, chance = 13, speed = {min = -850, max = -850}, duration = 50000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -80, maxDamage = -800, radius = 3, target = false, effect = CONST_ME_EXPLOSIONAREA},
	{name ="firefield", interval = 1000, chance = 12, radius = 4, target = false, effect = CONST_ME_BLOCKHIT},
	{name ="condition", interval = 2000, chance = 13, type = CONDITION_FIRE, startDamage = 0, tick = 9000, minDamage = -50, maxDamage = -500, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONHIT}
}

monster.defenses = {
	defense = 30,
	armor = 20,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 20, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 4
monster.summons = {
	{name = "fire elemental", chance = 100, interval = 2000, max = 4}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "orb", chance = 2000},
	{name = "hammer of wrath", chance = 220},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 70},
			{name = "scythe", chance = 10000},
			{name = "candy cane", chance = 4000, maxCount = 5},
			{name = "scarab shield", chance = 900},
			{name = "phoenix shield", chance = 200},
			{name = "griffin shield", chance = 400},
			{name = "noble armor", chance = 300},
			{name = "white dress", chance = 100},
			{name = "wand of cosmic energy", chance = 800},
			{name = "small ruby", chance = 4000, maxCount = 2},
			{name = "coconut", chance = 4000, maxCount = 4},
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "roll", chance = 4000, maxCount = 4}
		}
	}
}

mType:register(monster)




