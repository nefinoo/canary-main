-- Attack Speed Plant RevScript
-- Planta ID 3489 que aumenta el attack speed a 500ms por 15 segundos

local attackSpeedPlant = Action()

function attackSpeedPlant.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verificar si el jugador ya tiene el efecto activo
    if player:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 1) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Ya tienes el efecto de attack speed activo.")
        return true
    end
    
    -- Crear la condición de attack speed
    local condition = Condition(CONDITION_ATTRIBUTES)
    condition:setTicks(15000) -- 15 segundos
    condition:setParameter(CONDITION_PARAM_SUBID, 1)
    condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
    condition:setParameter(CONDITION_PARAM_SKILL_FIST, 240) -- 500ms = 0.5 segundos
    
    -- Aplicar la condición al jugador
    player:addCondition(condition)
    
    -- Efectos visuales y de sonido
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    player:say("¡ULTRA SPEED!")
    
    -- Mensaje al jugador
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "¡Tu attack speed ha aumentado a 0.5 segundos por 15 segundos!")
    
    -- Remover la planta después del uso
    item:remove(1)
    return true
end

attackSpeedPlant:id(5953)
attackSpeedPlant:register()