local mType = Game.createMonsterType("little puppy")
local monster = {}

monster.name = "little puppy"
monster.description = "a little puppy"
monster.experience = 14500000
monster.outfit = {
	lookType = 32,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 18500
monster.maxHealth = 18500
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

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1307, maxDamage = -1350},
	{name ="combat", interval = 2000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -1307, maxDamage = -1350, length = 8, spread = 3, effect = CONST_ME_POISONAREA},
	{name ="combat", interval = 2000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -1307, maxDamage = -1350, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 3000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -1307, maxDamage = -1350, length = 8, spread = 3, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -1307, maxDamage = -1350, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 35,
	armor = 25
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 4},
	{name = "platinum coin", chance = 70000, maxCount = 8},
	{name = "experience scroll", chance = 500, maxCount = 2},
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
	{id = 28537, chance = 250}, --ritual sword
	{name = "crown armor", chance = 1500},
	{name = "crown legs", chance = 1000},
	{name = "crown helmet", chance = 2000},
	{name = "crown shield", chance = 2250},
	{name = "demonic essence", chance = 1818},
	{name = "fire axe", chance = 1500},
	{name = "yellow gem", chance = 3500},
	{name = "green gem", chance = 2000},
	{name = "demonrage sword", chance = 410},
}

mType:register(monster)





