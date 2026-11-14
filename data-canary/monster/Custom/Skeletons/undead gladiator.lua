local mType = Game.createMonsterType("Undead Gladiator")
local monster = {}

monster.name = "Undead Gladiator"
monster.description = "a undead gladiator"
monster.experience = 800000
monster.outfit = {
	lookType = 306,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1000
monster.maxHealth = 1000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 9823
monster.speed = 270
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
	interval = 2500,
	chance = 10,
	{text = "Let's battle it out in a duel!", yell = false},
	{text = "Bring it!", yell = false},
	{text = "I'll fight here in eternity and beyond.", yell = false},
	{text = "I will not give up!", yell = false},
	{text = "Another foolish adventurer who tries to beat me.", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -5},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -250},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -135, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_WHIRLWINDSWORD}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="invisible", interval = 5000, chance = 50, duration = 5000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 75, description2 = "gps"},
	{name = "gold coin", chance = 100000, maxCount = 75, description2 = "gps"},
	{name = "throwing star", chance = 4000, maxCount = 17, description2 = "throwing star"},
	{name = "plate legs", chance = 3500, description2 = "plate legs"},
	{name = "brass armor", chance = 4000, description2 = "brass armor"},
	{name = "meat", chance = 10000, maxCount = 2, description2 = "meat"},
	{name = "belted cape", chance = 1500, description2 = "belted cape"},
	{name = "crusader helmet", chance = 800, description2 = "crusader helmet"},
	{id = 2853, chance = 100000, description2 = "bag", child = {
			{name = "hunting spear", chance = 4000, description2 = "hunting spear"},
			{id = 3307, chance = 4000, description2 = "scimitar"},
			{name = "brass legs", chance = 3000, description2 = "brass legs"},
			{name = "plate armor", chance = 2500, description2 = "plate armor"},
			{name = "protection amulet", chance = 3000, description2 = "protection amulet"},
			{name = "two handed sword", chance = 2500, description2 = "two handed sword"},
			{id = 3049, chance = 1300, description2 = "stealth ring"},
			{name = "dark helmet", chance = 1600, description2 = "dark helmet"},
			{name = "knight axe", chance = 900, description2 = "knight axe"},
			{name = "beastslayer axe", chance = 500, description2 = "beastslayer axe"},
			{id = 5885, chance = 400, description2 = "warrior's sweat"},
			{name = "glorious axe", chance = 300, description2 = "glorius axe"},
			{name = "heroic axe", chance = 200, description2 = "mercenary sword"}
		}
	}
}

mType:register(monster)





