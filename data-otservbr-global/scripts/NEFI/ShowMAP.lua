local mapUncover = TalkAction("/uncovermap")

function mapUncover.onSay(player, words, param)
    if not player:getGroup():getAccess() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have permission to use this command.")
        return true
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Starting map uncovering...")

    local startx, starty, startz = 4797, 4800, 7 -- start position
    local endx, endy, endz = 5212, 5400, 7 -- end position
    local stepSize = 13 -- sqm per jump
    local delay = 0 -- speed

    local function canTeleportToPosition(pos)
        local tile = Tile(pos)
        local ground = tile and tile:getGround()
        return ground ~= nil
    end

    local function getNextPosition(x, y, z)
        x = x + stepSize
        if x > endx then
            x = startx
            y = y + stepSize
            if y > endy then
                y = starty
                z = z - 1
            end
        end
        return x, y, z
    end

    local function startMapUncovering(x, y, z)
        if z < endz then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Map uncovering complete.")
            return
        end

        local pos = Position(x, y, z)
        if canTeleportToPosition(pos) then
            player:teleportTo(pos)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Teleported to position: " .. x .. ", " .. y .. ", " .. z)
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Checked position (not teleporting): " .. x .. ", " .. y .. ", " .. z)
        end

        x, y, z = getNextPosition(x, y, z)
        addEvent(startMapUncovering, delay, x, y, z)
    end

    startMapUncovering(startx, starty, startz)
    return true
end

mapUncover:separator(" ")
-- mapUncover:groupType("gamemaster")
mapUncover:groupType("normal")
mapUncover:register()