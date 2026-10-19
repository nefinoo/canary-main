local mType = Game.createMonsterType("salazaari windwalker")
local monster = {}

monster.name = "salazaari windwalker"
monster.description = "a salazaari windwalker"
monster.experience = 11500000
monster.outfit = {
	lookType = 63,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7200
monster.maxHealth = 7200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6011
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
	{text = "Feel my wrath!", yell = false},
	{text = "For the Daughter of the Stars!", yell = false},
	{text = "I'll bring balance upon you!", yell = false},
	{text = "Tha'shi Cenath!", yell = false},
	{text = "Vihil Ealuel!", yell = false}
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -420, maxDamage = -600 },
	{name ="combat", interval = 4000, chance = 50, type = COMBAT_ENERGYDAMAGE, minDamage = -520, maxDamage = -780, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA},
	{name ="combat", interval = 6000, chance = 40, type = COMBAT_DEATHDAMAGE, minDamage = -750, maxDamage = -1050, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 20,
	armor = 15,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 42, maxDamage = 68, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 4000, chance = 40, speed = {min = 0, max = 0}, duration = 0, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 3},
	{name = "platinum coin", chance = 50000, maxCount = 5},
	{name = "violet gem", chance = 500},
	{name = "yellow gem", chance = 2000},
	{name = "crown armor", chance = 1500},
	{name = "crown legs", chance = 1000},
	{name = "crown helmet", chance = 2400},
	{id = 3392, chance = 650}, -- royal helmet
	{name = "crown shield", chance = 2250},
	{name = "experience scroll", chance = 750},
	{ name = "holy orchid", chance = 2100 },
	{id = 12413, chance = 12000},
	{id = 3399, chance = 250},
	{id = 8095, chance = 250},
	{id = 3408, chance = 250},
}

monster.raceId = 63
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Yalahar Foreigner Quarter, Demona, Shadowthorn, northwest of Ab'Dendriel, Maze of Lost Souls, \z
		Cyclopolis, Elvenbane, near Mount Sternum.",
}


mType:register(monster)





