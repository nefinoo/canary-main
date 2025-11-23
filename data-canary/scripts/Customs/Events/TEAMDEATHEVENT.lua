-- Team Deathmatch (TDM) for Canary Engine
-- Autor: ChatGPT (adaptación para Canary)
-- Guardar como: data-canary/scripts/Customs/events/team_battle_tdm.lua

local TDM = {}
TDM.config = {
    name = "Team Deathmatch",
    minPlayers = 2,             -- mínimo para iniciar
    maxPlayers = 20,            -- máximo permitido en total
    teamSizeLimit = 10,         -- máximo por equipo
    lobbyPos = Position(1000,1000,7), -- posición del lobby (cambiar)
    teamRed = {
        spawn = Position(1002,1000,7),
        colorName = "Red",
        storage = 96001
    },
    teamBlue = {
        spawn = Position(1004,1000,7),
        colorName = "Blue",
        storage = 96002
    },
    arena = {
        center = Position(1003,1000,7),
        rangeX = 10,
        rangeY = 10
    },
    waitTime = 30,  -- segundos de espera antes de iniciar (lobby)
    matchTime = 300, -- seconds match duration (5 min)
    respawnDelay = 3, -- seconds to respawn
    reward = {itemId = 2160, countPerKill = 1}, -- reward per kill (example)
    autoStart = false -- si quieres que inicie automáticamente al llenarse
}

-- Estado runtime
TDM.state = {
    open = false,          -- lobby abierto
    started = false,
    players = {},          -- [playerId] = {team="red"/"blue", kills=0, deaths=0}
    teamCounts = { red = 0, blue = 0 },
    teamKills = { red = 0, blue = 0 },
    lobbyTimerId = nil,
    matchTimerId = nil,
    lastWinner = nil
}

-- Utility helpers
local function sendAll(msg)
    Game.broadcastMessage("["..TDM.config.name.."] "..msg, MESSAGE_EVENT_ADVANCE)
end

local function isPlayerRegistered(pid)
    return TDM.state.players[pid] ~= nil
end

local function countRegistered()
    local c = 0
    for _ in pairs(TDM.state.players) do c = c + 1 end
    return c
end

local function assignTeamBalanced(player)
    if TDM.state.teamCounts.red <= TDM.state.teamCounts.blue then
        TDM.state.players[player:getId()] = { team = "red", kills = 0, deaths = 0 }
        TDM.state.teamCounts.red = TDM.state.teamCounts.red + 1
        player:setStorageValue(TDM.config.teamRed.storage, 1)
        player:setStorageValue(TDM.config.teamBlue.storage, 0)
        return "red"
    else
        TDM.state.players[player:getId()] = { team = "blue", kills = 0, deaths = 0 }
        TDM.state.teamCounts.blue = TDM.state.teamCounts.blue + 1
        player:setStorageValue(TDM.config.teamBlue.storage, 1)
        player:setStorageValue(TDM.config.teamRed.storage, 0)
        return "blue"
    end
end

local function removeRegistration(player)
    local pid = player:getId()
    local data = TDM.state.players[pid]
    if not data then return end
    if data.team == "red" then
        TDM.state.teamCounts.red = math.max(0, TDM.state.teamCounts.red - 1)
    else
        TDM.state.teamCounts.blue = math.max(0, TDM.state.teamCounts.blue - 1)
    end
    player:setStorageValue(TDM.config.teamRed.storage, 0)
    player:setStorageValue(TDM.config.teamBlue.storage, 0)
    TDM.state.players[pid] = nil
end

local function teleportToSpawn(player, team)
    if team == "red" then
        player:teleportTo(TDM.config.teamRed.spawn)
    else
        player:teleportTo(TDM.config.teamBlue.spawn)
    end
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end

-- Lobby functions
function TDM.openLobby()
    if TDM.state.open then return end
    TDM.state.open = true
    TDM.state.started = false
    TDM.state.players = {}
    TDM.state.teamCounts = { red = 0, blue = 0 }
    TDM.state.teamKills = { red = 0, blue = 0 }
    sendAll("Lobby is open! Use !tdm join to participate. Match begins in "..TDM.config.waitTime.." seconds.")
    -- schedule start
    if TDM.state.lobbyTimerId then
        stopEvent(TDM.state.lobbyTimerId)
        TDM.state.lobbyTimerId = nil
    end
    TDM.state.lobbyTimerId = addEvent(function()
        TDM.startMatch()
    end, TDM.config.waitTime * 1000)
end

function TDM.closeLobby()
    if not TDM.state.open then return end
    TDM.state.open = false
    if TDM.state.lobbyTimerId then
        stopEvent(TDM.state.lobbyTimerId)
        TDM.state.lobbyTimerId = nil
    end
    sendAll("Lobby closed.")
end

-- Join / leave
function TDM.join(player)
    if player:getGroup():getAccess() then
        player:sendCancelMessage("Staff cannot join the TDM event.")
        return
    end
    if not TDM.state.open then
        player:sendCancelMessage("No open TDM lobby right now.")
        return
    end
    if isPlayerRegistered(player:getId()) then
        player:sendCancelMessage("You are already registered in the TDM.")
        return
    end
    if countRegistered() >= TDM.config.maxPlayers then
        player:sendCancelMessage("The event is full.")
        return
    end

    local team = assignTeamBalanced(player)
    player:teleportTo(TDM.config.lobbyPos)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You joined TDM in team: "..(team == "red" and TDM.config.teamRed.colorName or TDM.config.teamBlue.colorName))
end

function TDM.leave(player)
    if not isPlayerRegistered(player:getId()) then
        player:sendCancelMessage("You are not in the TDM event.")
        return
    end
    removeRegistration(player)
    player:teleportTo(player:getTown():getTemplePosition())
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You left the TDM.")
end

-- START MATCH
function TDM.startMatch(forced)
    if TDM.state.started then
        return
    end

    local total = countRegistered()
    if total < TDM.config.minPlayers and not forced then
        sendAll("Not enough players to start TDM.")
        return
    end

    -- close lobby and prepare players
    TDM.closeLobby()
    TDM.state.started = true
    sendAll("Match starting now! Good luck!")

    -- teleport players to team spawns
    for pid, pdata in pairs(TDM.state.players) do
        local p = Player(pid)
        if p then
            teleportToSpawn(p, pdata.team)
            p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Fight! You will respawn in "..TDM.config.respawnDelay.." seconds when you die.")
            -- ensure storage flags exist
            p:setStorageValue(TDM.config.teamRed.storage, pdata.team == "red" and 1 or 0)
            p:setStorageValue(TDM.config.teamBlue.storage, pdata.team == "blue" and 1 or 0)
        end
    end

    -- schedule match end
    if TDM.state.matchTimerId then
        stopEvent(TDM.state.matchTimerId)
        TDM.state.matchTimerId = nil
    end
    TDM.state.matchTimerId = addEvent(function()
        TDM.endMatch()
    end, TDM.config.matchTime * 1000)
end

-- End match
function TDM.endMatch()
    if not TDM.state.started then return end
    TDM.state.started = false

    -- determine winner by teamKills
    local redKills = TDM.state.teamKills.red or 0
    local blueKills = TDM.state.teamKills.blue or 0
    local resultMsg = ""

    if redKills > blueKills then
        resultMsg = "Team "..TDM.config.teamRed.colorName.." wins! ("..redKills.." - "..blueKills..")"
        TDM.rewardTeam("red")
        TDM.state.lastWinner = "red"
    elseif blueKills > redKills then
        resultMsg = "Team "..TDM.config.teamBlue.colorName.." wins! ("..blueKills.." - "..redKills..")"
        TDM.rewardTeam("blue")
        TDM.state.lastWinner = "blue"
    else
        resultMsg = "Draw! ("..redKills.." - "..blueKills..")"
        TDM.state.lastWinner = "draw"
    end

    sendAll("Match ended: "..resultMsg)

    -- teleport everyone out and clear storages
    for pid, pdata in pairs(TDM.state.players) do
        local p = Player(pid)
        if p then
            p:teleportTo(p:getTown():getTemplePosition())
            p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
            p:setStorageValue(TDM.config.teamRed.storage, 0)
            p:setStorageValue(TDM.config.teamBlue.storage, 0)
        end
    end

    -- clear state
    TDM.state.players = {}
    TDM.state.teamCounts = { red = 0, blue = 0 }
    TDM.state.teamKills = { red = 0, blue = 0 }
    if TDM.state.matchTimerId then
        stopEvent(TDM.state.matchTimerId)
        TDM.state.matchTimerId = nil
    end
end

-- Rewarding winners (example: reward by kills or team)
function TDM.rewardTeam(team)
    for pid, pdata in pairs(TDM.state.players) do
        if pdata.team == team then
            local p = Player(pid)
            if p then
                -- Reward example: reward.countPerKill per kill
                local rewardCount = (TDM.config.reward.countPerKill or 0) * (pdata.kills or 0)
                if rewardCount > 0 then
                    if ItemType(TDM.config.reward.itemId):isStackable() then
                        p:addItem(TDM.config.reward.itemId, rewardCount)
                    else
                        for i = 1, rewardCount do
                            p:addItem(TDM.config.reward.itemId, 1)
                        end
                    end
                    p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received "..rewardCount.." x "..ItemType(TDM.config.reward.itemId):getName())
                end
            end
        end
    end
end

-- When a player dies in match: handle respawn and scoring
local tdmDeath = CreatureEvent("TDMPlayerDeath")
function tdmDeath.onDeath(creature, corpse, killer, mostDamageKiller, lastHit)
    -- only care about player deaths during match
    if not creature or not creature:isPlayer() then return true end
    local player = Player(creature)
    local pid = player:getId()
    if not TDM.state.started then return true end
    if not isPlayerRegistered(pid) then return true end

    -- increase death count
    local pdata = TDM.state.players[pid]
    pdata.deaths = (pdata.deaths or 0) + 1

    -- who got the kill? prefer lastHit/killer (killer is the direct attacker)
    local killerPlayer = nil
    if killer and killer:isPlayer() then
        killerPlayer = Player(killer)
    elseif mostDamageKiller and mostDamageKiller:isPlayer() then
        killerPlayer = Player(mostDamageKiller)
    end

    if killerPlayer and killerPlayer:getId() ~= pid then
        local kpid = killerPlayer:getId()
        if TDM.state.players[kpid] then
            TDM.state.players[kpid].kills = (TDM.state.players[kpid].kills or 0) + 1
            local kteam = TDM.state.players[kpid].team
            TDM.state.teamKills[kteam] = (TDM.state.teamKills[kteam] or 0) + 1
            -- give reward per kill
            if TDM.config.reward and TDM.config.reward.itemId and TDM.config.reward.countPerKill > 0 then
                killerPlayer:addItem(TDM.config.reward.itemId, TDM.config.reward.countPerKill)
                killerPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You earned "..TDM.config.reward.countPerKill.." x "..ItemType(TDM.config.reward.itemId):getName().." for the kill.")
            end
        end
    end

    -- schedule respawn
    addEvent(function(pid)
        local p = Player(pid)
        if not p then return end
        -- If player still registered and match running, respawn at team spawn
        if TDM.state.started and TDM.state.players[pid] then
            local team = TDM.state.players[pid].team
            teleportToSpawn(p, team)
        else
            -- otherwise, teleport away (safety)
            p:teleportTo(p:getTown():getTemplePosition())
        end
    end, TDM.config.respawnDelay * 1000, pid)

    return true
end
tdmDeath:register()

-- Prevent players moving items into arena tiles or moving players - optional (safety)
-- (You can register MoveEvent or EventCallback according to your server setup if needed)

-- TalkAction commands for players and GMs
local talk = TalkAction("!tdm")
function talk.onSay(player, words, param)
    local cmd, arg = param:match("^(%S+)%s*(.*)$")
    cmd = cmd and cmd:lower() or ""

    if cmd == "join" then
        TDM.join(player)
        return false
    elseif cmd == "leave" then
        TDM.leave(player)
        return false
    elseif cmd == "open" then
        if not player:getGroup():getAccess() then
            player:sendCancelMessage("You don't have permission.")
            return false
        end
        TDM.openLobby()
        return false
    elseif cmd == "start" then
        if not player:getGroup():getAccess() then
            player:sendCancelMessage("You don't have permission.")
            return false
        end
        TDM.startMatch(true)
        return false
    elseif cmd == "status" then
        local total = countRegistered()
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format(
            "TDM Status: open=%s, started=%s, players=%d, red=%d, blue=%d, kills R:%d B:%d",
            tostring(TDM.state.open), tostring(TDM.state.started), total,
            TDM.state.teamCounts.red, TDM.state.teamCounts.blue,
            TDM.state.teamKills.red or 0, TDM.state.teamKills.blue or 0
        ))
        return false
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Commands: !tdm join, !tdm leave, GM: !tdm open, !tdm start, !tdm status")
    return false
end
talk:separator(" ")
-- talk:groupType("normal") -- en lo que pruebo y resuelvo
talk:groupType("god")
talk:register()

-- Optional: cleanup on login if storage left as flagged
local cEvent = CreatureEvent("TDMLoginCleanup")
function cEvent.onLogin(player)
    -- reset storages possibly left from crash
    player:setStorageValue(TDM.config.teamRed.storage, 0)
    player:setStorageValue(TDM.config.teamBlue.storage, 0)
    return true
end
cEvent:register()

-- Return module (optional)
return TDM
