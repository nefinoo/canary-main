function onSpeak(player, type, message)
    player:sendCancelMessage("You cannot speak in this channel.")
    return false
end