local bosslever = Action()
local config = {
    boss = {
        name = "Majin Boo",
        position = Position(595, 1099, 8),
    },
    playerPositions = {
        { pos = Position(594, 1133, 8), teleport = Position(590, 1112, 8) },
        { pos = Position(595, 1133, 8), teleport = Position(590, 1112, 8) },
        { pos = Position(596, 1133, 8), teleport = Position(590, 1112, 8) },
        { pos = Position(597, 1133, 8), teleport = Position(590, 1112, 8) },
    },
    specPos = {
        from = Position(584, 1096, 8),
        to = Position(608, 1116, 8),
    },
    teleportTimer = 900,
    cooldownTimer = 2 * 60 * 60,
    storage = 10011,

    -- 🔥 NUEVO
    minLevel = 10000
}

local function removeMonsterFromArea(fromPos, toPos)
    local exitPosition = Position(695, 970, 6)

    for x = fromPos.x, toPos.x do
        for y = fromPos.y, toPos.y do
            for z = fromPos.z, toPos.z do
                local tile = Tile(Position(x, y, z))
                if tile then
                    local creatures = tile:getCreatures()
                    if creatures then
                        for _, creature in ipairs(creatures) do
                            if creature:isMonster() then
                                creature:remove()
                            elseif creature:isPlayer() then
                                creature:teleportTo(exitPosition)
                            end
                        end
                    end
                end
            end
        end
    end
end

local function isPositionEqual(pos1, pos2)
    return pos1.x == pos2.x and pos1.y == pos2.y and pos1.z == pos2.z
end

-- 🔎 Obtiene todos los jugadores parados en los tiles
local function getPlayersOnTiles()
    local players = {}

    for _, positionData in ipairs(config.playerPositions) do
        local tile = Tile(positionData.pos)
        if tile then
            local creatures = tile:getCreatures()
            if creatures then
                for _, creature in ipairs(creatures) do
                    if creature:isPlayer() then
                        table.insert(players, creature)
                    end
                end
            end
        end
    end

    return players
end

function bosslever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- ⏳ Cooldown individual
    if player:getStorageValue(config.storage) > os.time() then
        local remaining = player:getStorageValue(config.storage) - os.time()
        player:sendTextMessage(
            MESSAGE_EVENT_ADVANCE,
            "You still have a cooldown. Remaining time: " .. os.date("!%X", remaining)
        )
        return true
    end

    -- Validar que el player esté en un tile
    local playerOnTile = false
    for _, positionData in ipairs(config.playerPositions) do
        if isPositionEqual(player:getPosition(), positionData.pos) then
            playerOnTile = true
            break
        end
    end

    if not playerOnTile then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must stand on one of the tiles to use the lever.")
        return false
    end

    local playersOnTiles = getPlayersOnTiles()

    -- 🔒 NIVEL MÍNIMO
    for _, p in ipairs(playersOnTiles) do
        if p:getLevel() < config.minLevel then
            player:sendTextMessage(
                MESSAGE_EVENT_ADVANCE,
                "All players must be at least level " .. config.minLevel .. " to enter this room."
            )
            return true
        end
    end

    -- ⏳ COOLDOWN DE CUALQUIERA
    for _, p in ipairs(playersOnTiles) do
        if p:getStorageValue(config.storage) > os.time() then
            player:sendTextMessage(
                MESSAGE_EVENT_ADVANCE,
                "One of the players has an active cooldown."
            )
            return true
        end
    end

    -- 🌐 BLOQUEO DE IP DUPLICADA
    local usedIps = {}
    for _, p in ipairs(playersOnTiles) do
        local ip = p:getIp()
        if usedIps[ip] then
            player:sendTextMessage(
                MESSAGE_EVENT_ADVANCE,
                "Players with the same IP cannot enter the boss room together."
            )
            return true
        end
        usedIps[ip] = true
    end

    -- Palanca ocupada
    if item.itemid == 8912 then
        player:say("Cling..", TALKTYPE_MONSTER_SAY)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sorry, this room is currently in use. Please, come back later.")
        return true
    end

    -- Activar boss
    if item.itemid == 8911 then
        item:transform(8912)
        Game.createMonster(config.boss.name, config.boss.position, 1)

        for _, positionData in ipairs(config.playerPositions) do
            local tile = Tile(positionData.pos)
            local creatures = tile and tile:getCreatures()
            if creatures then
                for _, creature in ipairs(creatures) do
                    if creature:isPlayer() then
                        creature:teleportTo(positionData.teleport, true)
                        positionData.teleport:sendMagicEffect(CONST_ME_TELEPORT)

                        creature:setStorageValue(
                            config.storage,
                            os.time() + config.cooldownTimer
                        )

                        creature:sendTextMessage(
                            MESSAGE_EVENT_ADVANCE,
                            "You have " .. config.teleportTimer .. " seconds to defeat the boss."
                        )
                    end
                end
            end
        end

        addEvent(function()
            item:transform(8911)
            removeMonsterFromArea(config.specPos.from, config.specPos.to)
        end, config.teleportTimer * 1000)
    end

    return true
end

bosslever:aid(5602)
bosslever:register()
