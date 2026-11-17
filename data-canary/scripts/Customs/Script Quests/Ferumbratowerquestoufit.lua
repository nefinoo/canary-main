local config = {
    -- IDs
    leverOff = 2772,
    leverOn  = 2773,
    stoneId  = 2074,

    -- Duración en segundos (5 minutos)
    duration = 300,
	
	leverActionId = 45000,

    -- Posiciones de las 3 palancas
    levers = {
        Position(420, 581, 8),
        Position(412, 574, 5),
        Position(412, 585, 5),
    },

    -- Posición del stone
    stonePos = Position(421, 587, 3)
}

local function areAllLeversOn()
    for _, pos in ipairs(config.levers) do
        local lever = Tile(pos):getTopDownItem()
        if not lever or lever:getId() ~= config.leverOn then
            return false
        end
    end
    return true
end

local function resetPuzzle()
    -- Reaparecer stone
    if not Tile(config.stonePos):getItemById(config.stoneId) then
        Game.createItem(config.stoneId, 1, config.stonePos)
    end

    -- Resetear palancas
    for _, pos in ipairs(config.levers) do
        local lever = Tile(pos):getTopDownItem()
        if lever and lever:getId() == config.leverOn then
            lever:transform(config.leverOff)
        end
    end
end

local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Seguridad: solo palancas con ESTE actionid
    if item:getActionId() ~= config.leverActionId then
        return true
    end

    -- Alternar palanca
    if item:getId() == config.leverOff then
        item:transform(config.leverOn)
        fromPosition:sendMagicEffect(690)
    else
        item:transform(config.leverOff)
    end

    -- Verificar condición
    if areAllLeversOn() then
        local stone = Tile(config.stonePos):getItemById(config.stoneId)
        if stone then
            stone:remove()
            addEvent(resetPuzzle, config.duration * 1000)

            player:sendTextMessage(
                MESSAGE_EVENT_ADVANCE,
                "A loud crash echoes throughout the Ferumbras tower; perhaps something has opened..."
            )
        end
    end

    return true
end

-- 🔥 REGISTRO POR ACTIONID (NO itemid)
action:aid(config.leverActionId)
action:register()