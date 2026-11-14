local randomBox = Action()

-- CONFIG
local BOX_ITEM_ID = 50854 -- <-- ID de la caja (CAMBIA ESTE ID)

local rewardItems = {
    -- Sorcerer
    51076, -- helmet
    51077, -- armor
    51078, -- legs
    51079, -- boots
    51080, -- shield

    -- Paladin
    51230, -- helmet
    51231, -- armor
    51232, -- legs
    51233, -- boots
    52367, -- shield

    -- Knight
    51226, -- helmet
    51229, -- armor
    51212, -- legs
    51228, -- boots
    51697, -- shield

    -- Druid
    51070, -- helmet
    51071, -- armor
    51072, -- legs
    51073, -- boots
    51074, -- shield

    -- Weapons
    51081, -- wand
    53278, -- bow
    50730, -- crossbow
    52376, -- sword
    52365, -- axe
    52366, -- club
    51075  -- rod
}

function randomBox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Elegir item aleatorio
    local rewardId = rewardItems[math.random(#rewardItems)]

    -- Dar reward
    player:addItem(rewardId, 1)

    -- Mensaje
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a "..ItemType(rewardId):getName().." from "..ItemType(BOX_ITEM_ID):getName().."!")

    -- Efecto visual
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)

    -- Consumir la caja
    item:remove(1)

    return true
end

randomBox:id(BOX_ITEM_ID)
randomBox:register()
