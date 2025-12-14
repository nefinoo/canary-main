local spell = Spell("instant")

-- Config
local ctfArena = {
    fromPos = Position(659, 483, 7),
    toPos = Position(769, 569, 7),
}

-- Spell properties
spell:name("Mana Waste")
spell:words("manawaste")
spell:blockWalls(true)
spell:needLearn(false)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:mana(0)

-- Helper: area check
local function isInArea(pos, fromPos, toPos)
    return pos.x >= fromPos.x and pos.x <= toPos.x
       and pos.y >= fromPos.y and pos.y <= toPos.y
       and pos.z == fromPos.z and pos.z == toPos.z
end

function spell.onCastSpell(player, variant)
    local pos = player:getPosition()

    -- Zona prohibida (event)
    if isInArea(pos, ctfArena.fromPos, ctfArena.toPos) then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, manawaste has been disabled for this event.")
        return true
    end

    local mana = player:getMana()

    if mana <= 0 then
        player:sendCancelMessage("You don't have any mana.")
        return false
    end

    -- Efecto visual
    pos:sendMagicEffect(47)

    -- Simular gasto de mana real
    player:addManaSpent(mana)   -- añade mana gastada para magic level
    player:addMana(-mana)       -- le quita toda la mana

    return true
end

spell:register()
