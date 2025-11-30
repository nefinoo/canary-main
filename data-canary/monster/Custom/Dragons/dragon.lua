local mType = Game.createMonsterType("dragon")
local monster = {}

monster.name = "dragon"
monster.description = "a dragon"
monster.experience = 2000
monster.outfit = {
	lookType = 34,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 2000
monster.maxHealth = 2000
monster.runHealth = 300
monster.race = "blood"
monster.corpse = 5973
monster.speed = 180
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
	{text = "GROOAAARRR", yell = true},
	{text = "FCHHHHH", yell = true}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -90, maxDamage = -150},
	{name ="combat", interval = 4000, chance = 60, type = COMBAT_FIREDAMAGE, minDamage = -188, maxDamage = -220, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 3000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -188, maxDamage = -220, length = 8, spread = 3, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 18,
	armor = 25,
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_HEALING, minDamage = 34, maxDamage = 56, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name = "worm", chance = 50000, maxCount = 10},
	{name = "dragon ham", chance = 20000, maxCount = 2},
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "mace", chance = 20000},
	{id = 3349, chance = 6666},
	{name = "dragon hammer", chance = 1333},
	{name = "steel shield", chance = 1818},
	{name = "short sword", chance = 20000},
	{name = "plate legs", chance = 2222},
	{name = "steel helmet", chance = 3333},
	{name = "double axe", chance = 4000},
	{name = "dragonbone staff", chance = 4000},
	{name = "longsword", chance = 5000},
	-- {id = 3449, chance = 4000, maxCount = 10},
	{name = "green dragon leather", chance = 4000},
	{id = 2853, chance = 100000, child = {
			{name = "wand of inferno", chance = 1111},
			{name = "gold coin", chance = 100000, maxCount = 25},
			{name = "dragon shield", chance = 600},
			{name = "small diamond", chance = 1538, maxCount = 3},
			{name = "life crystal", chance = 2000},
			{name = "broadsword", chance = 6666},
			{name = "serpent sword", chance = 509},
			{name = "green dragon scale", chance = 5000}
		}
	}
}

mType:register(monster)




