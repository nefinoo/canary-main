local config = {
    -- IDs
    leverOff = 2772,
    leverOn  = 2773,
    stoneId  = 1772,

    -- Duración en segundos (5 minutos)
    duration = 60,
	
	leverActionId = 45001,

    -- Posiciones de las 3 palancas
    levers = {
        Position(536, 764, 9),
    },

    -- Posición del stone
    stonePos = Position(604, 766, 10)
}

local function areAllLeversOn()
    for _, pos in ipairs(config.levers) do
        local lever = Tile(pos):getTopDownItem()
        if not lever or lever:getId() ~= config.leverOn then
            return false
        end
    end
    return true
end

local function resetPuzzle()
    -- Reaparecer stone
    if not Tile(config.stonePos):getItemById(config.stoneId) then
        Game.createItem(config.stoneId, 1, config.stonePos)
    end

    -- Resetear palancas
    for _, pos in ipairs(config.levers) do
        local lever = Tile(pos):getTopDownItem()
        if lever and lever:getId() == config.leverOn then
            lever:transform(config.leverOff)
        end
    end
end

local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Seguridad: solo palancas con ESTE actionid
    if item:getActionId() ~= config.leverActionId then
        return true
    end

    -- Alternar palanca
    if item:getId() == config.leverOff then
        item:transform(config.leverOn)
        fromPosition:sendMagicEffect(690)
    else
        item:transform(config.leverOff)
    end

    -- Verificar condición
    if areAllLeversOn() then
        local stone = Tile(config.stonePos):getItemById(config.stoneId)
        if stone then
            stone:remove()
            addEvent(resetPuzzle, config.duration * 1000)

            player:sendTextMessage(
                MESSAGE_EVENT_ADVANCE,
                "A loud crash echoes throughout the Ferumbras tower; perhaps something has opened..."
            )
        end
    end

    return true
end

-- 🔥 REGISTRO POR ACTIONID (NO itemid)
action:aid(config.leverActionId)
action:register()

local config = {
    monsterName = "Mad Scientist",

    -- Área donde debe morir
    area = {
        from = Position(681, 818, 10),
        to   = Position(697, 830, 10)
    },

    -- Stone a remover
    stonePos = Position(683, 824, 10),
    stoneId  = 1772,

    -- Teleport que aparecerá
    teleportPos = Position(682, 824, 10),
    teleportId  = 51759,

    -- Destino del teleport (reward room)
    rewardPos = Position(551, 782, 9)
}

local function isInArea(pos, fromPos, toPos)
    return pos.x >= fromPos.x and pos.x <= toPos.x
       and pos.y >= fromPos.y and pos.y <= toPos.y
       and pos.z == fromPos.z
end

local creatureEvent = CreatureEvent("MadScientistDeath")

function creatureEvent.onDeath(creature, corpse, killer, mostDamageKiller)
    if not creature or not creature:isMonster() then
        return true
    end

    if creature:getName() ~= config.monsterName then
        return true
    end

    if not isInArea(creature:getPosition(), config.area.from, config.area.to) then
        return true
    end

    -- Remover stone
    local stone = Tile(config.stonePos):getItemById(config.stoneId)
    if stone then
        stone:remove()
    end

    -- Crear teleport
    if not Tile(config.teleportPos):getItemById(config.teleportId) then
        local tp = Game.createItem(config.teleportId, 1, config.teleportPos)
        tp:setDestination(config.rewardPos)
    end

    return true
end

creatureEvent:register()

local config = {
    doorAid = 9001,

    storage = 45002,
    requiredValue = 1
}

local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(config.storage) < config.requiredValue then
        player:sendTextMessage(
            MESSAGE_EVENT_ADVANCE,
            "The door is sealed. You lack the required access."
        )
        return true
    end

    -- Permitir paso
	if item.itemid == 5122 then
		player:teleportTo(toPosition, true)
		item:transform(item.itemid + 1)
	elseif item.itemid == 5123 then
		item:transform(item.itemid - 1)
	end
    return true
end

action:aid(config.doorAid)
action:register()


local config = {
    teleportAid = 9000,

    storage = 45002,
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
			"You have unlocked access to the laboratory door."
		)
		return true
	end
end

moveEvent:aid(config.teleportAid)
moveEvent:register()
