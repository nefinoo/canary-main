local mType = Game.createMonsterType("demon")
local monster = {}

monster.name = "demon"
monster.description = "a demon"
monster.experience = 3500000
monster.outfit = {
	lookType = 35,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 35
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Hero Cave, Ferumbras' Citadel, Goroma, Ghostlands Warlock area unreachable, Liberty Bay hidden underground passage unreachable, Razachai, deep in Pits of Inferno (found in every throneroom except Verminor's), deep Formorgar Mines, Demon Forge, Alchemist Quarter, Magician Quarter, Chyllfroest, Oramond Dungeon, Abandoned Sewers, Hell Hub and Halls of Ascension.",
}


monster.health = 4600
monster.maxHealth = 4600
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5995
monster.speed = 280
monster.summonCost = 0

monster.changeTarget = {
	interval = 300,
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
	staticAttackChance = 40,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "CHAMEK ATH UTHUL ARAK!", yell = true},
	{text = "I SMELL FEEEEEAAAR!", yell = true},
	{text = "MUHAHAHAHA!", yell = true},
	{text = "Your resistance is futile!", yell = false},
	{text = "Your soul will be mine!", yell = false}
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
	{name ="melee", interval = 2000, chance = 100, minDamage = -288, maxDamage = -375},
	{name ="combat", interval = 3000, chance = 13, type = COMBAT_MANADRAIN, minDamage = -288, maxDamage = -375, range = 7, radius = 1, target = true},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -288, maxDamage = -375, range = 7, radius = 7, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="firefield", interval = 1000, chance = 15, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -288, maxDamage = -375, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT}
}

monster.defenses = {
	defense = 55,
	armor = 50,
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_HEALING, minDamage = 90, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 15, speed = {min = 200, max = 200}, duration = 20000, effect = CONST_ME_MAGIC_RED}
}

monster.maxSummons = 2
monster.summons = {
	{name = "fire elemental", chance = 10, interval = 1000, max = 2}
}

monster.loot = {
	{name = "purple tome", chance = 1300},
	{name = "talon", chance = 4000, maxCount = 4},
	{name = "platinum amulet", chance = 2400},
	{name = "gold ring", chance = 800},
	{name = "ice rapier", chance = 400},
	{name = "golden legs", chance = 300},
	{name = "demon shield", chance = 500},
	{name = "coconut", chance = 10000, maxCount = 3},
	{name = "fire mushroom", chance = 20000, maxCount = 6},
	{name = "demonrage sword", chance = 410},
	{name = "platinum coin", chance = 100000, maxCount = 2},
	{name = "platinum coin", chance = 50000, maxCount = 4},
	{name = "orb", chance = 3000},
	{name = "giant sword", chance = 728},
	{name = "fire axe", chance = 1500},
	{name = "magic plate armor", chance = 130},
	{name = "mastermind shield", chance = 500},
	{name = "demon horn", chance = 800},
	{id = 12413, chance = 5000},
}

mType:register(monster)





