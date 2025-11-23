local autoBroadcast = GlobalEvent("AutoBroadcast")
function autoBroadcast.onThink(interval, lastExecution)
    local messages = {
    "[DONATES]: Support our server to improve map/systems and maintenance to 24/7",
    "[COMMANDS]: Use !commands to see all commands and what they do",
    "[YOUTUBE]: Visit our youtube channel to check the animations of the spells, send your funny videos, wars, etc.",
    "[COINS]: Every so often you will receive 1 currency which you can spend to craft items, buy premium, and use it as the most important transaction currency in the game. It can also be obtained by looting bosses and doing tasks."
}

    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_EVENT_ADVANCE)
    return true
end

autoBroadcast:interval(1200000) --5 minutes
autoBroadcast:register()