local mType = Game.createMonsterType("Satan")
local monster = {}

monster.name = "Satan"
monster.description = "the adversary"
monster.experience = 50000000000
monster.outfit = {
	lookType = 248,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.events = {
    "satanDeath"
}

monster.health = 11500000
monster.maxHealth = 11500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 7091
monster.speed = 420
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
	{text = "I will taste your FLESH!", yell = true},
	{text = "You will be frozen by man's sin!", yell = true}
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
	{name ="combat", interval = 1000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -50000, maxDamage = -100000, range = 6, radius = 1, target = true, shootEffect = CONST_ANI_ETHEREALSPEAR, effect = CONST_ME_ENERGYAREA},
	{name ="combat", interval = 1500, chance = 95, type = COMBAT_DEATHDAMAGE, minDamage = -20000, maxDamage = -45000, radius = 6, target = false, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 45,
	armor = 10,
	{name ="combat", interval = 1000, chance = 95, type = COMBAT_HEALING, minDamage = 175666, maxDamage = 245000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 3028, chance = 100, description2 = "tear of satan"},
	-- {name = "bullseye potion", chance = 3000, description2 = "soul potion"},
}

mType:register(monster)





