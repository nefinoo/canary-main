-- Simple teleport scroll script
local testAction = Action() -- this is our header, the first thing we have to write (except for configuration tables and such)

local config = {
    storage = 1000, -- Storage for timer
    time = 2, -- Time in seconds being multiplied by 60 down below. so 2 minutes.
    destination = {x=5000, y=5000, z=7}, -- Change your destination here.
}

function testAction.onUse(cid, item, fromPosition, target, toPosition, isHotkey) -- now we can design the action itself
    if getPlayerStorageValue(cid, config.storage) - os.time() > 1 then
        doPlayerSendTextMessage(cid, 22, "You must wait "..config.time.." minutes before using this scroll again.") -- Send cancel message
        return false
    end
    if getCreatureCondition(cid, CONDITION_INFIGHT) == false then -- check if player is in a fight
        setPlayerStorageValue(cid, config.storage, os.time() + config.time * 60) -- Setting storage + 2 times 60, so two mins.
        doTeleportThing(cid, config.destination) -- send player to position above at destination
        doPlayerSendTextMessage(cid, 19, "Your teleport scroll has been destroyed while you used its magic.") -- send scroll use message
        item:remove(1) -- remove the scroll
    else
        doPlayerSendTextMessage(cid, 22, "You cant teleport while in battle.") -- send cancel msg 
    end
    return true
end

testAction:id(51139) -- now its taking an item as id instead of an action id.
testAction:register() -- this is our footer, it has to be the last function executed