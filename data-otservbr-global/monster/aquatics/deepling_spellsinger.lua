local mType = Game.createMonsterType("Deepling Spellsinger")
local monster = {}

monster.name = "Deepling Spellsinger"
monster.description = "a deepling spellsinger"
monster.experience = 3500000

monster.outfit = {
	lookType = 443,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500000
monster.maxHealth = 500000
monster.race = "blood"
monster.corpse = 13771
monster.speed = 410

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
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Jey Obu giotja!!", yell = false},
	{text = "Mmmmmoooaaaaahaaa!!", yell = false}
}

-- Daño mágico fuerte
monster.attacks = {
	{name = "melee", interval = 2000, chance = 100, minDamage = -6000, maxDamage = -9000, effect = CONST_ME_DRAWBLOOD},

	-- Ice tornado grande (mago)
	{name = "combat", interval = 2000, chance = 30, type = COMBAT_ICEDAMAGE,
	 minDamage = -12000, maxDamage = -16000, radius = 4, effect = CONST_ME_ICETORNADO, target = false},

	-- Drown damage mágico
	{name = "combat", interval = 2000, chance = 25, type = COMBAT_DROWNDAMAGE,
	 minDamage = -9000, maxDamage = -13000, radius = 4, effect = CONST_ME_BUBBLES, target = true},

	-- Life drain AOE
	{name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN,
	 minDamage = -8000, maxDamage = -13000, length = 8, spread = 3, effect = CONST_ME_SMALLPLANTS, target = false},

	-- Mana drain AOE
	{name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN,
	 minDamage = -4000, maxDamage = -7000, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 70,
	{name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING,
	 minDamage = 20000, maxDamage = 26000, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 20},
	{type = COMBAT_MANADRAIN, percent = 20},
	{type = COMBAT_DROWNDAMAGE, percent = 30},
	{type = COMBAT_ICEDAMAGE, percent = 40},
	{type = COMBAT_HOLYDAMAGE, percent = 0},
	{type = COMBAT_DEATHDAMAGE, percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true}
}

monster.loot = {
	{name = "platinum coin", chance = 80120},
	{name = "platinum coin", chance = 75000, maxCount = 120},
	{name = "spellsinger's seal", chance = 20000},
	{name = "deepling filet", chance = 18000},
	{name = "key to the drowned library", chance = 12000},
	{name = "small sapphire", chance = 3500},
	{name = "eye of a deepling", chance = 4000},
	{name = "experience scroll", chance = 2500}
}

mType:register(monster)
