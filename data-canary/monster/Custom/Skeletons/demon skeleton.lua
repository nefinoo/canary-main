local mType = Game.createMonsterType("hell soldier")
local monster = {}

monster.name = "hell soldier"
monster.description = "a hell soldier"
monster.experience = 25000000
monster.outfit = {
	lookType = 37,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15500
monster.maxHealth = 15500
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5963
monster.speed = 230
monster.summonCost = 0

monster.changeTarget = {
	interval = 220,
	chance = 10
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1223, maxDamage = -1500},
	{name ="combat", interval = 2000, chance = 65, type = COMBAT_PHYSICALDAMAGE, minDamage = -1223, maxDamage = -1500, range = 1, radius = 1, target = true}
}

monster.defenses = {
	defense = 25,
	armor = 25
}

-- Frozen Hell: Knight level 750-1000; ~5,075 gp expected NPC-sale loot per kill.
-- Throwing Star (item 3287) remains exclusive to the level-100 weapon quest.
monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 20},
	{name = "platinum coin", chance = 100000, maxCount = 10},
	{name = "crystal coin", chance = 25000},
	{name = "experience scroll", chance = 1000},
	{name = "fire axe", chance = 1000},
	{name = "green gem", chance = 2500},
	{name = "yellow gem", chance = 6000},
	{name = "demon shield", chance = 700},
}

mType:register(monster)




