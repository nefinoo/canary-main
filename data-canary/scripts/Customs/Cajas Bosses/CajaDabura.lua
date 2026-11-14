local randomBox = Action()

-- CONFIG
local BOX_ITEM_ID = 50850 -- ID de la caja

local rewardItems = {
    -- Sorcerer
    51049, -- helmet
    51050, -- armor
    51051, -- legs
    51052, -- boots
    51053, -- shield

    -- Paladin
    51082, -- helmet
    51083, -- armor
    51084, -- legs
    51085, -- boots
    51086, -- shield

    -- Knight
    51062, -- helmet
    51059, -- armor
    51060, -- legs
    51061, -- boots
    51063, -- shield

    -- Druid
    51054, -- helmet
    51055, -- armor
    51056, -- legs
    51057, -- boots
    51058, -- shield

    -- Weapons
    50976, -- wand
    51087, -- bow
    51088, -- crossbow
    51064, -- sword
    51069, -- axe
    51066, -- club
    51853  -- rod
}

function randomBox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Elegir item aleatorio
    local rewardId = rewardItems[math.random(#rewardItems)]

    -- Dar reward
    player:addItem(rewardId, 1)

    -- Mensaje con nombre del item y la caja
    player:sendTextMessage(
        MESSAGE_EVENT_ADVANCE,
        "You received a " ..
        ItemType(rewardId):getName() ..
        " from " ..
        ItemType(BOX_ITEM_ID):getName() ..
        "!"
    )

    -- Efecto visual
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)

    -- Consumir la caja
    item:remove(1)

    return true
end

randomBox:id(BOX_ITEM_ID)
randomBox:register()
