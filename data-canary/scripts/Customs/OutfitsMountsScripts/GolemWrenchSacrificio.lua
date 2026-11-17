local sacrificeChest = Action()

local config = {
    sacrificeItemId = 28537, -- ID del item que se va a sacrificar
    chestActionId = 55698,   -- ActionID del cofre
    rewardItemId = 16251,     -- ID del Golem Wrench
    chance = 10              -- 10% probabilidad
}

function sacrificeChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if not target or target.actionid ~= config.chestActionId then
        return false
    end

    if item.itemid ~= config.sacrificeItemId then
        player:sendCancelMessage("You need to sacrifice the correct item.")
        return true
    end

    item:remove(1)

    local roll = math.random(1, 100)

    if roll <= config.chance then
        player:addItem(config.rewardItemId, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The ancient mechanism trembles... You have obtained a Golem Wrench!")
        target:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The offering vanishes into dust... but nothing happens.")
        target:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return true
end

sacrificeChest:id(config.sacrificeItemId)
sacrificeChest:register()
