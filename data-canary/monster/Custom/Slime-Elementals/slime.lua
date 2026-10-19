local mType = Game.createMonsterType("slime")
local monster = {}

monster.name = "slime"
monster.description = "a slime"
monster.experience = 160
monster.outfit = {
	lookType = 19,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 150
monster.maxHealth = 150
monster.race = "venom"
monster.corpse = 2127
monster.speed = 120
monster.summonCost = 0

monster.changeTarget = {
	interval = 120,
	chance = 8
}

monster.raceId = 19
monster.Bestiary = {
	class = "Slime",
	race = BESTY_RACE_SLIME,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Ancient Temple under the Rotworm area, under White Flower Temple, \z
		Mount Sternum Undead Cave on the last floor, Thais Troll Cave, Bonelord cave in Drefia, \z
		Green Claw Swamp, Dwarf Mines, Villa Scapula, Ankrahmun Tombs, Dark Cathedral, north of Port Hope, \z
		Deeper Banuta, on Folda on the floor above the Water Elementals, Hellgate, Vengoth, Alchemist Quarter, \z
		Yalahar and Carlin sewers, Ghostlands, Desert Dungeon, Dusalk's Troll Clan Cave, Nargor, \z
		and in a cave northeast of Ab'Dendriel.",
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
	{name ="melee", interval = 2000, chance = 100, skill = 22, attack = 30, condition = {type = CONDITION_POISON, startDamage = 90, interval = 5000}}
}

monster.defenses = {
	defense = 10,
	armor = 3
}

monster.loot = {
}

mType:register(monster)




