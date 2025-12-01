local mType = Game.createMonsterType("venom")
local monster = {}

monster.name = "venom"
monster.description = "a venom"
monster.experience = 110000
monster.outfit = {
	lookType = 285,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 455
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Forbidden Lands, on top of a hill in the northern part of the Arena and Zoo Quarter, \z
		Lower Spike, Truffels Garden and Mushroom Gardens.",
}

monster.health = 53700
monster.maxHealth = 53700
monster.runHealth = 100
monster.race = "undead"
monster.corpse = 8105
monster.speed = 350
monster.summonCost = 0

monster.changeTarget = {
	interval = 350,
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
	canPushCreatures = false,
	staticAttackChance = 80,
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
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = -2300, maxDamage = -3000},
	{name ="combat", interval = 2000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -28000, maxDamage = -35000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_CARNIPHILA}
}

monster.defenses = {
	defense = 30,
	armor = 30
}

monster.loot = {
	{name = "backpack of holding", chance = 500},
	{name = "warlord sword", chance = 50},
	{name = "camouflage backpack", chance = 500},
	{name = "pirate backpack", chance = 500},
	{name = "beach backpack", chance = 500},
	{name = "fur backpack", chance = 500},
	{id = 7366, chance = 50},
	{id = 7426, chance = 50},
	{name = "experience scroll", chance = 300},
	-- {id = 9743, chance = 2500}
}

mType:register(monster)




