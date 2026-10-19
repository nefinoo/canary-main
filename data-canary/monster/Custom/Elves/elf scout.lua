local mType = Game.createMonsterType("salazaari ranger")
local monster = {}

monster.name = "salazaari ranger"
monster.description = "a salazaari ranger"
monster.experience = 11500000
monster.outfit = {
	lookType = 64,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6800
monster.maxHealth = 6800
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6012
monster.speed = 280
monster.summonCost = 0

monster.changeTarget = {
	interval = 500,
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
	{text = "Evicor guide my arrow.", yell = false},
	{text = "Feel the sting of my arrows!", yell = false},
	{text = "Tha'shi Ab'Dendriel!", yell = false},
	{text = "Thy blood will quench the soil's thirst!", yell = false},
	{text = "Your existence will end here!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -460, maxDamage = -620 },
	{name ="combat", interval = 3000, chance = 55, type = COMBAT_PHYSICALDAMAGE, minDamage = -550, maxDamage = -750, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 5000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -550, maxDamage = -750, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 18,
	armor = 7,
	{name ="speed", interval = 4000, chance = 40, speed = {min = 0, max = 0}, duration = 0, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 3},
	{name = "platinum coin", chance = 50000, maxCount = 5},
	{name = "green gem", chance = 2500},
	{name = "crown armor", chance = 1500},
	{name = "crown legs", chance = 1800},
	{id = 3364, chance = 450}, -- golden legs
	{name = "crown helmet", chance = 2000},
	{name = "crown shield", chance = 2250},
	{name = "experience scroll", chance = 600},
	{ id = 5921, chance = 1130 }, -- heaven blossom
	{id = 12413, chance = 12000},
}


monster.raceId = 64
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Yalahar Foreigner Quarter, Shadowthorn, northwest of Ab'Dendriel, north and west of Mount Sternum, \z
		Hellgate, Maze of Lost Souls, near Knightwatch Tower in the Plains of Havoc. \z
		Two may also spawn when a Desperate White Deer or an Enraged White Deer is killed.",
}

mType:register(monster)





