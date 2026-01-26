local randomBox = Action()

-- CONFIG
local BOX_ITEM_ID = 50851 -- <-- ID de la caja (CAMBIA ESTE ID)

local rewardItems = {
    -- Sorcerer
    52374, -- sorcerer helmet
    52373, -- sorcerer armor
    52372, -- sorcerer legs
    52371, -- sorcerer boots
    52370, -- sorcerer shield

    51200, -- paladin helmet
    51201, -- paladin armor
    51202, -- paladin legs
    51203, -- paladin boots
    53419, -- paladin shield

    51204, -- knight helmet
    51206, -- knight armor
    51211, -- knight legs
    51215, -- knight boots
    53421, -- knight shield

    51234, -- druid helmet
    51235, -- druid armor
    51236, -- druid legs
    51237, -- druid boots
    51504, -- druid shield

    52375, -- wand
    51807, -- bow
    51248, -- crossbow
    50970, -- sword
    50972, -- axe
    50977, -- club
    53019  -- rod
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
