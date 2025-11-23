


--- Powered by Karin ---
-- To use in your website
-- replace 29996  to your storage kill.
--
--  SELECT `player_id`, `players`.`name`, `value` FROM `player_storage` INNER JOIN `players`
-- ON `player_storage`.`player_id`=`players`.id WHERE `key` = 29996 Order By `value` DESC LIMIT 10
--
if not Karin then
    Karin = {}
end
if not Karin.Events then 
    Karin.Events = {}
end
Karin.Events.SnowBall = {
    f = {},
    test = false,
    players = {},
    started = false,
    maxAmmo = 5,
    increaseAmmoAfterSeconds = 3,
    -- allPlayersWinTournament = 10,
    storages = {
        ['Kill'] = 35709,
        ['Death'] = 35710
    },
    winners = {
        [1] = {
            item = {52583,1.5},
        },
        [2] = {
            item = {52583,1.25},
        },
        [3] = {
            item = {52583,1},
        },
    },
    teleport = {
        pos = Position(523, 840, 5)
    },
    map = {
        pos = Position(125, 707, 7),
        ranges = {
            x = 25,
            y = 28
        },
        lobby  = {
            pos = Position(125, 706, 6),
            ranges = {
                x = 5,
                y = 5
            }
        },
        exitTo = Position(518, 840, 7)
    },
    schedule = {
        toStartEvent = 3,
        toFinishEvent = 5,
        days = {
            ["Sunday"] = {"21:25"},
            ["Monday"] = {"21:25"},
            ["Tuesday"] = {"21:25"},
            ["Wednesday"] = {"21:25"},
            ["Thursday"] = {"21:25"},
            ["Friday"] = {"21:25"},
            ["Saturday"] = {"21:25"},
        },
    },
    
}


function Karin.Events.SnowBall.f:getPlayersInEvent()
    return Karin:getPlayersPosRangeXY(Karin.Events.SnowBall.map.pos,Karin.Events.SnowBall.map.ranges.x,Karin.Events.SnowBall.map.ranges.y)
end

function showRankModal(player, str)
    
    if str then
        if Karin.Events.SnowBall.lobby[player:getId()] then
            player:popupFYI("Your Score: ".. Karin.Events.SnowBall.lobby[player:getId()].kill .. "\nSnowBall Winners:\n" .. str)
        end
        return true
    end
    local resultId = db.storeQuery("SELECT `player_id`, `players`.`name`, `value` FROM `player_storage` INNER JOIN `players` ON `player_storage`.`player_id`=`players`.id WHERE `key` = " .. Karin.Events.SnowBall.storages.Kill .. ' Order By `value` DESC LIMIT 10')
	if resultId ~= false then
		local str = ""
		local x = 0
		repeat
			x = x + 1
				str = str.."\n"..x.."- "..result.getDataString(resultId, "name").." ("..result.getDataInt(resultId, "value")..")."
		until not result.next(resultId)
		result.free(resultId)
		if str == "" then
			str = "No highscore to show."
		end
		player:popupFYI("SnowBall Highscore:\n" .. str)
	else
		player:sendCancelMessage("No highscore to show.")
    end

    player:getPosition():sendMagicEffect(57)
end

function addScoresToPlayers(killer, deathPlayer)
    local killerScore = Karin.Events.SnowBall.lobby[killer:getId()]
    local deathPlayerScore = Karin.Events.SnowBall.lobby[deathPlayer:getId()]
    if not killerScore then
        killerScore = {
            id = killer:getId(),
            name = killer:getName(),
            kill = 0,
            death = 0,
            accId = killer:getAccountId(),
        }
    end
    if not deathPlayerScore then
        deathPlayerScore = {
            id = deathPlayer:getId(),
            name = deathPlayer:getName(),
            kill = 0,
            death = 0,
            accId = deathPlayer:getAccountId(),
        }
    end

    killerScore.kill = killerScore.kill + 1
    deathPlayerScore.death = deathPlayerScore.death + 1
    Karin.Events.SnowBall.lobby[killer:getId()] = killerScore
    Karin.Events.SnowBall.lobby[deathPlayer:getId()] = deathPlayerScore
    for _, data in pairs(Karin.Events.SnowBall.lobby) do 
        local player = Player(data.id)
        if player then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'[Snow Ball] ' .. deathPlayerScore.name .. ' was soloed by ' .. killerScore.name .. '.')
        end
    end
    addStoragesToPlayers(killer, deathPlayer)
end

function addStoragesToPlayers(killer, deathPlayer)
    addKillToPlayer(killer)
    addDeathToPlayer(deathPlayer)
end

function addKillToPlayer(player)
    local kills = player:getStorageValue(Karin.Events.SnowBall.storages.Kill)
    if kills < 0 then
        kills = 0
    end
    player:setStorageValue(Karin.Events.SnowBall.storages.Kill, kills + 1)
end

function addDeathToPlayer(player)
    local deaths = player:getStorageValue(Karin.Events.SnowBall.storages.Death)
    if deaths < 0 then
        deaths = 0
    end
    player:setStorageValue(Karin.Events.SnowBall.storages.Kill, deaths + 1)
end

function startEvent()
    Karin.Events.SnowBall.enqueued = true
    if not Karin.Events.SnowBall.test then
        queueEvent(Karin.Events.SnowBall.schedule.toStartEvent + 1)
    else
        queueEvent(0)
    end
	
    if Karin.Events.SnowBall.teleport.pos then
        local tp = Game.createItem(1949, 1, Karin.Events.SnowBall.teleport.pos)
        if tp then
            tp:setDestination(Karin.Events.SnowBall.map.lobby.pos)
        end
        Karin.Events.SnowBall.teleport.tp = tp
    end
end

function finishEvent()
    Karin.Events.SnowBall.started = false
    Karin.Events.SnowBall.enqueued = false
    if Karin.Events.SnowBall.teleport.tp then
        Karin.Events.SnowBall.teleport.tp:remove()
        Karin.Events.SnowBall.teleport.tp = nil
    end
    rewardAll(Karin.Events.SnowBall.lobby)
    local str, players = rewardWinners(Karin.Events.SnowBall.lobby)
    if players then
        for k, data in pairs(players) do
            local tb = Karin.Events.SnowBall.winners[k]
            local player = Player(data.id)
            if player then
                if tb.item then
				local scorekill = data.kill  -- kills del jugador
				player:addItem(tb.item[1], tb.item[2] * scorekill)
				end
            end

        end
    end

    for key, player in pairs(getPlayersInEvent(
                                Karin.Events.SnowBall.map.pos,
                                Karin.Events.SnowBall.map.ranges.x, 
                                Karin.Events.SnowBall.map.ranges.y))do
        local playerId = player:getId()
        addEvent(function ()
            local p = Player(playerId)
            if p then
                p:teleportTo(Karin.Events.SnowBall.map.exitTo)
                showRankModal(p, str)

            end
            
        end, key * 10)
    end

   

    

end

function rewardAll(lobby)
    -- for k, data in pairs(lobby) do
    --     local player = Player(data.id)
    --     if player then
            
    --     end
    -- end
end

function rewardWinners(lobby)
    local new_widgets = {}
    for i, v in pairs(lobby) do
        table.insert(new_widgets, {kill = v.kill, name = v.name, id = v.id, accId = v.accId})
    end

    table.sort(new_widgets, function(a, b) return a.kill > b.kill end)
    local limit = 1
    local str = ''
    local players = {}
    for key, data in pairs(new_widgets) do
        if limit < 4 then
            str = str.."\n"..limit.."- "..data.name.." ("..data.kill..")."
            limit = limit + 1
            table.insert(players,data)
        end
    end

    return str, players 
end

function queueFinishEvent(time)
    time = time - 1
    if time > 0 then
        if time <= 5 then
            Game.broadcastMessage('Snow Ball Event will finish in '..time..(time > 1 and " minutes!" or " minute!"), MESSAGE_STATUS_WARNING)
        end
        if Karin.Events.SnowBall.test then
            addEvent(queueFinishEvent, 5000, time)
        else
            addEvent(queueFinishEvent, 59000, time)
        end
        
    elseif time <= 0 then
        finishEvent()
    end
end

function teleportAndStart()
    addEvent(function ()
        Game.broadcastMessage('Snow Ball Event started!', MESSAGE_LOOK)
        Karin.Events.SnowBall.lobby = {}
        Karin.Events.SnowBall.started = true
        addEvent(increaseAmmoEvent, Karin.Events.SnowBall.increaseAmmoAfterSeconds * 1000)
        queueFinishEvent(Karin.Events.SnowBall.schedule.toFinishEvent + 1)
        for key, player in pairs(getPlayersInEvent(
                                    Karin.Events.SnowBall.map.lobby.pos,
                                    Karin.Events.SnowBall.map.lobby.ranges.x, 
                                    Karin.Events.SnowBall.map.lobby.ranges.y))do
            local playerId = player:getId()
            addEvent(function (pid)
                local p = Player(pid)
                if p then
                    p:teleportTo(Karin:getFreePosition(Karin.Events.SnowBall.map.pos, Karin.Events.SnowBall.map.ranges.x * 0.7))
                end
                
            end, key * 10, playerId)
        end
    end, 5000)
end
function queueEvent(time)
    time = time - 1
    if time > 0 then
        Game.broadcastMessage('Snow Ball Event is starting in '..time..(time > 1 and " minutes!" or " minute! Use the command !snowball to shoot."), MESSAGE_STATUS_WARNING)
        addEvent(queueEvent, 60 * 1000, time)
    else
        teleportAndStart()
    end
end

local snowball = TalkAction("!snowball")

function snowball.onSay(player, words, param)	

    if param == 'start' then
        if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
            return RETURN_TALK
        end

        startEvent()
    end
    if param and param == 'rank' then
        showRankModal(player)
        return RETURN_TALK
    end
    if not Karin.Events.SnowBall.started then
        return RETURN_TALK
    end
    if not isPlayerInEvent(player:getId(), Karin.Events.SnowBall.map.pos,Karin.Events.SnowBall.map.ranges.x,Karin.Events.SnowBall.map.ranges.y) then
        return RETURN_TALK
    end
   
    local pid = player:getId()
    if not (Karin.Events.SnowBall.players[pid]) or Karin.Events.SnowBall.players[pid] <= 0 then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage('You have no snow balls')
        return RETURN_TALK
    end
    local x = 1
    local toPosition = player:getPosition()
    for x = 1, x + 6 do
		toPosition:getNextPosition(player:getDirection())
        if Tile(toPosition) and Tile(toPosition):isWalkable(true, false, true, true, true) then
            local tile = Tile(toPosition)
            addEvent(function(pos)
                local tile = Tile(pos)
                
                if tile and tile:getCreatureCount() > 0 then
                    local creatures = tile:getCreatures()
                    if creatures and #creatures > 0 and creatures[1] and creatures[1] ~= player then
                        pos:sendMagicEffect(CONST_ME_POFF)
                        pos:sendAnimatedText('Dead')
                        Game.createItem(32707, 1, pos)
                        Karin:sendNearSound(pos, SOUND_EFFECT_TYPE_DIST_ATK_THROW_SHOT)
                        creatures[1]:teleportTo(Karin:getFreePosition(Karin.Events.SnowBall.map.pos, Karin.Events.SnowBall.map.ranges.x * 0.7))
                        addScoresToPlayers(player, creatures[1])
                    end
                end
            end, 60 * x, Position(toPosition.x,toPosition.y,toPosition.z))
            if tile and tile:getCreatureCount() > 0 then
                break
            end
        else
            break
        end
        
    end
    player:getPosition():sendDistanceEffect(toPosition, CONST_ANI_SNOWBALL)
    Karin:sendNearSound(player:getPosition(), SOUND_EFFECT_TYPE_DIST_ATK_THROW)
    Karin.Events.SnowBall.players[pid] = Karin.Events.SnowBall.players[pid] - 1
    player:sendCancelMessage('Snow balls: ' .. Karin.Events.SnowBall.players[pid])
    return RETURN_TALK
end
snowball:separator(" ")
snowball:groupType("normal")
snowball:register()



function getPlayersInEvent(pos,rangeX,rangeY)
    local players = {}
    for w,p in pairs(Game.getSpectators(pos, true, true, rangeX, rangeX, rangeY, rangeY)) do
        table.insert(players, p)
    end
    return players
end

function isPlayerInEvent(pid, pos,rangeX,rangeY)
    local players = {}
    for w,p in pairs(Game.getSpectators(pos, true, true, rangeX, rangeX, rangeY, rangeY)) do
        if p:getId() == pid then
            return true
        end
    end
    return false
end

local snowBallTalkAction = TalkAction("!sb")
function snowBallTalkAction.onSay(player, words, param)
    if not player:getGroup():getAccess() then
        return true
    end
    
    if player:getAccountType() < ACCOUNT_TYPE_GOD then
        return false
    end
    if not Karin.Events.SnowBall.started then
        startEvent()
    end
    return false
end
snowBallTalkAction:groupType('god')
snowBallTalkAction:register()

function increaseAmmoEvent()
    if Karin.Events.SnowBall.started then
        for _, player in pairs(getPlayersInEvent(Karin.Events.SnowBall.map.pos,Karin.Events.SnowBall.map.ranges.x,Karin.Events.SnowBall.map.ranges.y)) do
            local pid = player:getId()
            if not Karin.Events.SnowBall.players[pid] then
                Karin.Events.SnowBall.players[pid] = Karin.Events.SnowBall.maxAmmo
            end

            if Karin.Events.SnowBall.players[pid] < Karin.Events.SnowBall.maxAmmo then
                Karin.Events.SnowBall.players[pid] = Karin.Events.SnowBall.players[pid] + 1
                player:sendCancelMessage('Snow balls: ' .. Karin.Events.SnowBall.players[pid])
            end
        end
        addEvent(increaseAmmoEvent, Karin.Events.SnowBall.increaseAmmoAfterSeconds * 1000)
    end
end



if not Karin.Events.SnowBall.teleport.pos then
    local karin_teleports = MoveEvent()

    function karin_teleports.onStepIn(creature, item, position, fromPosition)
        
        if not creature:isPlayer() then
            creature:teleportTo(fromPosition)
            return true
        end

        if Karin.Events.SnowBall.started then
            creature:teleportTo(fromPosition)
            return true
        end

        if not Karin.Events.SnowBall.enqueued then
            creature:teleportTo(fromPosition)
            return true
        end

        creature:teleportTo(Karin.Events.SnowBall.map.lobby.pos)
        return true
    end

    karin_teleports:position(
        Karin.Events.SnowBall.teleport.pos
    )

    karin_teleports:register()
end

local function StartSnowballEvent()
    startEvent()
end

EventManager.register("Snowball Event", StartSnowballEvent)