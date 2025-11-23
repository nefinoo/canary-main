EventManager = {
    events = {},     
    activeEvent = nil,
    lastEventName = nil  -- 👈 almacena el último evento usado
}

-- Registrar un evento
function EventManager.register(name, startFunction)
    EventManager.events[#EventManager.events + 1] = {
        name = name,
        start = startFunction
    }
end

-- Elegir un evento aleatorio asegurando NO repetir el mismo
function EventManager.startRandomEvent()
    local total = #EventManager.events
    if total == 0 then
        print("[EventManager] No events registered.")
        return
    end

    local chosen = nil

    if total == 1 then
        -- Solo existe 1 evento, no hay forma de evitar repetir
        chosen = EventManager.events[1]
    else
        -- Elegir evento diferente al anterior
        repeat
            chosen = EventManager.events[math.random(1, total)]
        until chosen.name ~= EventManager.lastEventName
    end

    -- Guardar como último evento
    EventManager.lastEventName = chosen.name
    EventManager.activeEvent = chosen

    Game.broadcastMessage(
        "[GLOBAL EVENT] Starting event: " .. chosen.name .. "!",
        MESSAGE_EVENT_ADVANCE
    )

    chosen.start()
end

return EventManager
