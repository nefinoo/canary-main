-- potentially very heavy function, if player has many many items on them.
local function findItemOnPlayerWithActionId(player, itemId, actionId)
    if not player:isPlayer() then
        return false
    end
    for slot = 1, 10 do
        local slotItem = player:getSlotItem(slot)
        if slotItem then
            local slotItemId = slotItem:getId()
            if slotItemId == itemId and slotItem:getActionId() == actionId then
                return slotItem
            end
            if ItemType(slotItemId):isContainer() then
                local containerItems = slotItem:getItems(true)
                for i = 1, #containerItems do
                    local item = containerItems[i]
                    if item:getId() == itemId and item:getActionId() == actionId then
                        return item
                    end
                end
            end
        end
    end
    return false
end

local AHUJA = Action()

function AHUJA.onUse(player, item, fromPosition, target, toPosition, isHotkey)

		local key = findItemOnPlayerWithActionId(player, 2973, 1212)
		if key then
			-- key found, do something
			key:remove(1)
		end
		
    return false
end
AHUJA:aid(13133)
AHUJA:register()