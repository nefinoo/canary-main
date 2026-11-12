local mType = Game.createMonsterType("dragon")
local monster = {}

monster.name = "dragon"
monster.description = "a dragon"
monster.experience = 70000
monster.outfit = {
	lookType = 34,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 34
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Thais Ancient Temple, Darashia Dragon Lair, Mount Sternum Dragon Cave, Mintwallin, \z
		deep in Fibula Dungeon, Kazordoon Dragon Lair (near Dwarf Bridge), Plains of Havoc, Elven Bane castle, \z
		Maze of Lost Souls, southern cave and dragon tower in Shadowthorn, Orc Fortress, Venore Dragon Lair, \z
		Pits of Inferno, Behemoth Quest room in Edron, Hero Cave, deep Cyclopolis, Edron Dragon Lair, Goroma, \z
		Ankrahmun Dragon Lairs, Draconia, Dragonblaze Peaks, some Ankrahmun Tombs, \z
		underground of Fenrock (on the way to Beregar), Krailos Steppe and Crystal Lakes.",
}


monster.health = 880
monster.maxHealth = 880
monster.runHealth = 100
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
	{type = COMBAT_ENERGYDAMAGE, percent = -30},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -30},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -28, maxDamage = -72},
	{name ="combat", interval = 4000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -22, maxDamage = -65, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -25, maxDamage = -72, length = 8, spread = 3, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 18,
	armor = 25,
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_HEALING, minDamage = 12, maxDamage = 25, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{ name = "experience scroll", chance = 30 }, -- Bronze ID 51670; venta a Nephy 50000 gp
	-- Oro, comida y pociones de caceria (nivel 50)
	{ name = "gold coin", chance = 90000, maxCount = 55 },
	{ name = "dragon ham", chance = 40000, maxCount = 3 },
	{ name = "health potion", chance = 8000 },
	{ name = "mana potion", chance = 7500 },
	{ name = "strong health potion", chance = 2700 },
	{ name = "strong mana potion", chance = 2300 },
	-- Materiales originales de criatura y bag de addon
	{ name = "green dragon leather", chance = 3500 },
	{ name = "green dragon scale", chance = 5000 },
	{ id = 12413, chance = 9000 },
	-- Plate Set: frecuente comparado con Knight y Crown
	{ name = "plate armor", chance = 6500 },
	{ name = "plate legs", chance = 6000 },
	{ name = "steel helmet", chance = 7000 },
	{ name = "bonelord shield", chance = 6000 },
	-- Armas de la etapa
	{ name = "barbarian axe", chance = 6500 },
	{ name = "clerical mace", chance = 5500 },
	{ id = 7385, chance = 5500 },
	-- Knight Set: raro
	{ name = "knight armor", chance = 2400 },
	{ name = "knight legs", chance = 2200 },
	{ name = "knight axe", chance = 1600 },
	{ name = "devil helmet", chance = 1400 },
	{ name = "tower shield", chance = 1200 },
	-- Crown Set: muy raro
	{ name = "crown armor", chance = 110 },
	{ name = "crown legs", chance = 110 },
	{ name = "crown helmet", chance = 150 },
	{ name = "crown shield", chance = 100 },
	-- Botas de progresion por set
	{ id = 3079, chance = 1200 }, -- Boots of Haste: Knight Set
	{ id = 10386, chance = 100 }, -- Zaoan Shoes: Crown Set
}

mType:register(monster)





