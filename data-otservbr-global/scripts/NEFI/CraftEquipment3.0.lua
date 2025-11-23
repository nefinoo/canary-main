-- FINAL VERSION: BUG FIXED FOR CHOICE INDEX NIL

local config = {
    [1] = {
        name = 'Leather', helmet = 3355, armor = 3361, legs = 3559, boots = 3552, shield = 3445,
        price = 2500,
        materials = {{id = 12409, count = 50}, {id = 12410, count = 20}, {id = 12411, count = 1}},
    },
    [2] = {
        name = 'Studded', helmet = 3376, armor = 3378, legs = 3362, boots = 3551, shield = 3426,
        price = 2500,
        materials = {{id = 12412, count = 50}, {id = 12413, count = 20}, {id = 12414, count = 1}},
    },
    [3] = {
        name = 'Tusk', helmet = 7458, armor = 7463, legs = 7464, boots = 9020, shield = 3443,
        price = 2500,
        materials = {{id = 12415, count = 50}, {id = 12416, count = 20}, {id = 12417, count = 1}},
    },
}

local action = Action()

function action.onUse(player, item, fromPos, target, toPos, isHotkey)
    local menu = ModalWindow{
        title = "FORGE EQUIPMENT",
        message = "Choose a Material Set:"
    }

    local setChoices = {}
    for i, set in ipairs(config) do
        local index = menu:addChoice(set.name)
        setChoices[index] = set
    end

    menu:addButton("Select", function(player, button, choice)
        local selectedSet = setChoices[choice] -- usa el índice del botón elegido
        if not selectedSet then return end

        local pieceMenu = ModalWindow{
            title = "FORGE EQUIPMENT",
            message = "Choose a piece from "..selectedSet.name.." set:"
        }

        local pieces = {helmet = "Helmet", armor = "Armor", legs = "Legs", boots = "Boots", shield = "Shield"}
        local slotKeys = {}

        for key, label in pairs(pieces) do
            local idx = pieceMenu:addChoice(label..": "..getItemName(selectedSet[key]))
            slotKeys[idx] = key
        end

        pieceMenu:addButton("Forge", function(player, button, choice)
            local selectedSlot = slotKeys[choice]
            local itemId = selectedSet[selectedSlot]

            for _, req in ipairs(selectedSet.materials) do
                if player:getItemCount(req.id) < req.count then
                    player:sendCancelMessage("You need "..req.count.."x "..getItemName(req.id)..".")
                    return
                end
            end

            if player:getMoney() < selectedSet.price and player:getBankBalance() < selectedSet.price then
                player:sendCancelMessage("You need "..selectedSet.price.." gold coins (cash or bank).")
                return
            end

            for _, req in ipairs(selectedSet.materials) do
                player:removeItem(req.id, req.count)
            end

            if not player:removeMoney(selectedSet.price) then
                player:setBankBalance(player:getBankBalance() - selectedSet.price)
            end

            player:addItem(itemId, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "You forged a "..getItemName(itemId)..".")
            pieceMenu:sendToPlayer(player)
        end)

        pieceMenu:addButton("Details", function(player, button, choice)
            local selectedSlot = slotKeys[choice]
            local itemId = selectedSet[selectedSlot]
            local itemType = ItemType(itemId)
            local lines = {
                "############################",
                "Name: "..itemType:getName(),
                "Weight: "..itemType:getWeight(),
                "Description: "..itemType:getDescription(),
                "############################",
                "Price: "..selectedSet.price.." gold coins",
                "Required materials:"
            }
            for _, req in ipairs(selectedSet.materials) do
                local count = player:getItemCount(req.id)
                table.insert(lines, string.format("- %s: %d / %d", getItemName(req.id), count, req.count))
            end
            table.insert(lines, "############################")
            player:showTextDialog(itemId, table.concat(lines, "\n"))
            pieceMenu:sendToPlayer(player)
        end)

        pieceMenu:addButton("Back", function(player)
            menu:sendToPlayer(player)
        end)

        pieceMenu:addButton("Close")
        pieceMenu:sendToPlayer(player)
    end)

    menu:addButton("Exit")
    menu:sendToPlayer(player)
    return true
end

action:uid(35159)
action:register()
