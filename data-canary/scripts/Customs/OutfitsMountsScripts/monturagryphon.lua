local requiredItems = {
    31572,
    31573,
    31574,
    31575
}

local resultItemId = 31576

local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verificar que el jugador tenga todos los items
    for _, itemId in ipairs(requiredItems) do
        if player:getItemCount(itemId) < 1 then
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "You lack the required relics to complete the ritual.")
            return true
        end
    end

    -- Remover los items
    for _, itemId in ipairs(requiredItems) do
        player:removeItem(itemId, 1)
    end

    -- Crear el item resultante
    player:addItem(resultItemId, 1)

    -- Feedback visual
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The four relics dissolve, leaving behind a powerful artifact.")

    return true
end

-- Registrar los 4 items para que cualquiera active la acción
for _, itemId in ipairs(requiredItems) do
    action:id(itemId)
end

action:register()
