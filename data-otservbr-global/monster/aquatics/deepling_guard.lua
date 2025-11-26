local mType = Game.createMonsterType("Deepling Guard")
local monster = {}

monster.name = "Deepling Guard"
monster.description = "a deepling guard"
monster.experience = 4200000

monster.outfit = {
	lookType = 442,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 550000
monster.maxHealth = 550000
monster.race = "blood"
monster.corpse = 13750
monster.speed = 400

monster.changeTarget = {
	interval = 3000,
	chance = 15
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	illusionable = false
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "QJELL NETA NA!!", yell = true}
}

-- Ataques nivel 2300, tipo tanque físico
monster.attacks = {
	{name = "melee", interval = 2000, chance = 100, minDamage = -12000, maxDamage = -17000, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE,
	 minDamage = -8000, maxDamage = -12000, range = 7,
	 shootEffect = CONST_ANI_WHIRLWINDSWORD, target = true},
	{name = "combat", interval = 2000, chance = 20, type = COMBAT_DROWNDAMAGE,
	 minDamage = -9000, maxDamage = -13000, range = 7,
	 shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_LOSEENERGY, target = true}
}

monster.defenses = {
	defense = 70,
	armor = 75,
	{name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING,
	 minDamage = 20000, maxDamage = 26000, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 20},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE, percent = 5},
	{type = COMBAT_DEATHDAMAGE, percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 180},
	{name = "platinum coin", chance = 70000, maxCount = 5},
	{name = "great mana potion", chance = 20000, maxCount = 4},
	{name = "great health potion", chance = 20000, maxCount = 4},
	{name = "deepling breaktime snack", chance = 18000},
	{name = "deepling guard belt buckle", chance = 14000},
	{name = "deepling claw", chance = 11000},
	{name = "eye of a deepling", chance = 10000},
	{name = "small sapphire", chance = 3500, maxCount = 5},
	{name = "deepling backpack", chance = 450},
	{name = "experience scroll", chance = 3000}
}

mType:register(monster)
