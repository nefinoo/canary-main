local wallPosition = Position(33011, 32095, 10) -- wall position
local wallId = 1777 -- wall ID
local revertTime = 1 * 60 * 1000 -- 30 minutos en milisegundos

local function revertWall()
    Game.createItem(wallId, 1, wallPosition)
    wallPosition:sendMagicEffect(CONST_ME_POFF)
    -- Game.broadcastMessage("Stone comeback.", MESSAGE_EVENT_ADVANCE)
    creature:sendTextMessage(MESSAGE_ADMINISTRATOR, "Stone comeback.")
end

local function revertLever(position)
    local leverItem = Tile(position):getItemById(2773)
    if leverItem then
        leverItem:transform(2772)
    end
end

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == 2772 then
        local removeWall = Tile(wallPosition):getItemById(wallId)
        if removeWall then
            removeWall:remove()
            wallPosition:sendMagicEffect(CONST_ME_POFF)
            -- Game.broadcastMessage("Stone was destroyed for 1 Minute!", MESSAGE_EVENT_ADVANCE)
            player:sendTextMessage(MESSAGE_LOOK,"Stone was destroyed for 1 Minute!")
            addEvent(revertWall, revertTime)
        end

        item:transform(2773)
        addEvent(revertLever, revertTime, toPosition)
    end
    return true
end

-- Registrar por itemid
lever:aid(5945)
lever:register()
