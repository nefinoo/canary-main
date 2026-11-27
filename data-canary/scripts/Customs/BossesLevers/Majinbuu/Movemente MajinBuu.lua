-- Restrinccion de acceso

local config = {
    teleportAid = 9007,

    storage = 46004,
    storageValue = 1
}

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
			"You need to find the teleport to unlock access to this boss. Hint: ".."Embrace the night! Fire and destruction!".."."
		)
		return true
	end
end

moveEvent:aid(config.teleportAid)
moveEvent:register()


-- Darle el acceso al player


local config = {
    teleportAid = 9008,

    storage = 46004,
    storageValue = 1
}

local moveEvent = MoveEvent()

function moveEvent.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return true
    end

    if creature:getStorageValue(config.storage) < config.storageValue then
		creature:setStorageValue(config.storage, config.storageValue)
		creature:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"You have unlocked access to the majin boo hideout."
		)
		return true
	end
end

moveEvent:aid(config.teleportAid)
moveEvent:register()
