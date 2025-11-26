local mType = Game.createMonsterType("Leaviathan")
local monster = {}

monster.name = "Leaviathan"
monster.description = "a guardian of the ocean"
monster.experience = 70000000
monster.outfit = {
	lookType = 1542,
	lookAddons = 3,
}

monster.bosstiary = {
	bossRaceId = 8004,
	bossRace = RARITY_NEMESIS,
}

monster.health = 5500000
monster.maxHealth = 5500000
monster.race = "blood"
monster.corpse = 39712
monster.speed = 120
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,

	healthHidden = false,

	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Harmony is just a vain illusion! ", yell = false },
	{ text = " I'm ashamed of my former self! ", yell = false },
	{ text = " You won't lead me astray!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 100000, maxCount = 22 },
	{ name = "ultimate mana potion", chance = 32653, maxCount = 14 },
	{ name = "ultimate health potion", chance = 30612, maxCount = 14 },
	{ name = "bullseye potion", chance = 24490, maxCount = 5 },
	{ name = "berserk potion", chance = 22449, maxCount = 5 },
	{ name = "mastermind potion", chance = 18367, maxCount = 5 },
	{ name = "naga basin", chance = 12245 },
	{ name = "piece of timira's sensors", chance = 10204 },
	{ name = "giant amethyst", chance = 6122 },
	{ name = "giant ruby", chance = 4082 },
	{ name = "giant emerald", chance = 4082 },
	{ name = "one of timira's many heads", chance = 2041 },
	{ name = "giant sapphire", chance = 2041 },
	{ name = "giant topaz", chance = 2041 },
	{ name = "dawnfire sherwani", chance = 200 },
	{ name = "frostflower boots", chance = 200 },
	{ id = 39233, chance = 200 }, -- enchanted turtle amulet
	{ name = "midnight tunic", chance = 200 },
	{ name = "midnight sarong", chance = 200 },
	{ name = "naga sword", chance = 200 },
	{ name = "naga axe", chance = 200 },
	{ name = "naga club", chance = 200 },
	{ name = "naga wand", chance = 200 },
	{ name = "naga rod", chance = 200 },
	{ name = "naga crossbow", chance = 200 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -13000, maxDamage = -17000 },

	{ name = "timira fire ring", interval = 3500, chance = 50, minDamage = -16500, maxDamage = -19500 },

	{ name = "death chain", interval = 2500, chance = 30, range = 3, target = true, 
		minDamage = -25000, maxDamage = -32000 },

	{ name = "mana drain chain", interval = 2500, chance = 20, minDamage = -12000, maxDamage = -16000 },

	{ name = "timira explosion", interval = 4200, chance = 40, minDamage = -45000, maxDamage = -70000 },

	{ name = "combat", interval = 5500, chance = 25, type = COMBAT_PHYSICALDAMAGE, 
		minDamage = -70000, maxDamage = -85000, length = 6, spread = 2, effect = CONST_ME_EXPLOSIONAREA, target = false },

	{ name = "combat", interval = 5000, chance = 60, type = COMBAT_ENERGYDAMAGE,
		minDamage = -26000, maxDamage = -50000, range = 1, radius = 1, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
}

monster.defenses = {
	defense = 68,
	armor = 92,
	mitigation = 1.78,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)




