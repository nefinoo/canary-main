local PRESENT_EXERCISE = 52038
local PRESENT_DURABLE = 52039
local PRESENT_LASTING = 52040
local PRESENT_OTHER = 52037

-- CHARGES
local CHARGES = {
    [PRESENT_EXERCISE] = 500,
    [PRESENT_DURABLE] = 1800,
    [PRESENT_LASTING] = 14400
}

-- REWARD LIST
local REWARDS = {
    { name = "exercise axe", clientId = 28553, type = "exercise" },
    { name = "exercise bow", clientId = 28555, type = "exercise" },
    { name = "exercise club", clientId = 28554, type = "exercise" },
    { name = "exercise rod", clientId = 28556, type = "exercise" },
    { name = "exercise sword", clientId = 28552, type = "exercise" },
    { name = "exercise wand", clientId = 28557, type = "exercise" },

    { name = "durable exercise axe", clientId = 35280, type = "durable" },
    { name = "durable exercise bow", clientId = 35282, type = "durable" },
    { name = "durable exercise club", clientId = 35281, type = "durable" },
    { name = "durable exercise rod", clientId = 35283, type = "durable" },
    { name = "durable exercise shield", clientId = 44066, type = "durable" },
    { name = "durable exercise sword", clientId = 35279, type = "durable" },
    { name = "durable exercise wand", clientId = 35284, type = "durable" },

    { name = "lasting exercise axe", clientId = 35286, type = "lasting" },
    { name = "lasting exercise bow", clientId = 35288, type = "lasting" },
    { name = "lasting exercise club", clientId = 35287, type = "lasting" },
    { name = "lasting exercise rod", clientId = 35289, type = "lasting" },
    { name = "lasting exercise shield", clientId = 44067, type = "lasting" },
    { name = "lasting exercise sword", clientId = 35285, type = "lasting" },
    { name = "lasting exercise wand", clientId = 35290, type = "lasting" },
}

-- Tabla temporal
local pendingReward = {}

local function openRewardModal(player, presentId)
    local typeName = (presentId == PRESENT_EXERCISE and "exercise")
        or (presentId == PRESENT_DURABLE and "durable")
        or (presentId == PRESENT_LASTING and "lasting")

    if not typeName then
        player:sendCancelMessage("Este present no tiene recompensas configuradas.")
        return
    end

    -- Filtrar recompensas
    local list = {}
    for _, r in pairs(REWARDS) do
        if r.type == typeName then
            table.insert(list, r)
        end
    end

    pendingReward[player:getId()] = {
        presentId = presentId,
        rewards = list
    }

    local modal = ModalWindow(8010, "Selecciona tu recompensa", "Elige un objeto:")

    for i, r in ipairs(list) do
        modal:addChoice(i, r.name)
    end

    modal:addButton(1, "Aceptar")
    modal:addButton(2, "Cancelar")

    modal:setDefaultEnterButton(1)
    modal:setDefaultEscapeButton(2)

    modal:sendToPlayer(player)
end


-- ***** MODAL CALLBACK PARA CANARY ENGINE *****
local modalEvent = CreatureEvent("ExercisePresentModal")
modalEvent:type("modalwindow")

function modalEvent.onModalWindow(player, modalId, buttonId, choiceId)
    if modalId ~= 8010 then return false end

    local pid = player:getId()
    local data = pendingReward[pid]
    if not data then return false end

    -- Cancelado
    if buttonId ~= 1 then
        pendingReward[pid] = nil
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Has cancelado la selección.")
		
        return true
    end

    local reward = data.rewards[choiceId]
    if not reward then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Selección inválida.")
        pendingReward[pid] = nil
        return true
    end

    local charges = CHARGES[data.presentId] or 1

	local inbox = player:getStoreInbox()
	local inboxItems = inbox:getItems()
	if not inbox or #inboxItems >= inbox:getMaxCapacity() then
		player:sendError("You do not have enough space in your store inbox.")
		return false
	end
	player:addItemStoreInbox(reward.clientId, charges, movable, setOwner)
    -- inbox:addItem(reward.clientId, charges)

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
        "Recibiste: " .. reward.name .. " (" .. charges .. " charges).")

    pendingReward[pid] = nil
    return true
end

modalEvent:register()


-- ***** ACTION PARA LOS PRESENTS *****
local presentAction = Action()

function presentAction.onUse(player, item, pos, target, toPos, hotkey)
    local presentId = item:getId()

    player:registerEvent("ExercisePresentModal")

    openRewardModal(player, presentId)
    item:remove()
    return true
end


presentAction:id(PRESENT_EXERCISE)
presentAction:id(PRESENT_DURABLE)
presentAction:id(PRESENT_LASTING)
presentAction:id(PRESENT_OTHER)
presentAction:register()
