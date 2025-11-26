local mType = Game.createMonsterType("thalas")
local monster = {}

monster.name = "thalas"
monster.description = "a thalas"
monster.experience = 2950
monster.outfit = {
	lookType = 90,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4100
monster.maxHealth = 4100
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6025
monster.speed = 320
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
	{text = "You will become a feast for my maggots.", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -23},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -10, maxDamage = -650, condition = {type = CONDITION_POISON, startDamage = 70, interval = 4000}},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -650, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA},
	{name ="melee", interval = 3000, chance = 20, minDamage = -150, maxDamage = -650},
	{name ="speed", interval = 1000, chance = 6, speed = {min = -800, max = -800}, duration = 20000, range = 7, radius = 1, target = true, effect = CONST_ME_MAGIC_RED},
	{name ="condition", interval = 1000, chance = 15, type = CONDITION_POISON, startDamage = 0, tick = 4000, minDamage = -34, maxDamage = -35, radius = 5, target = false, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 3000, chance = 17, type = COMBAT_EARTHDAMAGE, minDamage = -55, maxDamage = -550, length = 8, spread = 3, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 30,
	armor = 20,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 150, maxDamage = 450, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 8
monster.summons = {
	{name = "slime2", chance = 100, interval = 2000, max = 8}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "orb", chance = 2000},
	{name = "orb", chance = 2000},
	{name = "hammer of wrath", chance = 450},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{id = 2853, chance = 100000, child = {
			{name = "gold coin", chance = 100000, maxCount = 70},
			{name = "scythe", chance = 10000},
			{name = "candy cane", chance = 4000, maxCount = 5},
			{name = "scarab shield", chance = 900},
			{name = "phoenix shield", chance = 200},
			{name = "crystal mace", chance = 400},
			{name = "noble armor", chance = 300},
			{name = "white dress", chance = 100},
			{name = "wand of inferno", chance = 800},
			{name = "small ruby", chance = 4000, maxCount = 2},
			{name = "coconut", chance = 4000, maxCount = 4},
			{name = "gold coin", chance = 100000, maxCount = 100},
			{name = "roll", chance = 4000, maxCount = 4},
			{name = "blue backpack", chance = 2857, child = {
					{name = "gold coin", chance = 2857, maxCount = 100}
				}
			}
		}
	}
}

mType:register(monster)




