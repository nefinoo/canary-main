local mType = Game.createMonsterType("Atilla the Hun")
local monster = {}

monster.name = "Atilla the Hun"
monster.description = "the scourge of God"
monster.experience = 5000000
monster.outfit = {
	lookType = 131,
	lookHead = 114,
	lookBody = 132,
	lookLegs = 132,
	lookFeet = 132,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1000000
monster.maxHealth = 1000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 111
monster.speed = 5000
monster.summonCost = 0

monster.changeTarget = {
	interval = 5420,
	chance = 10
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
	staticAttackChance = 1,
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
	interval = 2200,
	chance = 50,
	{text = "I will kill you the way I killed everyone else!", yell = true},
	{text = "You are going to be dead soon..", yell = true}
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
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -15000, maxDamage = -19500, range = 1, radius = 1, target = true, effect = CONST_ME_HITAREA}
}

monster.defenses = {
	defense = 45,
	armor = 10,
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 15000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "cobrafang dagger", chance = 5},
	{name = "war hammer", chance = 95},
	{name = "obsidian lance", chance = 95},
	{name = "orcish axe", chance = 5}
}

mType:register(monster)




