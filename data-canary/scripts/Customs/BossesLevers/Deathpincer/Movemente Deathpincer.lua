-- Restrinccion de acceso

local config = {
    teleportentrada = 9011,
    teleportacceso = 9012,

    storage = 46003,
    storageValue = 1
}
-- Darle el acceso al player

local moveEvent = MoveEvent()

function moveEvent.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return true
    end

    if creature:getStorageValue(config.storage) < config.storageValue then
		-- creature:setStorageValue(config.storage, config.storageValue)
        creature:teleportTo(fromPosition)
		creature:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"You need to find the teleport to unlock access to this boss. Hint: ".."Ankrahmun!".."."
		)
		return true
	end
end

moveEvent:aid(config.teleportentrada)
moveEvent:register()



local moveEvent = MoveEvent()

function moveEvent.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return true
    end

    if creature:getStorageValue(config.storage) < config.storageValue then
		creature:setStorageValue(config.storage, config.storageValue)
		creature:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"You have unlocked access to the dabura hideout."
		)
		return true
	end
end

moveEvent:aid(config.teleportacceso)
moveEvent:register()
