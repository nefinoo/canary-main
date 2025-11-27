local mType = Game.createMonsterType("Infested Human")
local monster = {}

monster.name = "Infested Human"
monster.description = "an infested human"
monster.experience = 100000
monster.outfit = {
	lookType = 323,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 60000
monster.maxHealth = 60000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 9094
monster.speed = 320
monster.summonCost = 0

monster.changeTarget = {
	interval = 320,
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
	{text = "HEEEEEEEELP!", yell = false},
	{text = "Oh by the gods! What is this... aaaaaargh!", yell = false},
	{text = "Run as fast as you can.", yell = false},
	{text = "Science... is a curse.", yell = false},
	{text = "Take that creature off my back!! I can fell it!", yell = false},
	{text = "You will be the next infected one... GRAAAAAAAAARRR!", yell = false}
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
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 220, attack = 220, condition = {type = CONDITION_POISON, startDamage = 300, interval = 5000}},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -2500, length = 8, spread = 3, effect = CONST_ME_POISONAREA}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.loot = {
	{name = "crystal coin", chance = 50000, maxCount = 10},
	{name = "warlord sword", chance = 50},
	{name = "experience scroll", chance = 2000},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




