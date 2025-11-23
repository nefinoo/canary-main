local config = {
bangleID = 2127,
tearID = 6536,
stealthID = 2202,
waitingRoom = {x=634, y=638, z=7}
}
function onStepIn(cid, item, position, fromPosition)

if getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == config.bangleID 
or getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == config.tearID
or getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == config.stealthID then
name = getItemNameById(getPlayerSlotItem(cid, CONST_SLOT_RING).itemid)
if doPlayerAddItem(cid,getPlayerSlotItem(cid, CONST_SLOT_RING).itemid,1,false) then

doPlayerRemoveItem(cid,getPlayerSlotItem(cid, CONST_SLOT_RING).itemid,1)
doTeleportThing(cid,config.waitingRoom,false)
doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,'You may not wear '..name..' in a team pvp event!')
doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Your "..name.." was removed and placed in your inventory.")
else
doTeleportThing(cid,fromPosition,false)
doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"You may not wear this in a team pvp event, please take off your "..name.."")
end
else
doTeleportThing(cid,config.waitingRoom,false)
end
return true
end