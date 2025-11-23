local mType = Game.createMonsterType("primitive")
local monster = {}

monster.name = "Primitive"
monster.description = "a Primitive"
monster.experience = 45
monster.outfit = {
	lookType = 143,
	lookHead = 1,
	lookBody = 1,
	lookLegs = 1,
	lookFeet = 1,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 200
monster.maxHealth = 200
monster.runHealth = 5
monster.race = "blood"
monster.corpse = 6080
monster.speed = 300
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
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
	{text = "We don't need a future!", yell = false},
	{text = "I'll rook you all!", yell = false},
	{text = "They thought they'd beaten us!", yell = false},
	{text = "You are history!", yell = false},
	{text = "There can only be one world!", yell = false},
	{text = "Valor who?", yell = false},
	{text = "Die noob!", yell = false},
	{text = "There are no dragons!", yell = false},
	{text = "I'll quit forever! Again ...", yell = false},
	{text = "You all are noobs!", yell = false},
	{text = "Beware of the cyclops!", yell = false},
	{text = "Just had a disconnect.", yell = false},
	{text = "Magic is only good for girls!", yell = false},
	{text = "We'll be back!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 30, attack = 16},
	{name ="drunk", interval = 1000, chance = 20, drunkenness = 25, duration = 10000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -20, maxDamage = -20, range = 7, radius = 3, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name = "outfit", interval = 1000, chance = 2, range = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 10000, outfitMonster = "primitive" },
}

monster.defenses = {
	defense = 25,
	armor = 20
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 10, description2 = "Gold Coin"},
	{name = "studded armor", chance = 50000, description2 = "Studded Armor"},
	{name = "studded helmet", chance = 50000, description2 = "Studded Helmet"},
	{name = "studded shield", chance = 1538, description2 = "Studded Shield"},
	{name = "sabre", chance = 2000, description2 = "Sabre"},
	{id = 3274, chance = 2000, description2 = "Axe"},
	{id = 6570, chance = 5538, description2 = "Blue Surprise Bag"},
	{id = 6571, chance = 1538, description2 = "Red Surprise Bag"}
}

mType:register(monster)



