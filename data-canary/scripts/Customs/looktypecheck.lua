local looktypes = TalkAction("!look")

local config = {
    minLookType = 2,
    maxLookType = 2207,

    -- true = bloquear IDs de la lista negra
    -- false = permitir probar cualquier ID del rango
    useBlacklist = false
}

-- Lista de lookTypes bloqueados
local invalidTypes = {
    1, 135, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170,
    171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181,
    182, 183, 184, 185, 186, 187, 188, 189, 190, 191,
    411, 415, 424, 439, 440, 468, 469, 474, 475, 476,
    477, 478, 479, 480, 481, 482, 483, 484, 485,
    501, 518, 519, 520, 524, 525, 536, 543, 549,
    576, 581, 582, 597, 616, 623, 625, 638, 639,
    640, 641, 642, 643, 645, 646, 652, 653, 654,
    655, 656, 657, 658, 659, 660, 661, 662, 663
}

-- Convertir lista en tabla de busqueda
local blacklist = {}

for _, id in ipairs(invalidTypes) do
    blacklist[id] = true
end

function looktypes.onSay(player, words, param)

    if not player:getGroup():getAccess() then
        return true
    end

    if not param or param == "" then
        player:sendCancelMessage(
            "Usage: !look lookType or !look lookType, playerName"
        )
        return true
    end

    local params = param:split(",")

    local input = params[1]:match("^%s*(.-)%s*$")
    local lookType = tonumber(input)

    -- Permitir nombres de monstruos
    if not lookType then
        local monster = MonsterType(input)

        if not monster then
            player:sendCancelMessage(
                "A monster with that name does not exist."
            )
            return true
        end

        local outfit = monster:getOutfit()

        if not outfit then
            player:sendCancelMessage(
                "This monster does not have an outfit."
            )
            return true
        end

        lookType = outfit.lookType
    end

    -- Verificar rango permitido
    if not lookType
    or lookType % 1 ~= 0
    or lookType < config.minLookType
    or lookType > config.maxLookType then

        player:sendCancelMessage(
            "LookType must be between " ..
            config.minLookType .. " and " ..
            config.maxLookType .. "."
        )

        return true
    end

    -- Verificar lista negra
    if config.useBlacklist and blacklist[lookType] then
        player:sendCancelMessage(
            "LookType " .. lookType .. " is blacklisted."
        )
        return true
    end

    -- Seleccionar jugador
    local targetPlayer = player

    if params[2] then
        local playerName = params[2]:match("^%s*(.-)%s*$")

        targetPlayer = Player(playerName)

        if not targetPlayer then
            player:sendCancelMessage(
                "A player with that name does not exist or is not online."
            )
            return true
        end
    end

    -- Aplicar lookType
    local outfit = targetPlayer:getOutfit()

    outfit.lookType = lookType

    targetPlayer:setOutfit(outfit)

    player:sendTextMessage(
        MESSAGE_EVENT_ADVANCE,
        "Attempted to apply LookType " .. lookType ..
        " to " .. targetPlayer:getName() .. "."
    )

    return true
end

looktypes:separator(" ")
looktypes:groupType("god")
looktypes:register()