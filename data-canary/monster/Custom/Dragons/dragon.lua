local mType = Game.createMonsterType("dragon")
local monster = {}

monster.name = "dragon"
monster.description = "a dragon"
monster.experience = 720000
monster.outfit = {
	lookType = 34,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 34
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Thais Ancient Temple, Darashia Dragon Lair, Mount Sternum Dragon Cave, Mintwallin, \z
		deep in Fibula Dungeon, Kazordoon Dragon Lair (near Dwarf Bridge), Plains of Havoc, Elven Bane castle, \z
		Maze of Lost Souls, southern cave and dragon tower in Shadowthorn, Orc Fortress, Venore Dragon Lair, \z
		Pits of Inferno, Behemoth Quest room in Edron, Hero Cave, deep Cyclopolis, Edron Dragon Lair, Goroma, \z
		Ankrahmun Dragon Lairs, Draconia, Dragonblaze Peaks, some Ankrahmun Tombs, \z
		underground of Fenrock (on the way to Beregar), Krailos Steppe and Crystal Lakes.",
}


monster.health = 3100
monster.maxHealth = 3100
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5973
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
	{text = "GROOAAARRR", yell = true},
	{text = "FCHHHHH", yell = true}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -38, maxDamage = -120 },
	{ name = "combat", interval = 4000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -40, maxDamage = -105, range = 5, radius = 2, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA },
	{ name = "combat", interval = 3000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -35, maxDamage = -90, length = 5, spread = 2, effect = CONST_ME_FIREAREA },
}

monster.defenses = {
	defense = 24,
	armor = 15,
	{ name = "combat", interval = 5000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 34 },
	{ name = "health potion", chance = 16000 },
	{ name = "mana potion", chance = 16000 },
	{ name = "strong health potion", chance = 22000 },
	{ name = "strong mana potion", chance = 24000 },
	{ name = "great health potion", chance = 7000 },
	{ name = "great mana potion", chance = 8000 },
	{ name = "great spirit potion", chance = 5000 },
	{ name = "dragon ham", chance = 50000, maxCount = 2 },
	{ name = "dragon's tail", chance = 9680 },
	{ name = "green dragon leather", chance = 6000 },
	{ name = "green dragon scale", chance = 6000 },
	{ id = 8864, chance = 750 }, -- yalahari mask
	{ id = 11687, chance = 480 }, -- royal scale robe
	{ id = 10387, chance = 580 }, -- zaoan legs
	{ id = 8074, chance = 650 }, -- spellbook of mind control
}

mType:register(monster)





