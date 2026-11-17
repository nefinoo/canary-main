-- Restrinccion de acceso

local config = {
    teleportentrada = 9001,
    teleportacceso = 9002,

    storage = 46001,
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
			MESSAGE_LOOK,
			"You have unlocked access to the deathpincer hideout."
		)
		return true
	end
end

moveEvent:aid(config.teleportacceso)
moveEvent:register()
