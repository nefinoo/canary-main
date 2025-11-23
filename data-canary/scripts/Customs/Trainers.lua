local trainersStepIn = MoveEvent()

trainersStepIn:type("stepin")

-- Configuración
local TRAIN_MONSTER = "Training Monk" -- Nombre del monstruo que se invoca

function trainersStepIn.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return true
    end

    local playerPos = creature:getPosition()

    -- Coordenadas norte
    local northWest = Position(playerPos.x - 1, playerPos.y - 1, playerPos.z)
    local northEast = Position(playerPos.x + 1, playerPos.y - 1, playerPos.z)

    -- Coordenadas sur
    local southWest = Position(playerPos.x - 1, playerPos.y + 1, playerPos.z)
    local southEast = Position(playerPos.x + 1, playerPos.y + 1, playerPos.z)

    if item.actionid == 1212 then
        -- Zona norte
        if not Tile(northWest):getTopCreature() and not Tile(northEast):getTopCreature() then
            Game.createMonster(TRAIN_MONSTER, northWest)
            Game.createMonster(TRAIN_MONSTER, northEast)
            playerPos:sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end

    elseif item.actionid == 2121 then
        -- Zona sur
        if not Tile(southWest):getTopCreature() and not Tile(southEast):getTopCreature() then
            Game.createMonster(TRAIN_MONSTER, southWest)
            Game.createMonster(TRAIN_MONSTER, southEast)
            playerPos:sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end

    return true
end

-- Registramos ambos actionid
trainersStepIn:aid(1212, 2121)
trainersStepIn:register()


local trainersStepOut = MoveEvent()

trainersStepOut:type("stepout")

-- Configuración
local TRAIN_MONSTER = "Training Monk" -- Nombre del monstruo usado

function trainersStepOut.onStepOut(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return true
    end

    local playerPos = creature:getPosition()

    -- Coordenadas norte
    local northWest = Position(playerPos.x - 1, playerPos.y - 2, playerPos.z)
    local northEast = Position(playerPos.x + 1, playerPos.y - 2, playerPos.z)

    -- Coordenadas sur
    local southWest = Position(playerPos.x - 1, playerPos.y + 2, playerPos.z)
    local southEast = Position(playerPos.x + 1, playerPos.y + 2, playerPos.z)

    if item.actionid == 1212 then
        -- Eliminar del norte
        for _, pos in ipairs({northWest, northEast}) do
            local monster = Tile(pos):getTopCreature()
            if monster and monster:isMonster() and monster:getName():lower() == TRAIN_MONSTER:lower() then
                pos:sendMagicEffect(CONST_ME_POFF)
                monster:remove()
            end
        end

    elseif item.actionid == 2121 then
        -- Eliminar del sur
        for _, pos in ipairs({southWest, southEast}) do
            local monster = Tile(pos):getTopCreature()
            if monster and monster:isMonster() and monster:getName():lower() == TRAIN_MONSTER:lower() then
                pos:sendMagicEffect(CONST_ME_POFF)
                monster:remove()
            end
        end
    end

    return true
end

-- Registramos ambos actionid
trainersStepOut:aid(1212, 2121)
trainersStepOut:register()
