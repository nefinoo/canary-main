-- =========================================================
-- THE MIRROR SOVEREIGN
-- Boss 5 - Hall of Reflections
-- Nivel recomendado: 10000+
-- =========================================================

local BOSS_NAME = "The Mirror Sovereign"

-- Idea principal:
-- * Cada 20 segundos crea 3 copias.
-- * Solo una copia es vulnerable (la verdadera).
-- * Las otras reciben 0 daño y desaparecen tras 15 segundos.
-- * Al destruir la copia correcta el boss queda aturdido 5 segundos
--   y recibe +50% daño durante ese tiempo.

local monsterType = Game.createMonsterType(BOSS_NAME)
local monster = {}

monster.description = "the mirror sovereign"

monster.experience = 620000000

monster.outfit = {
    lookType = 130,
    lookHead = 114,
    lookBody = 114,
    lookLegs = 114,
    lookFeet = 114,
    lookAddons = 3
}

monster.health = 1050000000
monster.maxHealth = 1050000000

monster.race = "blood"
monster.speed = 270
monster.corpse = 5995

monster.changeTarget = {
    interval = 3000,
    chance = 30
}

monster.strategiesTarget = {
    nearest = 35,
    damage = 35,
    health = 20,
    random = 10
}

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    illusionable = false,
    canPushItems = true,
    canPushCreatures = true,
    targetDistance = 4,
    staticAttackChance = 85,
    isBoss = true,
    isBlockable = false,
    canWalkOnEnergy = true,
    canWalkOnFire = true,
    canWalkOnPoison = true,
}

monster.light = {
    level = 9,
    color = 215
}

monster.attacks = {
{
    name="melee",
    interval=2000,
    chance=100,
    minDamage=-65000,
    maxDamage=-115000,
},
{
    name="combat",
    interval=2600,
    chance=30,
    type=COMBAT_DEATHDAMAGE,
    minDamage=-90000,
    maxDamage=-145000,
    range=7,
    shootEffect=CONST_ANI_SUDDENDEATH,
    effect=CONST_ME_MORTAREA,
    target=true,
},
{
    name="combat",
    interval=4200,
    chance=22,
    type=COMBAT_ENERGYDAMAGE,
    minDamage=-100000,
    maxDamage=-160000,
    radius=4,
    effect=CONST_ME_ENERGYAREA,
    target=false,
},
}

monster.defenses = {
    defense = 260,
    armor = 320,
    mitigation = 4.40,
{
    name="combat",
    type=COMBAT_HEALING,
    interval=6000,
    chance=18,
    minDamage=4500000,
    maxDamage=7500000,
    effect=CONST_ME_MAGIC_BLUE,
},
}

monster.elements = {
{type=COMBAT_PHYSICALDAMAGE,percent=20},
{type=COMBAT_ENERGYDAMAGE,percent=35},
{type=COMBAT_FIREDAMAGE,percent=30},
{type=COMBAT_ICEDAMAGE,percent=20},
{type=COMBAT_EARTHDAMAGE,percent=30},
{type=COMBAT_HOLYDAMAGE,percent=-15},
{type=COMBAT_DEATHDAMAGE,percent=40},
}

monster.immunities = {
{type="paralyze",condition=true},
{type="outfit",condition=true},
{type="invisible",condition=true},
{type="drunk",condition=true},
}

monster.voices = {
interval=5000,
chance=15,
{text="WHICH ONE IS REAL?", yell=true},
{text="YOUR EYES BETRAY YOU!", yell=true},
{text="BREAK THE WRONG REFLECTION!", yell=true},
}

monster.loot = {
{id=2148,chance=100000,maxCount=100},
{id=2152,chance=90000,maxCount=30},
}

monster.events = {
"BossGauntletDeath",
"MirrorSovereignThink",
"MirrorSovereignHealth",
"MirrorSovereignDeath",
}

monsterType:register(monster)

-- =========================================================
-- MECÁNICA
-- =========================================================
-- Cada 20 segundos:
--  • Invoca 3 reflejos idénticos.
--  • Uno es el verdadero.
--  • Los falsos son inmunes.
--  • Si el grupo destruye el verdadero:
--      - Boss queda paralizado 5 s.
--      - Recibe +50% daño.
--      - Las copias desaparecen.
--
-- Si destruyen primero copias falsas:
--      - Explosión espejo:
--          90k-160k daño sagrado.
--
-- A 50% HP:
--      - Invoca 5 copias.
--
-- A 20% HP:
--      - Las copias duran 10 s y aparecen cada 15 s.
