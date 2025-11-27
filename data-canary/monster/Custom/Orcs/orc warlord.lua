local mType = Game.createMonsterType("orc warlord")
local monster = {}

monster.name = "orc warlord"
monster.description = "a orc warlord"
monster.experience = 670
monster.outfit = {
	lookType = 2,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 950
monster.maxHealth = 950
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6008
monster.speed = 290
monster.summonCost = 0

monster.changeTarget = {
	interval = 290,
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
	{text = "Futchi maruk buta!", yell = false},
	{text = "Ikem rambo zambo!", yell = false},
	{text = "Orc buta bana!", yell = false},
	{text = "Ranat Ulderek!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -40, maxDamage = -200},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -120, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_THROWINGSTAR}
}

monster.defenses = {
	defense = 35,
	armor = 22,
	{name ="invisible", interval = 1000, chance = 4, duration = 2000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "backpack", chance = 100000, child = {
			-- {id = 3049, chance = 1333},
			{name = "gold ring", chance = 556},
			{name = "protection amulet", chance = 2000},
			{name = "two handed sword", chance = 1818},
			{name = "dragon hammer", chance = 833},
			{name = "brass legs", chance = 3333},
			{name = "dark helmet", chance = 2500},
			-- {name = "crusader helmet", chance = 667},
			-- {name = "amazon helmet", chance = 333},
			-- {name = "amazon armor", chance = 250},
			-- {name = "amazon shield", chance = 200}
		}
	},
	{name = "gold coin", chance = 50000, maxCount = 70},
	{name = "fire sword", chance = 1538},
	{name = "orcish axe", chance = 2000},
	{name = "plate armor", chance = 1333},
	{name = "plate legs", chance = 2222},
	{name = "meat", chance = 20000, maxCount = 3},
	{id = 3578, chance = 6667}
}

mType:register(monster)




