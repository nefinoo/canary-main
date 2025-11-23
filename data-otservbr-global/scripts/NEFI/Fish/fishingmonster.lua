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
    [1] = {name = "Manta Ray", level = 750, fishing = 100, chance = 100, key = 31, scroll = true, bowlable = true, serverBC = true, broadcast = "|PLAYERNAME| has caught an ???!"},
    [2] = {name = "Crustacea Gigantica", level = 750, fishing = 95, chance = 200, key = 30, scroll = true, bowlable = true, serverBC = true, broadcast = "|PLAYERNAME| has caught an Oceanus!"},
    [3] = {name = "Oceanus", level = 750, fishing = 90, chance = 250, key = 29, scroll = true, bowlable = true, serverBC = true, broadcast = "A dark figure is rising from the abyssal depths. Lady Ashzara has come for |PLAYERNAME| head!"},
    [4] = {name = "Cicno", level = 750, fishing = 90, chance = 500, key = 28, scroll = true, bowlable = true, serverBC = true, broadcast = "A dark figure is rising from the abyssal depths. Lady Ashzara has come for |PLAYERNAME| head!"},
    [5] = {name = "Sigma", level = 750, fishing = 90, chance = 750, key = 27, scroll = true, bowlable = true, serverBC = true, broadcast = "A dark figure is rising from the abyssal depths. Lady Ashzara has come for |PLAYERNAME| head!"},
    [6] = {name = "Shesha", level = 750, fishing = 90, chance = 1000, key = 26, scroll = true, bowlable = true, serverBC = true, broadcast = "A dark figure is rising from the abyssal depths. Lady Ashzara has come for |PLAYERNAME| head!"},
    [7] = {name = "Leaviathan", level = 750, fishing = 90, chance = 1334, key = 25, scroll = true, bowlable = true, serverBC = true, broadcast = "A dark figure is rising from the abyssal depths. Lady Ashzara has come for |PLAYERNAME| head!"},
    [8] = {name = "Escila", level = 750, fishing = 90, chance = 1667, key = 24, scroll = true, bowlable = true, serverBC = true, broadcast = "A dark figure is rising from the abyssal depths. Lady Ashzara has come for |PLAYERNAME| head!"},
    [9] = {name = "Caribdis", level = 750, fishing = 90, chance = 2000, key = 23, scroll = true, bowlable = true, serverBC = true, broadcast = "A dark figure is rising from the abyssal depths. Lady Ashzara has come for |PLAYERNAME| head!"},
    [10] = {name = "Ryujin", level = 750, fishing = 90, chance = 3000, key = 22, scroll = true, bowlable = true, serverBC = true, broadcast = "A dark figure is rising from the abyssal depths. Lady Ashzara has come for |PLAYERNAME| head!"},
	[11] = {name = "Sea Serpent", level = 350, fishing = 75, chance = 3500, key = 21, scroll = false, bowlable = true, serverBC = true, broadcast = "Blood on |PLAYERNAME| hook has lured sharks. Jaws has surfaced!"},
    [12] = {name = "Young Sea Serpent", level = 200, fishing = 50, chance = 4000, key = 20, scroll = false, bowlable = false, serverBC = false, broadcast = "A wild Kingler has appeared. Kingler is attacking |PLAYERNAME|!"},
    [13] = {name = "Deepling Guard", level = 450, fishing = 70, chance = 4200, key = 19, scroll = false, bowlable = false, serverBC = false, broadcast = "The clouds have begun to darken the skies of Volantis, lightning is striking from all angles. The water around |PLAYERNAME| has turned to steam. The Laviathan has come to break havoc on the land!"},
    [14] = {name = "Deepling Elite", level = 400, fishing = 70, chance = 4400, key = 18, scroll = false, bowlable = false, serverBC = false, broadcast = "A disastrous entity is drawing near the shores of Volantis as giant tentacles surface from the depths of the ocean. The Kraken has been unleashed upon |PLAYERNAME|!"},
    [15] = {name = "Deepling Spellsinger", level = 350, fishing = 70, chance = 4600, key = 17, scroll = false, bowlable = false, serverBC = false, broadcast = "|PLAYERNAME| accidently hit a Blastoise on the head with their hook. Blastoise attacked!"},
    [16] = {name = "Deepling Scout", level = 300, fishing = 70, chance = 4800, key = 16, scroll = false, bowlable = false, serverBC = false, broadcast = "|PLAYERNAME| fishing line has washed up on the mythical island of Ogygia. Enraged by their filth, Calypso has been released to bring forth ruin!"},
    [17] = {name = "Deepling Brawler", level = 250, fishing = 70, chance = 5000, key = 15, scroll = false, bowlable = false, serverBC = false, broadcast = "A creature has been spotted lurking in the shallows of the Nile! Sobek has emerged to chomp down on |PLAYERNAME|!"},
    [18] = {name = "Quara Predator", level = 200, fishing = 55, chance = 13000, key = 14, scroll = false, bowlable = false, serverBC = false, broadcast = "Blood on |PLAYERNAME| hook has lured sharks. Jaws has surfaced!"},
    [19] = {name = "Quara Pincher", level = 175, fishing = 55, chance = 13500, key = 13, scroll = false, bowlable = false, serverBC = false, broadcast = "The water begins to stir near |PLAYERNAME|! Aekre has emerged from the sea!"},
    [20] = {name = "Quara Mantassin", level = 150, fishing = 55, chance = 14000, key = 12, scroll = false, bowlable = false, serverBC = false, broadcast = "|PLAYERNAME| cast has reached the Isles of Scotland. Nessie the Loch Ness monster has come to defend her territory!"},
    [21] = {name = "Quara Hydromancer", level = 125, fishing = 55, chance = 14500, key = 11, scroll = false, bowlable = false, serverBC = false, broadcast = "|PLAYERNAME| has angered the sea gods. The sea gods have ordered Aegaeus to slay the land dwellers!"},
    [22] = {name = "Quara Constrictor", level = 100, fishing = 55, chance = 15000, key = 10, scroll = false, bowlable = false, serverBC = false, broadcast = "Triton has become very disgruntled due to |PLAYERNAME|!"},
    [23] = {name = "Massive Water", level = 70, fishing = 40, chance = 23500, key = 9, scroll = false, bowlable = false, serverBC = false, broadcast = "A wild Kingler has appeared. Kingler is attacking |PLAYERNAME|!"},
    [24] = {name = "Blood crab", level = 60, fishing = 40, chance = 24000, key = 8, scroll = false, bowlable = false, serverBC = false, broadcast = "|PLAYERNAME| is being violently attacked by Doctor Octagonapus!"},
    [25] = {name = "Water Elemental", level = 55, fishing = 40, chance = 24500, key = 7, scroll = false, bowlable = false, serverBC = false, broadcast = "Tyria The Sea Goddess has been angered by |PLAYERNAME|!"},
    [26] = {name = "Crab", level = 50, fishing = 40, chance = 25000, key = 6, scroll = false, bowlable = false, serverBC = false, broadcast = "A wild Krabby has appeared. Krabby is attacking |PLAYERNAME|!"},
    [27] = {name = "Shark", level = 40, fishing = 0, chance = 33500, key = 5, scroll = false, bowlable = false, serverBC = false, broadcast = "A wild Krabby has appeared. Krabby is attacking |PLAYERNAME|!"},
    [28] = {name = "Jellyfish", level = 30, fishing = 0, chance = 34000, key = 4, scroll = false, bowlable = false, serverBC = false, broadcast = "A wild Krabby has appeared. Krabby is attacking |PLAYERNAME|!"},
    [29] = {name = "Northern Pike", level = 25, fishing = 0, chance = 34500, key = 3, scroll = false, bowlable = false, serverBC = false, broadcast = "A wild Krabby has appeared. Krabby is attacking |PLAYERNAME|!"},
    [30] = {name = "Calamary", level = 20, fishing = 0, chance = 35000, key = 2, scroll = false, bowlable = false, serverBC = false, broadcast = "A Hydros has been caught by |PLAYERNAME|!"},
    [31] = {name = "Fish", level = 8, fishing = 0, chance = 45000, key = 1, scroll = false, bowlable = false, serverBC = false, broadcast = "A Fish has been caught by |PLAYERNAME|!"}
}

local lavaMonsters = {
    [1] = {name = "Magma Crawler", level = 7500, fishing = 145, chance = 20000, key = 43, scroll = true, bowlable = true, serverBC = true, broadcast = "How dare you |PLAYERNAME|. Do you think lava is some kind of TOY?!? I will show you how it feels to be burned. I Volcanis will send you to a FIERY GRAVE"},
    [2] = {name = "Draptor", level = 7000, fishing = 140, chance = 20000, key = 42, scroll = true, bowlable = true, serverBC = true, broadcast = "|PLAYERNAME| flesh has been seared! A Molten Fury has appeared to scorch the lands!"},
    [3] = {name = "Morgaroth", level = 6500, fishing = 140, chance = 20000, key = 41, scroll = true, bowlable = true, serverBC = true, broadcast = "The horrid smell of smoke has began to linger around the vicinity of |PLAYERNAME|. Lavos has come for his prey!"},
    [4] = {name = "Orshabaal", level = 6000, fishing = 140, chance = 20000, key = 40, scroll = false, bowlable = true, serverBC = true, broadcast = "Pyria The Incinerator has entered the mortal realm to immolate |PLAYERNAME|!"},
    [5] = {name = "Hephaestus", level = 5500, fishing = 135, chance = 20000, key = 39, scroll = false, bowlable = true, serverBC = true, broadcast = "A barrage of arrows zooms past |PLAYERNAME| head. Hephaestus has come to test |PLAYERNAME| might!"},
    [6] = {name = "The First Dragon", level = 5000, fishing = 130, chance = 20000, key = 38, scroll = false, bowlable = true, serverBC = true, broadcast = "A Krakatoa has descended upon |PLAYERNAME|!"},
    [7] = {name = "Demodras", level = 4500, fishing = 125, chance = 20000, key = 37, scroll = true, bowlable = true, serverBC = true, broadcast = "The ground around |PLAYERNAME| is torn asunder by a great force from below. Onyx has been unsealed!"},
    [8] = {name = "The Fire Empowered Duke", level = 4000, fishing = 125, chance = 20000, key = 36, scroll = false, serverBC = true, bowlable = true, broadcast = "|PLAYERNAME| has caused the lava to spit out a blazing hot Engorged Magmaworm!"},
    [9] = {name = "Samael", level = 3500, fishing = 120, chance = 20000, key = 35, scroll = true, bowlable = true, serverBC = true, broadcast = "Chimera, the three-headed demon has arose from Hell to obliterate |PLAYERNAME|!"},
    [10] = {name = "The Mega Magmaoid", level = 3000, fishing = 120, chance = 20000, key = 34, scroll = false, bowlable = true, serverBC = true, broadcast = "A wild Charmander appeared! |PLAYERNAME| used tail whip!"},
    [11] = {name = "Furyosa", level = 2500, fishing = 120, chance = 20000, key = 33, scroll = true, bowlable = false, serverBC = false, broadcast = "|PLAYERNAME| has caught an Ember of Draconis"},
    [12] = {name = "Kerberos", level = 2500, fishing = 120, chance = 20000, key = 22, scroll = false, bowlable = false, serverBC = false, broadcast = "|PLAYERNAME| is being lit up by a Firebat!"},
    [13] = {name = "Demon", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = false},
    [14] = {name = "Diabolic Imp", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = false},
    [15] = {name = "Fire Devil", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = false},
    [16] = {name = "Shaburak Prince", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = false},
    [17] = {name = "Shaburak Lord", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = false},
    [18] = {name = "Shaburak Demon", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = false},
	[19] = {name = "Dragon Lord", level = 2000, fishing = 120, chance = 20000, key = 32, scroll = false, bowlable = false, serverBC = false, broadcast = "|PLAYERNAME| has awoken an Unstable Pyroclast!"},
    [20] = {name = "Dragon", level = 1500, fishing = 120, chance = 20000, key = 31, scroll = false, bowlable = false, serverBC = false, broadcast = "A Molten Magma Crab has appeared before |PLAYERNAME|!"},
    [21] = {name = "Dragon Hatchling", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = false},
    [22] = {name = "Hellfire Fighter", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = false},
    [23] = {name = "Massive Fire Elemental", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = false},
    [24] = {name = "Fire Elemental", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = false}
}

local swampMonsters = {
    [1] = {name = "Hibernal Moth", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [2] = {name = "Ladybug", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [3] = {name = "Lisa", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [4] = {name = "The Welter", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [5] = {name = "Fleshslicer", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [6] = {name = "Evil Mastermind", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [7] = {name = "Shlorg", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [8] = {name = "Plagueroot", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [9] = {name = "Sulphur Scuttler", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [10] = {name = "Fleshcrawler", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [11] = {name = "The Old Widow", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [12] = {name = "The Evil Eye", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [13] = {name = "Poisonous Carnisylvan", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [14] = {name = "Empowered Glooth Horror", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [15] = {name = "Rot Elemental", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [16] = {name = "Elder Bonelord", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [17] = {name = "Bonelord", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [18] = {name = "Gazer", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [19] = {name = "Devourer", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [20] = {name = "Sulphur Spouter", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [21] = {name = "Acid Blob", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [22] = {name = "Undertaker", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [23] = {name = "Blemished Spawn", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"},
    [24] = {name = "Parasite", level = 1000, fishing = 120, chance = 100000, key = 60, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Swamp Blob!"}
}

local tarMonsters = {
    [1] = {name = "???", level = 10000, fishing = 140, chance = 200, key = 80, scroll = true, bowlable = true, serverBC = true, broadcast = "|PLAYERNAME| has caught an ???!"},
}

-- Chance to catch monster is (catchMonsterRandom / difficulty) [[Difficulty shown below]]
local catchMonstersRandom = 100000

local castEffects = {
    [3483] = {water = CONST_ME_LOSEENERGY, lava = CONST_ME_HITBYFIRE, swamp = CONST_ME_ENERGYHIT, tar = CONST_ME_LOSEENERGY},
    [9306] = {water = CONST_ME_WATERSPLASH, lava = CONST_ME_FIREAREA, swamp = CONST_ME_ENERGYAREA, tar = CONST_ME_WATERSPLASH}
}

local function getFishingMonsters(targetId)
    if isInArray(waterIds, targetId) then return waterMonsters, "water" end
    if isInArray(lavaIds, targetId) then return lavaMonsters, "lava" end
    if isInArray(swampIds, targetId) then return swampMonsters, "swamp" end
    if isInArray(tarIds, targetId) then return tarMonsters, "tar" end
    return nil
end

local function broadcastMessage(player, message, serverBC)
    local msg = message:gsub("|PLAYERNAME|", player:getName())
    if serverBC then
        Game.broadcastMessage(msg, MESSAGE_EVENT_ADVANCE)
    else
        local players = Game.getPlayers()
        for _, v in ipairs(players) do
            v:sendChannelMessage("", msg, TALKTYPE_CHANNEL_O, 9)
        end
    end
end

local function addCatchAndBroadcast(player, monster, position)
    local MONS = Game.createMonster(monster.name, player:getPosition(), true, false)
    if MONS then
        player:addCatch(monster.key, 1)
        if monster.broadcast then
            broadcastMessage(player, monster.broadcast, monster.serverBC)
        end
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have caught a " .. monster.name .. "!")
        position:sendMagicEffect(CONST_ME_WATERCREATURE)
        player:setStorageValue(200500, player:getStorageValue(200500) + 1)
        local storageValues = {10, 20, 30, 50, 100}
        for i, value in ipairs(storageValues) do
            if player:getStorageValue(200500) >= value and player:getStorageValue(200500 + i) < 1 then
                player:setStorageValue(200500 + i, 1)
            end
        end
        FISHINGMONSTERS[MONS:getId()] = {owner = player:getName(), status = 1}
    end
end

function fishing.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or not target.itemid then return false end

    if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
        return player:sendTextMessage(MESSAGE_STATUS_WARNING2, "You cannot fish in protection zones.")
    end

    local fishingMonsters, fishingType = getFishingMonsters(target.itemid)
    if not fishingMonsters then return false end

    if (fishingType == "lava" and player:getSkillLevel(SKILL_FISHING) < 120) or
       (fishingType == "swamp" and player:getSkillLevel(SKILL_FISHING) < 120) or
       (fishingType == "tar" and player:getSkillLevel(SKILL_FISHING) < 140) then
        return player:sendTextMessage(MESSAGE_STATUS_WARNING2, "You cannot fish here until level " .. (fishingType == "tar" and 140 or 120) .. " fishing.")
    end

    local effect = castEffects[item.itemid][fishingType]
    local difficulty = 2.00
    local skillModifier = player:getSkillLevel(SKILL_FISHING) >= 100 and (100 / player:getSkillLevel(SKILL_FISHING)) or 0.0
    difficulty = difficulty - math.abs(skillModifier)

    if item.itemid == 9306 then
        difficulty = difficulty - 0.25
    end

    local realMonsterChance = catchMonstersRandom * difficulty
    local finalchance = math.random(1, realMonsterChance)

    for _, monster in ipairs(fishingMonsters) do
        if player:getLevel() >= monster.level and player:getSkillLevel(SKILL_FISHING) >= monster.fishing and finalchance <= monster.chance then
            addCatchAndBroadcast(player, monster, toPosition)
            break
        end
    end

    if fishingType == "water" and player:getStorageValue(15000) == 1 and not MONS then
        local fishChances = {35, 10, 1}
        local fishItems = {34701, 34700, 34699}
        for i, chance in ipairs(fishChances) do
            if math.random(1, 100) <= chance then
                player:addSkillTries(SKILL_FISHING, 1)
                player:addItem(fishItems[i], 1, true)
                break
            end
        end
    end

    player:addSkillTries(SKILL_FISHING, 1)
    toPosition:sendMagicEffect(effect)
    return true
end

fishing:allowFarUse(true)
fishing:id(3483, 9306)
fishing:register()