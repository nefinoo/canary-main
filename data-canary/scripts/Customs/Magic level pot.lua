-- Enhanced Magic Level Potion RevScript
local enhancedMagicPotion = Action()

function enhancedMagicPotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local COOLDOWN_STORAGE = 1988
    local SECONDARY_STORAGE = 1990
    local DURATION = 15000 -- 15 segundos
    local MAGIC_LEVEL_BONUS = 500

    -- Verificar cooldown
    if player:getStorageValue(COOLDOWN_STORAGE) > os.time() then
        local timeLeft = player:getStorageValue(COOLDOWN_STORAGE) - os.time()
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You can use this again in %d second(s).", timeLeft))
        return true
    end

    -- Crear condición de magic level boost
    local condition = Condition(CONDITION_ATTRIBUTES)
    condition:setParameter(CONDITION_PARAM_TICKS, DURATION)
    condition:setParameter(CONDITION_PARAM_SUBID, 1) -- SubID válido
    condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, MAGIC_LEVEL_BONUS)
    condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

    -- Aplicar condición
    if player:addCondition(condition) then
        local pos = player:getPosition()
        pos:sendMagicEffect(CONST_ME_MAGIC_RED)
        pos:sendMagicEffect(CONST_ME_MAGIC_BLUE)

        player:say("This could do some good..", TALKTYPE_MONSTER_SAY)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "MAGIC BOOST! +500 magic level for 15 seconds!")
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your spells will be much more powerful.")

        player:setStorageValue(COOLDOWN_STORAGE, os.time() + 15)
        player:setStorageValue(SECONDARY_STORAGE, os.time() + 15)

        -- addEvent: mensaje final
        addEvent(function()
            local p = Player(player:getId())
            if p then
                p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The magic boost effect has worn off.")
                p:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
        end, DURATION)

    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The potion had no effect.")
    end

    return true
end

enhancedMagicPotion:id(50993)
enhancedMagicPotion:register()
