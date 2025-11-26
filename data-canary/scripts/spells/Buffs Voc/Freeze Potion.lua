-- Mass Paralysis Potion RevScript - CONTADOR MEJORADO
local massParalysis = Action()

-- Configuración
local config = {
    paralysisDuration = 10000, -- 20 segundos
    cooldownStorage = 1988,
    longCooldownStorage = 1985,
    targetCooldownStorage = 1989,
    areaRadiusX = 7,
    areaRadiusY = 5,
    counterStorageBase = 50000 -- Base para storages de contador
}

function massParalysis.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verificar cooldown del jugador
    if player:getStorageValue(config.cooldownStorage) > os.time() then
        local timeLeft = player:getStorageValue(config.cooldownStorage) - os.time()
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You can use this again in %d second(s).", timeLeft))
        return true
    end

    -- Verificar protection zone
    local playerTile = Tile(player:getPosition())
    if playerTile and playerTile:hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot use this in a protection zone.")
        return true
    end

    -- Crear condición de parálisis
    local paralysisCondition = Condition(CONDITION_ROOTED)
    paralysisCondition:setParameter(CONDITION_PARAM_TICKS, config.paralysisDuration)

    -- Obtener espectadores
    local centerPos = player:getPosition()
    local spectators = Game.getSpectators(centerPos, false, true, config.areaRadiusX, config.areaRadiusY, config.areaRadiusX, config.areaRadiusY)
    
    local affectedCount = 0

    -- Configurar cooldowns
    player:setStorageValue(config.longCooldownStorage, os.time() + 120)
    player:setStorageValue(config.cooldownStorage, os.time() + 20)

    -- Remover item
    -- item:remove(1)

    -- Procesar espectadores
    for _, spectator in ipairs(spectators) do
        if spectator:getId() ~= player:getId() then
            local spectatorTile = Tile(spectator:getPosition())
            if spectatorTile and not spectatorTile:hasFlag(TILESTATE_PROTECTIONZONE) then
                local shouldAffect = true
                
                if spectator:isPlayer() then
                    if spectator:getStorageValue(config.longCooldownStorage) > os.time() then
                        shouldAffect = false
                    else
                        spectator:setStorageValue(config.targetCooldownStorage, os.time() + 20)
                    end
                end
                
                if shouldAffect then
                    spectator:getPosition():sendMagicEffect(44)
                    spectator:addCondition(paralysisCondition)
                    affectedCount = affectedCount + 1
                    
                    if spectator:isPlayer() then
                        spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, 
                            string.format("You have been frozen by %s!", player:getName()))
                        
                        -- Iniciar contador visual mejorado
                        startEnhancedCounter(spectator, config.paralysisDuration)
                    end
                end
            end
        end
    end

    -- Efectos finales
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    -- player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Frozen affected %d creatures!", affectedCount))

    return true
end

-- Contador visual mejorado
function startEnhancedCounter(player, duration)
    local totalSeconds = math.floor(duration / 1000)
    local currentSecond = totalSeconds
    
    local function showCounter()
        if not player or not player:isPlayer() then
            return
        end
        
        -- Verificar si sigue paralizado
        local condition = player:getCondition(CONDITION_ROOTED, CONDITIONID_COMBAT)
        if not condition then
            player:say("FREE!", TALKTYPE_MONSTER_SAY)
            return
        end
        
        -- Mostrar contador
        if currentSecond > 3 then
            player:say(tostring(currentSecond), TALKTYPE_MONSTER_SAY)
            player:getPosition():sendMagicEffect(43)
        elseif currentSecond > 0 then
            -- Últimos 3 segundos con énfasis
            player:say(tostring(currentSecond), TALKTYPE_MONSTER_SAY)
            player:getPosition():sendMagicEffect(488)
        else
            player:say("FREE!", TALKTYPE_MONSTER_SAY)
            player:getPosition():sendMagicEffect(489)
            return
        end
        
        currentSecond = currentSecond - 1
        addEvent(showCounter, 1000)
    end
    
    -- Primer contador inmediato
    addEvent(showCounter, 100)
end

massParalysis:allowFarUse(true)
massParalysis:id(14052)
massParalysis:register()