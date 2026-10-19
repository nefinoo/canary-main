local mType = Game.createMonsterType("City Guardian")
local monster = {}

monster.description = "a city guardian"

monster.experience = 0

monster.outfit = {
    lookType = 129,
}

monster.health = 100000
monster.maxHealth = 100000

monster.speed = 200
monster.race = "blood"
monster.corpse = 0

monster.changeTarget = {
    interval = 2000,
    chance = 0,
}

monster.flags = {
    summonable = false,
    attackable = false,
    hostile = false,
    convinceable = false,
    pushable = false,
    canPushItems = true,
    canPushCreatures = true,
    targetDistance = 1,
    runHealth = 0,
}

monster.voices = {
    interval = 10000,
    chance = 10,
    { text = "The city is safe under my watch.", yell = false },
    { text = "Monsters shall not pass!", yell = false },
}

monster.events = {
    "CityGuardianThink",
}

mType:register(monster)