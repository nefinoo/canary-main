local ironMaiden = Action()

local IRON_MAIDEN_OPEN = 5474
local IRON_MAIDEN_CLOSED = 5473

function ironMaiden.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    -- Si está ABIERTO → se cierra y mata
    if item.itemid == IRON_MAIDEN_OPEN then
		player:say("*CRUNCH!!*", TALKTYPE_MONSTER_SAY)
        fromPosition:sendMagicEffect(CONST_ME_DRAWBLOOD)
        item:transform(IRON_MAIDEN_CLOSED)
        -- Muerte instantánea
        player:addHealth(-player:getHealth())
        return true
    end

    -- Si está CERRADO → se abre
    if item.itemid == IRON_MAIDEN_CLOSED then
        player:say("*creeeeeak*", TALKTYPE_MONSTER_SAY)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        item:transform(IRON_MAIDEN_OPEN)
        return true
    end

    return true
end

ironMaiden:id(IRON_MAIDEN_OPEN, IRON_MAIDEN_CLOSED)
ironMaiden:register()
