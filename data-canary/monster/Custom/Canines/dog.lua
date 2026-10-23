local mType = Game.createMonsterType("little puppy")
local monster = {}

monster.name = "little puppy"
monster.description = "a little puppy"
monster.experience = 146000000
monster.outfit = {
	lookType = 32,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 70000
monster.maxHealth = 70000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5971
monster.speed = 500
monster.summonCost = 0

monster.changeTarget = {
	interval = 500,
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
	staticAttackChance = 60,
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
	{text = "GROOOWL!", yell = false},
	{text = "GRRRRR!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
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

-- Frozen Hell / Knight progression: Little Puppy
monster.attacks = {
	{name = "melee", interval = 1500, chance = 100, minDamage = -1300, maxDamage = -1750},
	{name = "combat", interval = 3000, chance = 70, type = COMBAT_PHYSICALDAMAGE, minDamage = -1450, maxDamage = -1950, length = 5, spread = 2, effect = CONST_ME_POISONAREA},
	{name = "combat", interval = 4000, chance = 65, type = COMBAT_PHYSICALDAMAGE, minDamage = -1350, maxDamage = -1750, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 35,
	armor = 25
}

-- Frozen Hell: common NPC resale drops plus extremely rare old-set pieces.
monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 4},
	{name = "platinum coin", chance = 100000, maxCount = 25},
	{name = "experience scroll", chance = 1800},
	{name = "crown armor", chance = 1700},
	{name = "crown legs", chance = 1400},
	{name = "magic plate armor", chance = 500},
	{name = "demonrage sword", chance = 500},
	{name = "green gem", chance = 2300},
	{name = "yellow gem", chance = 4000},
	{name = "demonic essence", chance = 4600},
	{name = "small diamond", chance = 22000, maxCount = 4},
	{id = 3399, chance = 45},
	{id = 8095, chance = 45},
	{id = 3408, chance = 45}
}

mType:register(monster)





