local config = {
    depot    = Position(518, 840, 7),
    arena    = Position(520, 856, 8),
    trainers = Position(593, 662, 7),
    quests   = Position(212, 783, 4),
    hunt     = Position(576, 755, 7),
    temple   = Position(501, 807, 7)
}

local ctfArena = {
    frompos = Position(659, 483, 7),
    topos   = Position(769, 569, 7)
}

local warArena = {
    frompos = Position(638, 711, 7),
    topos   = Position(751, 780, 7)
}

local SCROLL_ITEM_ID = 51736
local STORAGE_TELEPORT = 12699

local talk = TalkAction("!tp")

function talk.onSay(player, words, param)
    param = param:lower()

    if param == "" then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must specify where you would like to go (depot, arena, trainers, quests, hunt, temple).")
        return false
    end

    -- ¿Tiene el spell desbloqueado?
    -- if player:getStorageValue(STORAGE_TELEPORT) <= 0 then
        -- player:sendCancelMessage("Sorry, you do not have any teleport spells.")
        -- return false
    -- end

    -- No permitir teletransportarse dentro de eventos
    local playerPos = player:getPosition()

    if playerPos:isInRange(warArena.frompos, warArena.topos)
        or playerPos:isInRange(ctfArena.frompos, ctfArena.topos) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can not teleport while in team pvp event.")
        return false
    end

    -- Requiere el ítem
    if player:getItemCount(SCROLL_ITEM_ID) < 1 then
        player:sendCancelMessage("You must have the teleport scroll in your inventory.")
        return false
    end

    -- No en battle
    if player:hasCondition(CONDITION_INFIGHT) then
        player:sendCancelMessage("You may not teleport while in combat.")
        return false
    end

    local destinations = {
        depot    = config.depot,
        arena    = config.arena,
        trainers = config.trainers,
        quests   = config.quests
    }

    local oldPos = player:getPosition()

    if param == "house" then
        local house = player:getHouse()
        if not house then
            player:sendCancelMessage("You do not own a house.")
            return false
        end

        local entry = house:getExitPosition()
        if entry then
            player:teleportTo(entry)
			player:removeItem(SCROLL_ITEM_ID, 1)
            oldPos:sendMagicEffect(CONST_ME_POFF)
            entry:sendMagicEffect(CONST_ME_TELEPORT)
        end
        return false
    end

    -- Teleports normales
    local dest = destinations[param]
    if not dest then
        player:sendCancelMessage("There is no such place.")
        return false
    end

    player:teleportTo(dest)
	player:removeItem(SCROLL_ITEM_ID, 1)
    oldPos:sendMagicEffect(CONST_ME_POFF)
    dest:sendMagicEffect(CONST_ME_TELEPORT)
    return false
end

talk:separator(" ")
talk:groupType("normal")
talk:register()
