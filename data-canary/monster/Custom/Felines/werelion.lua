local mType = Game.createMonsterType("Werelion")
local monster = {}

-- Entra en furia una sola vez al bajar de 30% de vida.
local berserkState = {}
local werelionBerserk = CreatureEvent("WerelionLevel10000Berserk")

function werelionBerserk.onThink(creature, interval)
	local lion = creature:getMonster()
	if not lion then
		return true
	end

	local lionId = lion:getId()
	if berserkState[lionId] then
		return true
	end

	if lion:getHealth() <= math.floor(lion:getMaxHealth() * 0.30) then
		berserkState[lionId] = true
		lion:changeSpeed(80)
		lion:say("THE HUNT ENDS NOW!", TALKTYPE_MONSTER_YELL)
		lion:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
	end

	return true
end

werelionBerserk:register()

local werelionBerserkDeath = CreatureEvent("WerelionLevel10000BerserkDeath")
function werelionBerserkDeath.onDeath(creature)
	berserkState[creature:getId()] = nil
	return true
end
werelionBerserkDeath:register()


monster.description = "a werelion"
monster.experience = 5500000000
monster.outfit = {
	lookType = 1301,
	lookHead = 58,
	lookBody = 2,
	lookLegs = 94,
	lookFeet = 10,
	lookAddons = 3,
	lookMount = 0,
}

monster.raceId = 1965
monster.Bestiary = {
	class = "Lycanthrope",
	race = BESTY_RACE_LYCANTHROPE,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Lion Sanctum.",
}

monster.health = 2400000
monster.maxHealth = 2400000
monster.race = "blood"
monster.corpse = 33825
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 20,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 5,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
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
}

monster.loot = {
	{ name = "platinum coin", chance = 100000, maxCount = 5 },
	{ name = "great spirit potion", chance = 100000, maxCount = 2 },
	{ name = "small enchanted ruby", chance = 5000, maxCount = 2 },
	{ name = "meat", chance = 5000, maxCount = 2 },
	{ name = "crystal sword", chance = 5000 },
	{ name = "lion's mane", chance = 5000 },
	{ name = "silver brooch", chance = 1500 },
	{ name = "small diamond", chance = 1500, maxCount = 2 },
	{ name = "war hammer", chance = 1500 },
	{ name = "doublet", chance = 1500 },
	{ name = "dark shield", chance = 1500 },
	{ name = "titan axe", chance = 1500 },
	{ name = "spiked squelcher", chance = 1500 },
	{ name = "glorious axe", chance = 1500 },
	{ name = "spirit cloak", chance = 1500 },
	{ name = "onyx chip", chance = 1500 },
	{ name = "coral brooch", chance = 1500 },
	{ name = "ivory carving", chance = 1500 },
	{ name = "rainbow quartz", chance = 1500 },
	{ name = "noble axe", chance = 500 },
	{ name = "white silk flower", chance = 500 },
	{ name = "lion figurine", chance = 100 },
}

monster.attacks = {
	{ name = "melee", interval = 1800, chance = 100, minDamage = -25000, maxDamage = -55000 },
	{ name = "werelion wave", interval = 2000, chance = 20, minDamage = -25000, maxDamage = -48000, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HOLYDAMAGE, minDamage = -42000, maxDamage = -65000, range = 3, effect = CONST_ME_HOLYAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HOLYDAMAGE, minDamage = -35000, maxDamage = -58000, range = 3, shootEffect = CONST_ANI_HOLY, target = true },
}

monster.defenses = {
	defense = 65,
	armor = 85,
	mitigation = 2.30,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 30000, maxDamage = 60000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -25 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 45 },
}

monster.events = {
	"WerelionLevel10000Berserk",
	"WerelionLevel10000BerserkDeath",
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)

