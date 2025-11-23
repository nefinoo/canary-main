-- Mass Paralysis Potion RevScript - CORREGIDO
-- Converted from TFS 0.4 to Canary Engine

local massParalysis = Action()

function massParalysis.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Configuración
    local PARALYSIS_DURATION = 20000 -- 20 segundos
    local COOLDOWN_STORAGE = 1988
    local LONG_COOLDOWN_STORAGE = 1985
    local TARGET_COOLDOWN_STORAGE = 1989
    local AREA_RADIUS_X = 7
    local AREA_RADIUS_Y = 5

    -- Verificar cooldown del jugador
    if player:getStorageValue(COOLDOWN_STORAGE) > os.time() then
        local timeLeft = player:getStorageValue(COOLDOWN_STORAGE) - os.time()
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You can use this again in %d second(s).", timeLeft))
        return true
    end

    -- Verificar si está en protection zone (MÉTODO CORREGIDO)
    local playerTile = Tile(player:getPosition())
    if playerTile and playerTile:hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot use this in a protection zone.")
        return true
    end

    -- Crear condición de parálisis
    local paralysisCondition = Condition(CONDITION_PARALYZE)
    paralysisCondition:setParameter(CONDITION_PARAM_TICKS, PARALYSIS_DURATION)
    paralysisCondition:setFormula(-1, 0, -1, 0) -- Velocidad reducida

    -- Obtener criaturas en el área usando el método nativo de Canary
    local centerPos = player:getPosition()
    local spectators = Game.getSpectators(centerPos, false, true, AREA_RADIUS_X, AREA_RADIUS_Y, AREA_RADIUS_X, AREA_RADIUS_Y)
    
    local affectedCount = 0

    -- Configurar cooldowns del usuario
    player:setStorageValue(LONG_COOLDOWN_STORAGE, os.time() + 120) -- 2 minutos
    player:setStorageValue(COOLDOWN_STORAGE, os.time() + 20)      -- 20 segundos

    -- Remover item
    -- item:remove(1)

    -- Procesar cada espectador
    for _, spectator in ipairs(spectators) do
        -- Saltar al usuario
        if spectator:getId() ~= player:getId() then
            -- Verificar si no está en protection zone (MÉTODO CORREGIDO)
            local spectatorTile = Tile(spectator:getPosition())
            if spectatorTile and not spectatorTile:hasFlag(TILESTATE_PROTECTIONZONE) then
                local shouldAffect = true
                
                -- Verificaciones para jugadores
                if spectator:isPlayer() then
                    -- Verificar cooldown del objetivo
                    if spectator:getStorageValue(LONG_COOLDOWN_STORAGE) > os.time() then
                        shouldAffect = false
                    else
                        -- Aplicar cooldown al objetivo
                        spectator:setStorageValue(TARGET_COOLDOWN_STORAGE, os.time() + 20)
                    end
                    
                    -- Aquí iría la verificación de party si existe
                    -- if arePlayersInSameParty(player, spectator) then
                    --     shouldAffect = false
                    -- end
                end
                
                -- Aplicar efectos si pasa todas las verificaciones
                if shouldAffect then
                    spectator:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
                    spectator:addCondition(paralysisCondition)
                    affectedCount = affectedCount + 1
                    
                    -- Mensaje para jugadores afectados
                    if spectator:isPlayer() then
                        spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, 
                            string.format("You have been paralyzed by %s for 20 seconds!", player:getName()))
                    end
                end
            end
        end
    end

    -- Efecto visual para el usuario
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 
        string.format("Paralysis wave affected %d creatures!", affectedCount))

    return true
end

massParalysis:id(11372) -- Ajusta el ID de la poción
massParalysis:register()