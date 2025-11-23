local expscroll = Action()

-- CONFIGURACIÓN
local BOOST_PERCENT = 100         -- el bonus en %
local BOOST_DURATION = 3600        -- minutos por uso (1 hora)
local BOOST_LIMIT = 3            -- veces por día
local STORAGE_LIMIT = 50000      -- storage donde guardaremos los usos por día

function expscroll.onUse(player, item, fromPosition, itemEx, toPosition)

    -- Cantidad usada hoy
    local usedToday = player:getStorageValue(STORAGE_LIMIT)
    if usedToday < 0 then
        usedToday = 0
    end

    -- Límite diario
    if usedToday >= BOOST_LIMIT then
        player:sendCancelMessage("You have reached the daily XP boost limit. Try again after Server Save.")
        return true
    end

    -- Ver si ya tiene un boost activo
    local currentPercent = player:getXpBoostPercent()
    if currentPercent > 0 then
        player:sendCancelMessage("You already have an active XP boost.")
        return true
    end

    -- Tiempo restante de boost actual (en minutos)
    local currentTime = player:getXpBoostTime()

    -- Aplicar nuevo boost
    player:setXpBoostPercent(BOOST_PERCENT)
    player:setXpBoostTime(currentTime + BOOST_DURATION)

    -- Consumir scroll
    item:remove(1)

    -- +1 a usos del día
    player:setStorageValue(STORAGE_LIMIT, usedToday + 1)

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
        "Your hour of +" .. BOOST_PERCENT .. "% bonus experience has started!"
    )

    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

    return true
end

expscroll:id(51756)   -- ID del scroll
expscroll:register()

