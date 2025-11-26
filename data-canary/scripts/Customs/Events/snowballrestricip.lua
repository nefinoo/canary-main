local ipTeleport = MoveEvent()

ipTeleport:type("stepin")
ipTeleport:aid(7777)

function ipTeleport.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return true
    end

    local player = creature

    if Karin.hasSameIP(player) then
        player:teleportTo(fromPosition)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        player:popupFYI(
            "MULTICLIENT EVENT\n\n" ..
            "Only **one character per IP** is allowed.\n" ..
            "Another connection using your IP is already participating."
        )
        return true
    end

    -- Teleport permitido
    player:teleportTo(Karin.Events.SnowBall.map.lobby.pos)
    return true
end

ipTeleport:register()
