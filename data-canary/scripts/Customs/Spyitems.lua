local playerItems = TalkAction("/items")

local slots = {
    [1] = {slot = CONST_SLOT_HEAD, name = "[Head]: "},
    [2] = {slot = CONST_SLOT_NECKLACE, name = "[Necklace]: "},
    [3] = {slot = CONST_SLOT_BACKPACK, name = "[Backpack]: "},
    [4] = {slot = CONST_SLOT_ARMOR, name = "[Armor]: "},
    [5] = {slot = CONST_SLOT_RIGHT, name = "[Right Hand]: "},
    [6] = {slot = CONST_SLOT_LEFT, name = "[Left Hand]: "},
    [7] = {slot = CONST_SLOT_LEGS, name = "[Legs]: "},
    [8] = {slot = CONST_SLOT_FEET, name = "[Feet]: "},
    [9] = {slot = CONST_SLOT_RING, name = "[Ring]: "},
    [10] = {slot = CONST_SLOT_AMMO, name = "[Ammo]: "}
}

function playerItems.onSay(player, words, param)
    local target = nil
    
    if not param or param == "" then
        target = player
    else
        target = Player(param)
    end
    
    if not target then
        player:sendCancelMessage("Player is not online or doesn't exist.")
        return false
    end
    
    
    local container = player:getSlotItem(CONST_SLOT_BACKPACK)
    

    if container then
        local containerItems = container:getItems(true)
        
        local items = {}
            
        for i = 1, #containerItems do
            if not items[containerItems[i]:getName()] then
                items[containerItems[i]:getName()] = 0
            end
            
            if containerItems[i]:getCount() and containerItems[i]:getCount() > 1 then
                items[containerItems[i]:getName()] = items[containerItems[i]:getName()] + containerItems[i]:getCount()
            else
                items[containerItems[i]:getName()] = items[containerItems[i]:getName()] + 1
            end
        end
            
        local text2 = ""
        local nLine = 0

        for i, v in pairs(items) do
            text2 = text2.."["..i.."]: "..v.."\n"
            nLine = nLine + 1
            
            if nLine == 244 then
                nLine = 0
                player:showTextDialog(1111, text2)
                text2 = ""
            end
        end

        player:showTextDialog(1111, text2)
    end
    
    local text = ""
    
    for i = 1, #slots do
        local item = target:getSlotItem(slots[i].slot)
        if item then
            text = text..""..slots[i].name..""..item:getName().."\n"
        else
            text = text..""..slots[i].name.."nothing\n"
        end
    end
    
    player:showTextDialog(1111, text)

    return false
end

playerItems:separator(" ")
playerItems:groupType("god")
playerItems:register()