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
	[10] = {name = "Ryujin", level = 7500, fishing = 80, chance = 1250, key = 22, scroll = false, bowlable = true, serverBC = true, broadcast = "Lightning strikes the waves as |PLAYERNAME| summons Ryujin, the Dragon God of the Sea!"},
	[11] = {name = "Sea Serpent", level = 5000, fishing = 77, chance = 1550, key = 21, scroll = false, bowlable = true, serverBC = true, broadcast = "The ocean churns violently as |PLAYERNAME| has disturbed the mighty Sea Serpent!"},
    [12] = {name = "Wyrm", level = 3500, fishing = 75, chance = 1900, key = 20, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
	[13] = {name = "Deepling Elite", level = 3000, fishing = 72, chance = 2200, key = 19, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [14] = {name = "Deepling Guard", level = 2800, fishing = 70, chance = 2600, key = 18, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [15] = {name = "Deepling Spellsinger", level = 2600, fishing =68, chance = 3000, key = 17, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [16] = {name = "Deepling Brawler", level = 2400, fishing = 65, chance = 3400, key = 16, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [17] = {name = "Deepling Scout", level = 2200, fishing = 63, chance = 3800, key = 15, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [18] = {name = "Quara Predator", level = 2000, fishing = 65, chance = 4500, key = 14, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [19] = {name = "Quara Pincher", level = 1750, fishing = 58, chance = 6000, key = 13, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [20] = {name = "Quara Mantassin", level = 1500, fishing = 55, chance = 7500, key = 12, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [21] = {name = "Quara Hydromancer", level = 1300, fishing = 50, chance = 9000, key = 11, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [22] = {name = "Quara Constrictor", level = 1000, fishing = 45, chance = 11000, key = 10, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [23] = {name = "Massive Water Elemental", level = 750, fishing = 40, chance = 22500, key = 9, scroll = false, bowlable = false, serverBC = false, broadcast = "A monstrous wave rises as |PLAYERNAME| has unleashed the wrath of the Massive Water Elemental!"},
	[24] = {name = "Blood crab", level = 650, fishing = 38, chance = 24000, key = 8, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [25] = {name = "Water Elemental", level = 500, fishing = 34, chance = 24500, key = 7, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [26] = {name = "Crab", level = 350, fishing = 30, chance = 25000, key = 6, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [27] = {name = "Shark", level = 250, fishing = 24, chance = 33500, key = 5, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [28] = {name = "Jellyfish", level = 150, fishing = 17, chance = 34000, key = 4, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [29] = {name = "Northern Pike", level = 100, fishing = 15, chance = 34500, key = 3, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [30] = {name = "Calamary", level = 50, fishing = 12, chance = 35000, key = 2, scroll = false, bowlable = false, serverBC = false, broadcast = ""},
    [31] = {name = "Fish", level = 8, fishing = 10, chance = 45000, key = 1, scroll = false, bowlable = false, serverBC = false, broadcast = ""}
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
    [11] = {name = "Furyosa", level = 2500, fishing = 120, chance = 20000, key = 33, scroll = true, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has caught an Ember of Draconis"},
    [12] = {name = "Kerberos", level = 2500, fishing = 120, chance = 20000, key = 22, scroll = false, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| is being lit up by a Firebat!"},
    [13] = {name = "Demon", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = true},
    [14] = {name = "Diabolic Imp", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = true},
    [15] = {name = "Fire Devil", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = true},
    [16] = {name = "Shaburak Prince", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = true},
    [17] = {name = "Shaburak Lord", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = true},
    [18] = {name = "Shaburak Demon", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = true},
	[19] = {name = "Dragon Lord", level = 2000, fishing = 120, chance = 20000, key = 32, scroll = false, bowlable = true, serverBC = false, broadcast = "|PLAYERNAME| has awoken an Unstable Pyroclast!"},
    [20] = {name = "Dragon", level = 1500, fishing = 120, chance = 20000, key = 31, scroll = false, bowlable = true, serverBC = false, broadcast = "A Molten Magma Crab has appeared before |PLAYERNAME|!"},
    [21] = {name = "Dragon Hatchling", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = true},
    [22] = {name = "Hellfire Fighter", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = true},
    [23] = {name = "Massive Fire Elemental", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = true},
    [24] = {name = "Fire Elemental", level = 1000, fishing = 120, chance = 20000, key = 30, scroll = false, bowlable = true}
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
local fishingCastCooldown = {} -- seconds, per player; prevents rapid monster spawning

local castEffects = {
    [3483] = {water = CONST_ME_LOSEENERGY, lava = CONST_ME_HITBYFIRE, swamp = CONST_ME_ENERGYHIT, tar = CONST_ME_LOSEENERGY},
    [9306] = {water = CONST_ME_WATERSPLASH, lava = CONST_ME_FIREAREA, swamp = CONST_ME_ENERGYAREA, tar = CONST_ME_WATERSPLASH},
    [52053] = {water = CONST_ME_WATERSPLASH, lava = CONST_ME_FIREAREA, swamp = CONST_ME_ENERGYAREA, tar = CONST_ME_WATERSPLASH}
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
        Game.broadcastMessage(msg, MESSAGE_ADMINISTRATOR)
		player:sendChannelMessage("", msg, TALKTYPE_CHANNEL_O, 9)
    else
        local players = Game.getPlayers()
        for _, v in ipairs(players) do
            v:sendChannelMessage("", msg, TALKTYPE_CHANNEL_O, 9)
        end
    end
end

local function addCatchAndBroadcast(player, monster, position)
    local MONS = Game.createMonster(monster.name, player:getPosition(), true, false)
	if not MONS then
        return false
    end
    if MONS then
        player:addCatch(monster.key, 1)
        if monster.broadcast then
            broadcastMessage(player, monster.broadcast, monster.serverBC)
        end
        player:sendTextMessage(MESSAGE_STATUS, "You have caught a " .. monster.name .. "!")
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
	return true
end

function fishing.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target or not target.itemid then 
        return false 
    end

    local wormId = 3492

    if player:getItemCount(wormId) < 1 then
        player:sendTextMessage(MESSAGE_FAILURE, "You need a worm to fish.")
        return true
    end

    if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
        return player:sendTextMessage(MESSAGE_FAILURE, "You cannot fish in protection zones.")
    end

    local fishingMonsters, fishingType = getFishingMonsters(target.itemid)
    if not fishingMonsters then return false end

    if (fishingType == "lava" and player:getSkillLevel(SKILL_FISHING) < 120) or
       (fishingType == "swamp" and player:getSkillLevel(SKILL_FISHING) < 120) or
       (fishingType == "tar" and player:getSkillLevel(SKILL_FISHING) < 140) then
        return player:sendTextMessage(MESSAGE_FAILURE, "You cannot fish here until level " .. (fishingType == "tar" and 140 or 120) .. " fishing.")
    end

    -- Minimum two-second interval between fishing attempts.
    local playerId = player:getId()
    local now = os.time()
    if (fishingCastCooldown[playerId] or 0) > now then
        player:sendCancelMessage("You must wait before fishing again.")
        return true
    end
    fishingCastCooldown[playerId] = now + 2

    -- Frozen Hell economy: every valid cast uses a worm, including misses on lava,
    -- swamp and tar. Without this, players can make unlimited free rare-monster rolls.
    player:removeItem(wormId, 1)

    local effect = castEffects[item.itemid][fishingType]
    local difficulty = 2.10
    local skillModifier = player:getSkillLevel(SKILL_FISHING) / 100
    difficulty = difficulty - math.abs(skillModifier)

    if item.itemid == 9306 then
        difficulty = difficulty - 0.25
    end

    -- Keep math.random integer-safe even at high fishing skill levels.
    local realMonsterChance = math.max(1, math.floor(catchMonstersRandom * math.max(0.50, difficulty)))
    local finalchance = math.random(1, realMonsterChance)
	local caughtMonster = false
	local caughtFish = false
	
    -- for _, monster in ipairs(fishingMonsters) do
		-- if player:getLevel() >= monster.level and player:getSkillLevel(SKILL_FISHING) >= monster.fishing and finalchance <= monster.chance then
			-- addCatchAndBroadcast(player, monster, toPosition)
			-- player:removeItem(wormId, 1)
			-- caughtMonster = true
			-- break
		-- end
	-- end
	
	for _, monster in ipairs(fishingMonsters) do
		if player:getLevel() >= monster.level and player:getSkillLevel(SKILL_FISHING) >= monster.fishing and finalchance <= monster.chance then
			if addCatchAndBroadcast(player, monster, toPosition) then
				caughtMonster = true
			end
			break
		end
	end

    -- if fishingType == "water" and player:getStorageValue(15000) == 1 and not MONS then
    if fishingType == "water" and not caughtMonster then
		local roll = math.random(1, 100)

		if roll <= 1 then
			player:addItem(32043, 1, true) -- 1%
			caughtFish = true

		elseif roll <= 11 then
			player:addItem(32044, 1, true) -- 10%
			caughtFish = true

		elseif roll <= 46 then
			player:addItem(32045, 1, true) -- 35%
			caughtFish = true
		else
			-- The worm was already consumed when the cast began.
			player:sendTextMessage(MESSAGE_ADMINISTRATOR, "The fish stole your worm and escaped.")
		end
	end
	
	-- Every valid cast trains fishing slightly; catches give twice the progress.
	-- A worm is already consumed once per attempt above, even on failure.
	if caughtMonster or caughtFish then
		player:addSkillTries(SKILL_FISHING, 2)
	else
		player:addSkillTries(SKILL_FISHING, 1)
	end
	
    toPosition:sendMagicEffect(effect)
    return true
end

fishing:allowFarUse(true)
-- fishing:id(3483, 9306, 52053)
fishing:id(3483, 9306, 52053)
fishing:register()


 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


local testFish = TalkAction("/testfish")

-- CONFIG
local fishingBase = 20
local fishingMultiplier = 1.1
local minSkillLevel = 10

-- EXPERIENCE FUNCTIONS
local function getExpForLevel(level)
    return math.floor(((50 * level ^ 3) - (150 * level ^ 2) + (400 * level)) / 3)
end

local function getLevelByExp(exp)
    local low = 1
    local high = 100000

    while low <= high do
        local mid = math.floor((low + high) / 2)

        if getExpForLevel(mid) <= exp then
            low = mid + 1
        else
            high = mid - 1
        end
    end

    return high
end

local function getStageMultiplier(level)
    if level >= 50001 then
        return 100
    elseif level >= 40001 then
        return 200
    elseif level >= 30001 then
        return 300
    elseif level >= 20001 then
        return 450
    elseif level >= 10001 then
        return 600
    else
        return 1000
    end
end


-- FISHING FUNCTIONS
local function getReqFishingTries(level)
    if level <= minSkillLevel then
        return 0
    end

    return math.floor(
        fishingBase *
        (fishingMultiplier ^ (level - (minSkillLevel + 1)))
    )
end

local function getTotalFishingTries(level)
    local total = 0

    for i = minSkillLevel, level do
        total = total + getReqFishingTries(i)
    end

    return total
end

local function getFishingLevelByTries(tries)
    local level = minSkillLevel

    while getTotalFishingTries(level + 1) <= tries do
        level = level + 1
    end

    return level
end


function testFish.onSay(player, words, param)

    local split = param:split(",")

    local startLevel = tonumber(split[1])
    local startFishing = tonumber(split[2])
    local attempts = tonumber(split[3])

    if not startLevel or not startFishing or not attempts then
        player:sendCancelMessage("Usage: /testfish level,fishing,attempts")
        return false
    end


    -- Estado simulado
    local playerExp = getExpForLevel(startLevel)
    local fishingTries = getTotalFishingTries(startFishing)

    local currentLevel = startLevel
    local currentFishing = startFishing

    local results = {}
    local totalExpGained = 0

    -- Fórmula real de pesca
    local difficulty = 2.10
    local skillModifier = currentFishing / 100
    difficulty = difficulty - math.abs(skillModifier)

    local realMonsterChance = catchMonstersRandom * difficulty


    for i = 1, attempts do

        -- Gana 1 try por intento
        fishingTries = fishingTries + 1

        local newFishing = getFishingLevelByTries(fishingTries)

        if newFishing > currentFishing then
            currentFishing = newFishing

            -- Al subir fishing cambia la dificultad
            skillModifier = currentFishing / 100
            difficulty = 2.10 - math.abs(skillModifier)
            realMonsterChance = catchMonstersRandom * difficulty
        end


        local finalChance = math.random(1, realMonsterChance)

        local caught = false

        for _, monster in ipairs(waterMonsters) do

            if currentLevel >= monster.level
            and currentFishing >= monster.fishing
            and finalChance <= monster.chance then


                results[monster.name] = (results[monster.name] or 0) + 1


                local mType = MonsterType(monster.name)

                if mType then

                    local monsterExp = 0

                    if mType.getExperience then
                        monsterExp = mType:getExperience()
                    elseif mType.experience then
                        monsterExp = mType:experience()
                    end


                    local stage = getStageMultiplier(currentLevel)

                    local gained = monsterExp * stage

                    playerExp = playerExp + gained
                    totalExpGained = totalExpGained + gained

                    currentLevel = getLevelByExp(playerExp)

                end

                caught = true
                break
            end
        end


        if not caught then
            results["Nothing"] = (results["Nothing"] or 0) + 1
        end
    end


    -- Ordenar resultados
    local sorted = {}

    for name, amount in pairs(results) do
        table.insert(sorted, {
            name = name,
            amount = amount
        })
    end

    table.sort(sorted, function(a, b)
        return a.amount > b.amount
    end)


    local text = "=== Fishing Simulator ===\n"
    text = text .. "Attempts: " .. attempts .. "\n\n"

    text = text .. "Level:\n"
    text = text .. startLevel .. " -> " .. currentLevel .. "\n\n"

    text = text .. "Fishing:\n"
    text = text .. startFishing .. " -> " .. currentFishing .. "\n\n"

    text = text .. "Experience Gained:\n"
    text = text .. math.floor(totalExpGained) .. "\n\n"

    text = text .. "Catches:\n"

    for _, data in ipairs(sorted) do
        local percent = string.format(
            "%.4f",
            (data.amount / attempts) * 100
        )

        text = text ..
            data.name ..
            ": " ..
            data.amount ..
            " (" ..
            percent ..
            "%)\n"
    end


    player:showTextDialog(1950, text)

    return false
end


testFish:separator(" ")
testFish:groupType("god")
testFish:register()