local mType = Game.createMonsterType("Hellraiser")
local monster = {}

monster.name = "Hellraiser"
monster.description = "a hellraiser"
monster.experience = 35650000
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

monster.health = 22000
monster.maxHealth = 22000
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

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -1337, maxDamage = -1650},
	{name ="diabolic imp fireball", interval = 1000, chance = 100, minDamage = -1337, maxDamage = -1650, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD},
	{name ="hellspawn soulfire", interval = 2000, chance = 14, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 55,
	armor = 50,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 60, maxDamage = 230, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 5},
	{name = "platinum coin", chance = 70000, maxCount = 8},
	{name = "experience scroll", chance = 650, maxCount = 2},
	-- {id = 7366, chance = 100},
	-- {id = 7426, chance = 100}, 
	-- {id = 7420, chance = 100}, 
	-- {id = 3296, chance = 100},
	-- {id = 7437, chance = 100},
	-- {name = "magic sword", chance = 200},
	-- { id = 3319, chance = 200 }, 
	-- { id = 3309, chance = 200 }, 
	-- {id = 3341, chance = 200},
	-- {name = "throwing star", chance = 200},
	{id = 3082, chance = 5500},
	{name = "demonic essence", chance = 1818},
	{id = 5888, chance = 500},-- hellsteel
	{name = "crown armor", chance = 1500},
	{name = "crown legs", chance = 1000},
	{name = "crown helmet", chance = 2000},
	{name = "crown shield", chance = 2250},
	{name = "demonic essence", chance = 1818},
	{name = "fire axe", chance = 1500},
	{name = "yellow gem", chance = 3500},
	{name = "green gem", chance = 2000},
	{name = "violet gem", chance = 500},
	{name = "demonrage sword", chance = 410},
}

mType:register(monster)





