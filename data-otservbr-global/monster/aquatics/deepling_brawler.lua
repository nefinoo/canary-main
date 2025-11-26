local mType = Game.createMonsterType("Deepling Brawler")
local monster = {}

monster.name = "Deepling Brawler"
monster.description = "a deepling brawler"
monster.experience = 2700000

monster.outfit = {
	lookType = 470,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 400000
monster.maxHealth = 400000
monster.race = "blood"
monster.corpse = 12685
monster.speed = 430

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
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
	illusionable = false,
	isPreyExclusive = true
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Grrrlljhhh!!", yell = false}
}

-- Brawler = más físico
monster.attacks = {
	{name = "melee", interval = 2000, chance = 100, minDamage = -9000, maxDamage = -14000, effect = CONST_ME_DRAWBLOOD},
	{name = "combat", interval = 2000, chance = 25, type = COMBAT_DROWNDAMAGE,
		minDamage = -8000, maxDamage = -11000, range = 7,
		shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_LOSEENERGY, target = true}
}

monster.defenses = {
	defense = 60,
	armor = 65,
	{name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING,
	 minDamage = 15000, maxDamage = 22000, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 20},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE, percent = 0},
	{type = COMBAT_DEATHDAMAGE, percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true}
}

monster.loot = {
	{name = "platinum coin", chance = 96000, maxCount = 90},
	{name = "deepling scales", chance = 15000},
	{name = "eye of a deepling", chance = 8000},
	{name = "fish fin", chance = 1500},
	{name = "experience scroll", chance = 2500}
}

mType:register(monster)
