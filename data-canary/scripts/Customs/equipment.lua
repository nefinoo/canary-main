local equipment = TalkAction("!equipment")

local slots = {
    [1]  = {slot = CONST_SLOT_HEAD,      name = "Head Slot"},
    [2]  = {slot = CONST_SLOT_NECKLACE,  name = "Amulet Slot"},
    [3]  = {slot = CONST_SLOT_BACKPACK,  name = "Backpack Slot"},
    [4]  = {slot = CONST_SLOT_ARMOR,     name = "Armor Slot"},
    [5]  = {slot = CONST_SLOT_RIGHT,     name = "Right Hand"},
    [6]  = {slot = CONST_SLOT_LEFT,      name = "Left Hand"},
    [7]  = {slot = CONST_SLOT_LEGS,      name = "Legs Slot"},
    [8]  = {slot = CONST_SLOT_FEET,      name = "Feet Slot"},
    [9]  = {slot = CONST_SLOT_RING,      name = "Ring Slot"},
    [10] = {slot = CONST_SLOT_AMMO,      name = "Ammo Slot"}
}

local function getContainerItems(container, indent)
    local text = ""
    local prefix = string.rep("-", indent) .. "> "

    for i = 0, container:getSize() - 1 do
        local item = container:getItem(i)
        if item then
            local count = item:getCount() > 1 and " (" .. item:getCount() .. "x)" or ""
            text = text .. "\n" .. prefix .. item:getName() .. count

            if item:isContainer() then
                text = text .. getContainerItems(item, indent + 1)
            end
        end
    end
    return text
end

function equipment.onSay(player, words, param)
    if param == "" then
        player:sendCancelMessage("Command requires a player name.")
        return false
    end

    local target = Player(param)
    if not target then
        player:sendCancelMessage("This player is not online.")
        return false
    end

    local text = target:getName() .. "'s Equipment:\n"

    for i = 1, #slots do
        local data = slots[i]
        local item = target:getSlotItem(data.slot)

        if item then
            text = text .. data.name .. ": " .. item:getName()

            -- SOLO containers accesibles por Canary
            if item:isContainer() then
                text = text .. getContainerItems(item, 1)
            end
        else
            text = text .. data.name .. ": Empty"
        end

        text = text .. "\n"
    end

    player:showTextDialog(6579, text)
    return false
end

equipment:separator(" ")
equipment:groupType("god")
equipment:register()
