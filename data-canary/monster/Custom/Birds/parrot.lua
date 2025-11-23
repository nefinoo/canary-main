local mType = Game.createMonsterType("parrot")
local monster = {}

monster.name = "Parrot"
monster.description = "a parrot"
monster.experience = 0
monster.outfit = {
	lookType = 217,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 25
monster.maxHealth = 25
monster.runHealth = 25
monster.race = "blood"
monster.corpse = 6056
monster.speed = 240
monster.summonCost = 250

monster.changeTarget = {
	interval = 5000,
	chance = 20
}

monster.flags = {
	attackable = true,
	hostile = false,
	summonable = true,
	convinceable = true,
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
	canPushItems = false,
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
	{text = "BR? PL? SWE?", yell = false},
	{text = "Screeech!", yell = false},
	{text = "Neeeewbiiieee!", yell = false},
	{text = "You advanshed, you advanshed!", yell = false},
	{text = "Hope you die and loooosh it!", yell = false},
	{text = "Hunterrr ish PK!", yell = false},
	{text = "Shhtop whining! Rrah", yell = false},
	{text = "I'm heeerrre! Screeeech!", yell = false},
	{text = "Leeave orrr hunted!!", yell = false},
	{text = "Blesshhh my stake! Screeech!", yell = false},
	{text = "Tarrrrp?", yell = false},
	{text = "You are corrrrupt! Corrrrupt!", yell = false},
	{text = "You powerrrrrrabuserrrrr!", yell = false},
	{text = "You advanshed, you advanshed!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, skill = 13, attack = 6}
}

monster.defenses = {
	defense = 6,
	armor = 2
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "worm", chance = 50000, maxCount = 3}
}

mType:register(monster)



