local config = {
	[35800] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3500}, level = {50}},
	[35801] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3501}, level = {100}},
	[35802] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3502}, level = {150}},
	[35803] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3503}, level = {200}},
	[35804] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3504}, level = {250}},
	[35805] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3505}, level = {300}},
	[35806] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3506}, level = {350}},
	[35807] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3507}, level = {400}},
	[35808] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3508}, level = {450}},
	[35809] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3509}, level = {500}},
	[35810] = {items = {3031, 9689, 2973}, cantd = {45, 10, 3510}, level = {550}},
}

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

local bossportal = MoveEvent()

function bossportal.onStepIn(creature, item, position, fromPosition)
	
    local goldCoins = creature:getItemCount(config[item:getActionId()].items[1])
    local chickenFeathers = creature:getItemCount(config[item:getActionId()].items[2])
	local key = findItemOnPlayerWithActionId(creature, config[item:getActionId()].items[3], config[item:getActionId()].cantd[3])
	local levelplayer = creature:getLevel()	
	
	if goldCoins >= config[item:getActionId()].cantd[1] and chickenFeathers >= config[item:getActionId()].cantd[2] and key and levelplayer >= config[item:getActionId()].level[1] then
        creature:removeItem(config[item:getActionId()].items[1], config[item:getActionId()].cantd[1])
		creature:removeItem(config[item:getActionId()].items[2], config[item:getActionId()].cantd[2])
		key:remove(1)
        print("Imagina que haz sido teletransportado :D")
        creature:sendTextMessage(MESSAGE_LOOK, "Imagina que haz sido teletransportado :D.")
    else
        creature:sendTextMessage(MESSAGE_ADMINISTRADOR, "No cumples con los requisitos para activar el portal.")
		creature:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_HITAREA)
    end
end

bossportal:type("stepin")
for id in pairs(config) do
	bossportal:aid(id)
end
bossportal:register()