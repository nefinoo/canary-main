local mType = Game.createMonsterType("Deepling Scout")
local monster = {}

monster.name = "Deepling Scout"
monster.description = "a deepling scout"
monster.experience = 2500000

monster.outfit = {
	lookType = 413,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 350000
monster.maxHealth = 350000
monster.race = "blood"
monster.corpse = 12684
monster.speed = 450

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
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	illusionable = false
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text="Njaaarh!!", yell=false},
	{text="Begjone, intrjuder!!", yell=false}
}

-- Resistencia equilibrada para nivel 2000
monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE, percent = 0},
	{type = COMBAT_DEATHDAMAGE, percent = 0}
}

monster.immunities = {
	{type="paralyze", condition=true},
	{type="invisible", condition=true},
	{type="drunk", condition=true}
}

-- Daño nivel 2000
monster.attacks = {
	{name="melee", interval=2000, chance=100, minDamage=-8000, maxDamage=-12000, effect=CONST_ME_DRAWBLOOD},
	{name="combat", interval=1500, chance=35, type=COMBAT_DROWNDAMAGE, minDamage=-7000, maxDamage=-10000, range=7, shootEffect=CONST_ANI_SPEAR, effect=CONST_ME_LOSEENERGY, target=true}
}

-- Defense escalada
monster.defenses = {
	defense = 55,
	armor = 60,
	{name="combat", interval=2000, chance=20, type=COMBAT_HEALING, minDamage=15000, maxDamage=20000, effect=CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{name="platinum coin", chance=75000, maxCount=100},
	{name="small emerald", chance=1000},
	{name="rusted armor", chance=500},
	{name="fish fin", chance=600},
	{name="eye of a deepling", chance=700},
	{name="experience scroll", chance=2000}
}

mType:register(monster)
