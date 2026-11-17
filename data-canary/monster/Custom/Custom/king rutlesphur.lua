local mType = Game.createMonsterType("King Rutlesphur")
local monster = {}

monster.name = "King Rutlesphur"
monster.description = "the king"
monster.experience = 100000000000
monster.outfit = {
	lookType = 332,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000000
monster.maxHealth = 30000000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6080
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 400,
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
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 200, attack = 200},
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_PHYSICALDAMAGE, minDamage = -2000, maxDamage = -2500, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ARROW, effect = CONST_ME_STUN},
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -2000, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS}
}

monster.defenses = {
	defense = 20,
	armor = 30,
	{name ="combat", interval = 1000, chance = 40, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 1500, effect = CONST_ME_MAGIC_BLUE}
}

monster.events = {
	"CombatKing",
	"KillKing"
}

monster.loot = {
}

mType:register(monster)





