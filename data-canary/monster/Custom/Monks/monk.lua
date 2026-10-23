local mType = Game.createMonsterType("arch angel")
local monster = {}

monster.name = "arch angel"
monster.description = "an arch angel"
monster.experience = 57000000
monster.outfit = {
	lookType = 57,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 32000
monster.maxHealth = 32000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 220
monster.summonCost = 0

monster.changeTarget = {
	interval = 220,
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
	{text = "A prayer to the almighty one!", yell = false},
	{text = "I will punish the sinners!", yell = false},
	{text = "Repent Heretic!", yell = false}
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

-- Frozen Hell / Knight progression: Arch Angel
monster.attacks = {
	{name = "melee", interval = 1500, chance = 100, minDamage = -1150, maxDamage = -1450},
	{name = "combat", interval = 3500, chance = 55, type = COMBAT_PHYSICALDAMAGE, minDamage = -1450, maxDamage = -2050, range = 1, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 22,
	armor = 20,
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 600, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 10, speed = {min = 300, max = 300}, duration = 3000, effect = CONST_ME_MAGIC_RED}
}

-- Frozen Hell: common NPC resale drops plus extremely rare old-set pieces.
monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 2},
	{name = "platinum coin", chance = 100000, maxCount = 20},
	{name = "experience scroll", chance = 1200},
	{name = "crown armor", chance = 1600},
	{name = "crown legs", chance = 1200},
	{name = "magic plate armor", chance = 650},
	{name = "green gem", chance = 1800},
	{name = "yellow gem", chance = 4000},
	{name = "demonic essence", chance = 3000},
	{name = "fire axe", chance = 1500},
	{id = 3399, chance = 35}, -- old rare gear; quest weapons remain quest-exclusive,
	{id = 8095, chance = 35},
	{id = 3408, chance = 35}
}

mType:register(monster)





