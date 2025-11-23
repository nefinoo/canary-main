local scheduler = GlobalEvent("RandomEventScheduler")

function scheduler.onThink(interval)
    EventManager.startRandomEvent()
    return true
end

scheduler:interval(30 * 60 * 1000) -- 1 hora
scheduler:register()
