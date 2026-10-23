local mType = Game.createMonsterType("Hellraiser")
local monster = {}

monster.name = "Hellraiser"
monster.description = "a hellraiser"
monster.experience = 448000000
monster.outfit = {
	lookType = 322,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 519
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Magician Quarter, Vengoth, Deeper Banuta, Formorgar Minese, Chyllfroest, Oramond Dungeon, Asura Palace, Asura Vaults.",
}

monster.health = 195000
monster.maxHealth = 195000
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 9009
monster.speed = 360
monster.summonCost = 0

monster.changeTarget = {
	interval = 360,
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
	{text = "I'm just a messenger of what's yet to come.", yell = true},
	{text = "You little weasel will not live to see another day.", yell = true},
	{text = "Your fragile bones are like toothpicks to me.", yell = true}
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

-- Frozen Hell Knight progression; Hellraiser
monster.attacks = {
	{name = "melee", interval = 1500, chance = 100, minDamage = -2100, maxDamage = -2750},
	{name = "combat", interval = 2500, chance = 75, type = COMBAT_FIREDAMAGE, minDamage = -1650, maxDamage = -2400, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK},
	{name = "combat", interval = 3000, chance = 70, type = COMBAT_PHYSICALDAMAGE, minDamage = -1950, maxDamage = -2550, length = 5, spread = 2, effect = CONST_ME_HITAREA}
}

monster.defenses = {
	defense = 55,
	armor = 50,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 60, maxDamage = 230, effect = CONST_ME_MAGIC_BLUE}
}

-- Nephy resale and ultra-rare Yalahari; Eventshop remains the primary option.
monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 10},
	{name = "platinum coin", chance = 100000, maxCount = 45},
	{name = "experience scroll", chance = 3000},
	{name = "demonic essence", chance = 15000, maxCount = 3},
	{id = 5888, chance = 1400}, -- hellsteel,
	{name = "violet gem", chance = 2200},
	{name = "green gem", chance = 3500},
	{name = "small diamond", chance = 45000, maxCount = 5},
	{name = "magic plate armor", chance = 650},
	{name = "demonrage sword", chance = 650},
	{name = "golden legs", chance = 450},
	{name = "demon shield", chance = 800},
	{id = 8862, chance = 12}, -- Yalahari armor, 0.012%,
	{id = 8863, chance = 12}, -- Yalahari legs,
	{id = 23477, chance = 8}, -- Yalahari boots,
	{id = 8864, chance = 8}, -- Yalahari mask,
	{id = 3423, chance = 6} -- Yalahari shield
}

mType:register(monster)





