local mType = Game.createMonsterType("Deepling Elite")
local monster = {}

monster.name = "Deepling Elite"
monster.description = "a deepling elite"
monster.experience = 5000000

monster.outfit = {
	lookType = 441,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 600000
monster.maxHealth = 600000
monster.race = "blood"
monster.corpse = 13713
monster.speed = 380

monster.changeTarget = {
	interval = 3000,
	chance = 20
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	isPreyExclusive = true
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "*glub glub*", yell = false}
}

-- Ataques élite: fuerte melee + ataque a distancia
monster.attacks = {
	{name="melee", interval=2000, chance=100, minDamage=-14000, maxDamage=-22000, effect=CONST_ME_DRAWBLOOD},
	{name="combat", interval=1500, chance=30, type=COMBAT_PHYSICALDAMAGE,
		minDamage=-12000, maxDamage=-18000, range=7, shootEffect=CONST_ANI_LARGEROCK,
		effect=CONST_ME_HITAREA, target=true}
}

monster.defenses = {
	defense = 75,
	armor = 80,
	{name="combat", interval=2000, chance=20, type=COMBAT_HEALING,
		minDamage=25000, maxDamage=35000, effect=CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 15},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 10},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 20},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE, percent = 0},
	{type = COMBAT_DEATHDAMAGE, percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 200},
	{name = "great health potion", chance = 30000},
	{name = "great mana potion", chance = 28000},
	{name = "deepling filet", chance = 28000},
	{name = "eye of a deepling", chance = 26000},
	{name = "deepling warts", chance = 24000},
	{name = "deeptags", chance = 21000},
	{name = "deepling ridge", chance = 19000},
	{name = "small emerald", chance = 8000, maxCount = 3},
	{name = "warrior's shield", chance = 2000},
	{name = "experience scroll", chance = 3000}
}

mType:register(monster)
