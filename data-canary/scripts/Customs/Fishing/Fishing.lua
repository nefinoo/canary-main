local fishing = Action()
local waterIds = { 622, 4597, 4598, 4599, 4600, 12561, 12563, 4601, 4602, 4609, 4610, 4611, 4612, 4613, 4614, 629, 630, 631, 632, 633, 634, 7236, 9582, 13988, 13989, 12560, 21414 }
local lavaIds = {599, 600, 601, 23846, 23848, 23849, 23850, 23851, 23857, 23858, 23859, 23860, 23868, 23861, 23862, 23863, 23864, 23865, 23866, 23867}
local swampIds = {4691, 4692, 2693, 2694, 2695, 2696, 2697, 2698, 2699, 2700, 2701, 2702, 2703, 2704, 2705, 2706, 2707, 2708, 2709, 2710, 2711, 2712, 4749, 4750, 4751, 4752, 4753, 4754, 4755}
local tarIds = {708}

--[[
level - Level required to catch the fish.
fishing - Fishing level required to catch the fish.
vowel - If the name starts with a vowel set this to true. This is used when broadcasting a message to change a to an.
chance - Chance to catch the fish.
key - Used to store how many fish a player has caught
scroll - If players must have a fishing scroll active to catch the fish
bowlable - Monster is able to be bowled (You will need the bowl code that I release later on set to false for now)
serverBC - Broadcast the catch to all players online
broadcast - The message that will be broadcasted
]]--

local waterMonsters = {
    [1] = {name = "Manta Ray", level = 2000000, fishing = 140, chance = 100, key = 31, scroll = true, bowlable = true, serverBC = true, broadcast = "The ocean trembles as |PLAYERNAME| reels in the colossal Manta Ray from the deep abyss!"},
	[2] = {name = "Crustacea Gigantica", level = 1750000, fishing = 130, chance = 200, key = 30, scroll = true, bowlable = true, serverBC = true, broadcast = "The sea floor quakes as |PLAYERNAME| hooks the mighty Crustacea Gigantica!"},
	[3] = {name = "Oceanus", level = 1500000, fishing = 125, chance = 250, key = 29, scroll = true, bowlable = true, serverBC = true, broadcast = "The tides roar as |PLAYERNAME| disturbs the ancient god of the seas — Oceanus rises from the depths!"},
	[4] = {name = "Cicno", level = 1250000, fishing = 120, chance = 500, key = 28, scroll = true, bowlable = true, serverBC = true, broadcast = "Waves part and the celestial swan Cicno descends from the heavens, summoned by |PLAYERNAME|!"},
	[5] = {name = "Sigma", level = 1000000, fishing = 115, chance = 750, key = 27, scroll = true, bowlable = true, serverBC = true, broadcast = "The sea rumbles in chaos as |PLAYERNAME| awakens Sigma, the mechanical god of the abyss!"},
	[6] = {name = "Shesha", level = 900000, fishing = 110, chance = 1000, key = 26, scroll = true, bowlable = true, serverBC = true, broadcast = "The waters coil as the cosmic serpent Shesha emerges, summoned by |PLAYERNAME|!"},
	[7] = {name = "Leaviathan", level = 800000, fishing = 105, chance = 1334, key = 25, scroll = true, bowlable = true, serverBC = true, broadcast = "The seas split apart as |PLAYERNAME| has awoken the great Leaviathan!"},
	[8] = {name = "Escila", level = 700000, fishing = 90, chance = 1667, key = 24, scroll = true, bowlable = true, serverBC = true, broadcast = "Screams echo across the shore as Escila, the terror of sailors, surfaces to devour |PLAYERNAME|!"},
	[9] = {name = "Caribdis", level = 100000, fishing = 85, chance = 2000, key = 23, scroll = true, bowlable = true, serverBC = true, broadcast = "A massive whirlpool forms! Caribdis rises, dragging |PLAYERNAME| toward the abyss!"},
	[10] = {name = "Ryujin", level = 7500, fishing = 80, chance = 3000, key = 22, scroll = false, bowlable = true, serverBC = true, broadcast = "Lightning strikes the waves as |PLAYERNAME| summons Ryujin, the Dragon God of the Sea!"},
	[11] = {name = "Sea Serpent", level = 5000, fishing = 77, chance = 3500, key = 21, scroll = false, bowlable = true, serverBC = true, broadcast = "The ocean churns violently as |PLAYERNAME| has disturbed the mighty Sea Serpent!"},
    [12] = {name = "Wyrm", level = 3500, fishing = 75, chance = 4000, key = 20, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
	[13] = {name = "Deepling Elite", spawnName = "Fishing Deepling Elite", level = 3000, fishing = 72, chance = 4200, key = 19, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [14] = {name = "Deepling Guard", spawnName = "Fishing Deepling Guard", level = 2800, fishing = 70, chance = 4400, key = 18, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [15] = {name = "Deepling Spellsinger", spawnName = "Fishing Deepling Spellsinger", level = 2600, fishing =68, chance = 4600, key = 17, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [16] = {name = "Deepling Brawler", spawnName = "Fishing Deepling Brawler", level = 2400, fishing = 65, chance = 4800, key = 16, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [17] = {name = "Deepling Scout", spawnName = "Fishing Deepling Scout", level = 2200, fishing = 63, chance = 5000, key = 15, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [18] = {name = "Quara Predator", spawnName = "Fishing Quara Predator", level = 2000, fishing = 60, chance = 11000, key = 14, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [19] = {name = "Quara Pincher", spawnName = "Fishing Quara Pincher", level = 1750, fishing = 58, chance = 13500, key = 13, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [20] = {name = "Quara Mantassin", spawnName = "Fishing Quara Mantassin", level = 1500, fishing = 55, chance = 15000, key = 12, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [21] = {name = "Quara Hydromancer", spawnName = "Fishing Quara Hydromancer", level = 1300, fishing = 50, chance = 16500, key = 11, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [22] = {name = "Quara Constrictor", spawnName = "Fishing Quara Constrictor", level = 1000, fishing = 45, chance = 18000, key = 10, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [23] = {name = "Massive Water Elemental", spawnName = "Fishing Massive Water Elemental", level = 750, fishing = 40, chance = 22500, key = 9, scroll = false, bowlable = false, serverBC = false, broadcast = "A monstrous wave rises as |PLAYERNAME| has unleashed the wrath of the Massive Water Elemental!"},
	[24] = {name = "Blood crab", spawnName = "Fishing Blood Crab", level = 650, fishing = 38, chance = 24000, key = 8, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [25] = {name = "Water Elemental", spawnName = "Fishing Water Elemental", level = 500, fishing = 34, chance = 24500, key = 7, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [26] = {name = "Crab", spawnName = "Fishing Crab", level = 350, fishing = 30, chance = 25000, key = 6, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [27] = {name = "Shark", spawnName = "Fishing Shark", level = 250, fishing = 24, chance = 33500, key = 5, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [28] = {name = "Jellyfish", spawnName = "Fishing Jellyfish", level = 150, fishing = 17, chance = 34000, key = 4, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [29] = {name = "Northern Pike", spawnName = "Fishing Northern Pike", level = 100, fishing = 15, chance = 34500, key = 3, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [30] = {name = "Calamary", spawnName = "Fishing Calamary", level = 50, fishing = 12, chance = 35000, key = 2, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [31] = {name = "Fish", spawnName = "Fishing Fish", level = 8, fishing = 10, chance = 45000, key = 1, scroll = false, bowlable = false, serverBC = false, broadcast = ""}
}


-- Probabilidades acumuladas: cuanto menor el umbral, mas raro el monstruo.
local lavaMonsters = {
    [1] = {name = "Magma Crawler", level = 7500, fishing = 145, chance = 100, key = 43, scroll = true, bowlable = true, serverBC = true, broadcast = "How dare you |PLAYERNAME|. Do you think lava is some kind of TOY?!? I will show you how it feels to be burned. I Volcanis will send you to a FIERY GRAVE"},
    [2] = {name = "Draptor", level = 7000, fishing = 140, chance = 160, key = 42, scroll = true, bowlable = true, serverBC = true, broadcast = "|PLAYERNAME| flesh has been seared! A Molten Fury has appeared to scorch the lands!"},
    [3] = {name = "Morgaroth", level = 6500, fishing = 140, chance = 230, key = 41, scroll = true, bowlable = true, serverBC = true, broadcast = "The horrid smell of smoke has began to linger around the vicinity of |PLAYERNAME|. Lavos has come for his prey!"},
    [4] = {name = "Orshabaal", level = 6000, fishing = 140, chance = 320, key = 40, scroll = false, bowlable = true, serverBC = true, broadcast = "Pyria The Incinerator has entered the mortal realm to immolate |PLAYERNAME|!"},
    [5] = {name = "Hephaestus", level = 5500, fishing = 135, chance = 450, key = 39, scroll = false, bowlable = true, serverBC = true, broadcast = "A barrage of arrows zooms past |PLAYERNAME| head. Hephaestus has come to test |PLAYERNAME| might!"},
    [6] = {name = "The First Dragon", level = 5000, fishing = 130, chance = 600, key = 38, scroll = false, bowlable = true, serverBC = true, broadcast = "A Krakatoa has descended upon |PLAYERNAME|!"},
    [7] = {name = "Demodras", level = 4500, fishing = 125, chance = 800, key = 37, scroll = true, bowlable = true, serverBC = true, broadcast = "The ground around |PLAYERNAME| is torn asunder by a great force from below. Onyx has been unsealed!"},
    [8] = {name = "The Fire Empowered Duke", level = 4000, fishing = 125, chance = 1100, key = 36, scroll = false, serverBC = true, bowlable = true, broadcast = "|PLAYERNAME| has caused the lava to spit out a blazing hot Engorged Magmaworm!"},
    [9] = {name = "Samael", level = 3500, fishing = 120, chance = 1500, key = 35, scroll = true, bowlable = true, serverBC = true, broadcast = "Chimera, the three-headed demon has arose from Hell to obliterate |PLAYERNAME|!"},
    [10] = {name = "The Mega Magmaoid", level = 3000, fishing = 120, chance = 2100, key = 34, scroll = false, bowlable = true, serverBC = true, broadcast = "A wild Charmander appeared! |PLAYERNAME| used tail whip!"},
    [11] = {name = "Furyosa", level = 2500, fishing = 120, chance = 2800, key = 33, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Ember of Draconis"},
    [12] = {name = "Kerberos", level = 2500, fishing = 120, chance = 3600, key = 44, scroll = false, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| is being lit up by a Firebat!"},
    [13] = {name = "Dragon Lord", level = 2000, fishing = 120, chance = 4800, key = 32, scroll = false, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has awoken an Unstable Pyroclast!"},
    [14] = {name = "Dragon", level = 1500, fishing = 120, chance = 6500, key = 45, scroll = false, bowlable = true, serverBC = false, broadcast = "A Molten Magma Crab has appeared before |PLAYERNAME|!"},
    [15] = {name = "Demon", level = 1000, fishing = 120, chance = 8200, key = 46, scroll = false, bowlable = true},
    [16] = {name = "Diabolic Imp", level = 1000, fishing = 120, chance = 10500, key = 47, scroll = false, bowlable = true},
    [17] = {name = "Fire Devil", level = 1000, fishing = 120, chance = 13500, key = 48, scroll = false, bowlable = true},
    [18] = {name = "Shaburak Prince", level = 1000, fishing = 120, chance = 16500, key = 49, scroll = false, bowlable = true},
    [19] = {name = "Shaburak Lord", level = 1000, fishing = 120, chance = 20500, key = 50, scroll = false, bowlable = true},
    [20] = {name = "Shaburak Demon", level = 1000, fishing = 120, chance = 25500, key = 51, scroll = false, bowlable = true},
    [21] = {name = "Dragon Hatchling", level = 1000, fishing = 120, chance = 32000, key = 52, scroll = false, bowlable = true},
    [22] = {name = "Hellfire Fighter", level = 1000, fishing = 120, chance = 40000, key = 53, scroll = false, bowlable = true},
    [23] = {name = "Massive Fire Elemental", level = 1000, fishing = 120, chance = 49000, key = 54, scroll = false, bowlable = true},
    [24] = {name = "Fire Elemental", level = 1000, fishing = 120, chance = 60000, key = 55, scroll = false, bowlable = true}
}

-- Claves nuevas 100..123: el antiguo key=60 agrupaba las 24 capturas y no se puede desglosar.
local swampMonsters = {
    [1] = {name = "Hibernal Moth", level = 1000, fishing = 120, chance = 80, key = 100, scroll = true, bowlable = true, serverBC = false, broadcast = ""},
    [2] = {name = "Ladybug", level = 1000, fishing = 120, chance = 120, key = 101, scroll = true, bowlable = true, serverBC = false, broadcast = ""},
    [3] = {name = "Lisa", level = 1000, fishing = 120, chance = 180, key = 102, scroll = true, bowlable = true, serverBC = false, broadcast = ""},
    [4] = {name = "The Welter", level = 1000, fishing = 120, chance = 260, key = 103, scroll = true, bowlable = true, serverBC = false, broadcast = ""},
    [5] = {name = "Fleshslicer", level = 1000, fishing = 120, chance = 360, key = 104, scroll = true, bowlable = true, serverBC = false, broadcast = ""},
    [6] = {name = "Evil Mastermind", level = 1000, fishing = 120, chance = 500, key = 105, scroll = true, bowlable = true, serverBC = false, broadcast = ""},
    [7] = {name = "Shlorg", level = 1000, fishing = 120, chance = 680, key = 106, scroll = true, bowlable = true, serverBC = false, broadcast = ""},
    [8] = {name = "Plagueroot", level = 1000, fishing = 120, chance = 900, key = 107, scroll = true, bowlable = true, serverBC = false, broadcast = ""},
    [9] = {name = "Sulphur Scuttler", level = 1000, fishing = 120, chance = 1200, key = 108, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [10] = {name = "Fleshcrawler", level = 1000, fishing = 120, chance = 1550, key = 109, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [11] = {name = "The Old Widow", level = 1000, fishing = 120, chance = 2000, key = 110, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [12] = {name = "The Evil Eye", level = 1000, fishing = 120, chance = 2600, key = 111, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [13] = {name = "Poisonous Carnisylvan", level = 1000, fishing = 120, chance = 3400, key = 112, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [14] = {name = "Empowered Glooth Horror", level = 1000, fishing = 120, chance = 4400, key = 113, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [15] = {name = "Rot Elemental", level = 1000, fishing = 120, chance = 5600, key = 114, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [16] = {name = "Elder Bonelord", level = 1000, fishing = 120, chance = 7200, key = 115, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [17] = {name = "Bonelord", level = 1000, fishing = 120, chance = 9200, key = 116, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [18] = {name = "Gazer", level = 1000, fishing = 120, chance = 11800, key = 117, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [19] = {name = "Devourer", level = 1000, fishing = 120, chance = 15300, key = 118, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [20] = {name = "Sulphur Spouter", level = 1000, fishing = 120, chance = 19400, key = 119, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [21] = {name = "Acid Blob", level = 1000, fishing = 120, chance = 25000, key = 120, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [22] = {name = "Undertaker", level = 1000, fishing = 120, chance = 32000, key = 121, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [23] = {name = "Blemished Spawn", level = 1000, fishing = 120, chance = 42000, key = 122, scroll = false, bowlable = true, serverBC = false, broadcast = ""},
    [24] = {name = "Parasite", level = 1000, fishing = 120, chance = 56000, key = 123, scroll = false, bowlable = true, serverBC = false, broadcast = ""}
}

local tarMonsters = {
    [1] = {name = "???", level = 10000, fishing = 140, chance = 200, key = 80, scroll = true, bowlable = true, serverBC = true, broadcast = "|PLAYERNAME| has caught an ???!"},
}

-- Reglas compartidas por Fishing, !fishing, !catchs y /testfish.
-- "chance" es un umbral ACUMULADO sobre un unico roll por lanzamiento.
-- Scroll: se utiliza el storage 15000 que ya estaba indicado en el script original.
local catchMonstersRandom = 100000
local FISHING_SCROLL_STORAGE = 15000
local AREA_MIN_SKILL = {water = 10, lava = 120, swamp = 120, tar = 140}
local AREA_NAMES = {water = "Water", lava = "Lava", swamp = "Swamp", tar = "Tar"}
local STATS = {
    water = 860501, lava = 860502, swamp = 860503, tar = 860504,
    bass = 860511, smallBass = 860512, tinyBass = 860513
}

local castEffects = {
    [3483] = {water = CONST_ME_LOSEENERGY, lava = CONST_ME_HITBYFIRE, swamp = CONST_ME_ENERGYHIT, tar = CONST_ME_LOSEENERGY},
    [9306] = {water = CONST_ME_WATERSPLASH, lava = CONST_ME_FIREAREA, swamp = CONST_ME_ENERGYAREA, tar = CONST_ME_WATERSPLASH},
    [52053] = {water = CONST_ME_LOSEENERGY, lava = CONST_ME_HITBYFIRE, swamp = CONST_ME_ENERGYHIT, tar = CONST_ME_LOSEENERGY}
}

local function getStorageCount(player, key)
    return math.max(0, player:getStorageValue(key) or -1)
end

local function incrementStorage(player, key)
    player:setStorageValue(key, getStorageCount(player, key) + 1)
end

local function getFishingMonsters(targetId)
    if isInArray(waterIds, targetId) then return waterMonsters, "water" end
    if isInArray(lavaIds, targetId) then return lavaMonsters, "lava" end
    if isInArray(swampIds, targetId) then return swampMonsters, "swamp" end
    if isInArray(tarIds, targetId) then return tarMonsters, "tar" end
    return nil, nil
end

local function getRollMaximum(fishingSkill, rodId)
    -- Un minimo de 0.75 mantiene el sistema valido en Fishing 210+,
    -- y evita capturar monstruos garantizados con una caña mejorada.
    local bonus = rodId == 9306 and 0.25 or 0
    local difficulty = 2.10 - math.max(0, fishingSkill) / 100 - bonus
    difficulty = math.max(0.75, math.min(2.10, difficulty))
    return math.max(1, math.floor(catchMonstersRandom * difficulty))
end

local function scrollIsActive(player)
    return player:getStorageValue(FISHING_SCROLL_STORAGE) == 1
end

local function getEligibleMonsters(list, playerLevel, skill, activeScroll)
    local eligible = {}
    for _, monster in ipairs(list) do
        if playerLevel >= monster.level
            and skill >= monster.fishing
            and (not monster.scroll or activeScroll)
            and MonsterType(monster.spawnName or monster.name) then
            eligible[#eligible + 1] = monster
        end
    end
    return eligible
end

local function chooseMonster(eligible, roll)
    for _, monster in ipairs(eligible) do
        if roll <= monster.chance then
            return monster
        end
    end
    return nil
end

FROZENHELL_FISHING = {
    tables = {water = waterMonsters, lava = lavaMonsters, swamp = swampMonsters, tar = tarMonsters},
    areaMinimum = AREA_MIN_SKILL,
    areaNames = AREA_NAMES,
    statStorage = STATS,
    scrollStorage = FISHING_SCROLL_STORAGE,
    getStorageCount = getStorageCount,
    getRollMaximum = getRollMaximum,
    getEligibleMonsters = getEligibleMonsters,
    chooseMonster = chooseMonster
}

-- Validacion de claves y probabilidades: todas las capturas deben ser distinguibles.
local knownKeys = {}
for area, entries in pairs(FROZENHELL_FISHING.tables) do
    local previousChance = 0
    for _, entry in ipairs(entries) do
        assert(entry.chance > previousChance and entry.chance <= catchMonstersRandom,
            "Fishing: invalid cumulative chance for " .. entry.name .. " in " .. area)
        assert(not knownKeys[entry.key], "Fishing: duplicated capture key " .. entry.key)
        knownKeys[entry.key] = true
        previousChance = entry.chance
    end
end

FISHINGMONSTERS = FISHINGMONSTERS or {}

local function broadcastMessage(player, monster)
    if type(monster.broadcast) ~= "string" or monster.broadcast == "" then
        return
    end
    local msg = monster.broadcast:gsub("|PLAYERNAME|", player:getName())
    if monster.serverBC then
        Game.broadcastMessage(msg, MESSAGE_ADMINISTRATOR)
    else
        player:sendChannelMessage("", msg, TALKTYPE_CHANNEL_O, 9)
    end
end

local function addCatchAndBroadcast(player, monster, position)
    local caught = Game.createMonster(monster.spawnName or monster.name, player:getPosition(), true, false)
    if not caught then
        return false
    end
    player:addCatch(monster.key, 1)
    broadcastMessage(player, monster)
    player:sendTextMessage(MESSAGE_STATUS, "You have caught a " .. monster.name .. "!")
    position:sendMagicEffect(CONST_ME_WATERCREATURE)

    local total = getStorageCount(player, 200500) + 1
    player:setStorageValue(200500, total)
    local milestones = {10, 20, 30, 50, 100}
    for i, count in ipairs(milestones) do
        if total >= count and player:getStorageValue(200500 + i) < 1 then
            player:setStorageValue(200500 + i, 1)
        end
    end

    FISHINGMONSTERS[caught:getId()] = {owner = player:getName(), status = 1}
    return true
end

function fishing.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or not target.itemid then return false end
    local entries, area = getFishingMonsters(target.itemid)
    if not entries then return false end

    local skill = player:getSkillLevel(SKILL_FISHING)
    local required = AREA_MIN_SKILL[area] or 10
    if skill < required then
        player:sendTextMessage(MESSAGE_FAILURE, "You need Fishing " .. required .. " to fish in " .. AREA_NAMES[area] .. ".")
        return true
    end
    local tile = Tile(player:getPosition())
    if tile and tile:hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendTextMessage(MESSAGE_FAILURE, "You cannot fish in protection zones.")
        return true
    end
    if player:getItemCount(3492) < 1 then
        player:sendTextMessage(MESSAGE_FAILURE, "You need a worm to fish.")
        return true
    end
    local effects = castEffects[item.itemid]
    if not effects or not effects[area] then return false end

    local eligible = getEligibleMonsters(entries, player:getLevel(), skill, scrollIsActive(player))
    if area ~= "water" and #eligible == 0 then
        player:sendTextMessage(MESSAGE_FAILURE,
            "No available fishing monsters for your level, Fishing skill and scroll status in this area.")
        return true
    end

    -- Consumir exactamente una carnada por lanzamiento valido en las cuatro zonas.
    if not player:removeItem(3492, 1) then
        player:sendTextMessage(MESSAGE_FAILURE, "Could not consume the worm.")
        return true
    end
    incrementStorage(player, STATS[area])

    local roll = math.random(1, getRollMaximum(skill, item.itemid))
    local selected = chooseMonster(eligible, roll)
    local caughtMonster = selected and addCatchAndBroadcast(player, selected, toPosition) or false
    local caughtFish = false

    -- Las capturas de objetos acuaticos son alternativas a un monstruo.
    if area == "water" and not caughtMonster then
        local fishRoll = math.random(1, 100)
        local fishId, counter
        if fishRoll <= 1 then
            fishId, counter = 32043, STATS.bass
        elseif fishRoll <= 11 then
            fishId, counter = 32044, STATS.smallBass
        elseif fishRoll <= 46 then
            fishId, counter = 32045, STATS.tinyBass
        end
        if fishId then
            caughtFish = player:addItem(fishId, 1, true) ~= nil
            if caughtFish then incrementStorage(player, counter) end
        end
    end

    if caughtMonster or caughtFish then
        player:addSkillTries(SKILL_FISHING, 2)
    elseif area == "water" then
        player:sendTextMessage(MESSAGE_STATUS, "The fish stole your worm and escaped.")
    end
    toPosition:sendMagicEffect(effects[area])
    return true
end

fishing:allowFarUse(true)
fishing:id(3483, 9306, 52053)
fishing:register()




 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


local testFish = TalkAction("/testfish")

function testFish.onSay(player, words, param)
    local cfg = FROZENHELL_FISHING
    local args = (param or ""):split(",")
    local level = tonumber(args[1]) or player:getLevel()
    local skill = tonumber(args[2]) or player:getSkillLevel(SKILL_FISHING)
    local attempts = math.floor(tonumber(args[3]) or 1000)
    local area = (args[4] or "water"):lower():gsub("%s+", "")
    local rodId = tonumber(args[5]) or 3483
    local scroll = args[6] == "1" or (not args[6] and player:getStorageValue(cfg.scrollStorage) == 1)

    if not cfg.tables[area] or level < 1 or skill < 0 or attempts < 1 or attempts > 20000
        or (rodId ~= 3483 and rodId ~= 9306 and rodId ~= 52053) then
        player:sendCancelMessage("Usage: /testfish level,fishing,attempts,water|lava|swamp|tar,rodId,scroll(0|1); max 20000 casts")
        return false
    end
    if skill < cfg.areaMinimum[area] then
        player:sendCancelMessage("Required Fishing skill for " .. area .. ": " .. cfg.areaMinimum[area])
        return false
    end

    local eligible = cfg.getEligibleMonsters(cfg.tables[area], level, skill, scroll)
    if area ~= "water" and #eligible == 0 then
        player:sendCancelMessage("No available monsters under those level, Fishing and scroll requirements.")
        return false
    end
    local counts = {}
    local foundMonster, foundItems = 0, 0
    for _ = 1, attempts do
        local selected = cfg.chooseMonster(eligible, math.random(1, cfg.getRollMaximum(skill, rodId)))
        if selected then
            counts[selected.name] = (counts[selected.name] or 0) + 1
            foundMonster = foundMonster + 1
        elseif area == "water" then
            local roll = math.random(1, 100)
            local name = roll <= 1 and "Bass" or roll <= 11 and "Small Bass" or roll <= 46 and "Tiny Bass" or "Nothing"
            counts[name] = (counts[name] or 0) + 1
            if name ~= "Nothing" then foundItems = foundItems + 1 end
        else
            counts["Nothing"] = (counts["Nothing"] or 0) + 1
        end
    end
    local sorted = {}
    for name, amount in pairs(counts) do sorted[#sorted + 1] = {name = name, amount = amount} end
    table.sort(sorted, function(a, b) return a.amount > b.amount end)

    local output = string.format(
        "=== Fishing Test ===\nArea: %s | Level: %d | Fishing: %d\nRod: %d | Scroll: %s\nAttempts: %d | Monster catches: %d | Item catches: %d\nChance roll: 1..%d\n\n",
        cfg.areaNames[area], level, skill, rodId, scroll and "yes" or "no",
        attempts, foundMonster, foundItems, cfg.getRollMaximum(skill, rodId))
    for _, result in ipairs(sorted) do
        output = output .. string.format("%s: %d (%.3f%%)\n", result.name, result.amount, result.amount * 100 / attempts)
    end
    output = output .. "\nSimulation only: no worms, kills, EXP or skill progression."
    player:showTextDialog(1950, output)
    return false
end

testFish:separator(" ")
testFish:groupType("god")
testFish:register()
