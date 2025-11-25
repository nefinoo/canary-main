-- Quest Chest System RevScript
-- Soporte para cofres individuales (AID 2000)
-- y cofres compartidos (AID 2001–2004)
-- By Nefi & ChatGPT

local storageBase = 9000000

-- 🔧 CONFIGURACIÓN DE COFRES COMPARTIDOS
-- Cada actionid (2001–2004) representa un grupo de cofres que comparten el mismo storage.
-- Cuando un jugador abre uno de los 4 cofres del grupo, los demás quedan bloqueados.
local sharedQuestGroups = {
    [2001] = { storage = 31001 }, -- QUEST ARMAS LEVEL 500
    [2002] = { storage = 31002 }, rewardStorages = { [60000] = 1}, -- quest mana runes
    [2003] = { storage = 31003 }, -- armas lvl 1000
    [2004] = { storage = 31004 }, -- demon set
    [2005] = { storage = 31005 }, -- ARmas lvl 100
    [2005] = { storage = 31005 }, -- ARmas lvl 100
    [2006] = { storage = 31006 }, -- Quest ToT
    [2007] = { storage = 31007 }, -- empty
    [2008] = { storage = 31008 }, -- empty
    [2009] = { storage = 31009 }, -- empty
    [2010] = { storage = 31010 }, -- empty
    [2011] = { storage = 31011 }, -- empty
}

local action = Action()

function action.onUse(player, chest, fromPosition, target, toPosition, isHotkey)
    local aid = chest:getActionId()
    local unique = chest:getUniqueId()
    local questStorage = nil
    local extraStorages = nil  -- ⭐ NUEVO

    -- 🔹 Cofres individuales (AID 2000)
    if aid == 2000 then
        if unique == 0 then
            player:sendCancelMessage("This chest has no uniqueid.")
            return true
        end
        questStorage = storageBase + unique

    -- 🔹 Cofres compartidos
    elseif sharedQuestGroups[aid] then
        questStorage = storageBase + sharedQuestGroups[aid].storage
        extraStorages = sharedQuestGroups[aid].rewardStorages  -- ⭐ NUEVO

    else
        player:sendCancelMessage("Invalid actionid for quest chest.")
        return true
    end

    -- 🔒 Ya fue abierto
    if player:getStorageValue(questStorage) ~= -1 then
        player:sendTextMessage(MESSAGE_ADMINISTRATOR, "It is empty.")
        return true
    end

    -- 🧰 Validamos que sea contenedor y tenga ítems
    if not chest:getType():isContainer() then
        error(string.format("[QuestChest::%d] Item %d is not a container.", unique, chest:getId()))
    end

    local items = chest:getItems()
    if #items == 0 then
        error(string.format("[QuestChest::%d] No items found.", unique))
    end

    -- ⚖️ Calculamos peso
    local totalWeight = 0
    for _, item in ipairs(items) do
        totalWeight = totalWeight + item:getWeight()
    end

    if player:getFreeCapacity() < totalWeight then
        player:sendCancelMessage(RETURNVALUE_NOTENOUGHCAPACITY)
        return true
    end

    -- 🎁 Entregamos recompensa
    player:setStorageValue(questStorage, 1)

    -- ⭐ NUEVO: Storages extra del cofre
    if extraStorages then
        for id, val in pairs(extraStorages) do
			if id == 60000 then
				player:setStorageValue(id, val)
				player:sendTextMessage(MESSAGE_LOOK,
					string.format("Now you are able to buy manarune and knightmanarunes to Malak")
				)
			else
				player:setStorageValue(id, val)
			end
        end
    end

    -- Mensaje
    player:sendTextMessage(MESSAGE_LOOK,
        string.format("You have found %s.", chest:getContentDescription())
    )

    -- Dar ítems
    for _, item in ipairs(items) do
        player:addItemEx(item:clone(), true)
    end

    return true
end

-- 📜 Registramos todos los ActionIDs
action:aid(2000, 2001, 2002, 2003, 2004, 2005, 2006) -- Cofres individuales

-- for aid, _ in pairs(sharedQuestGroups) do
    -- action:aid(aid)
-- end

action:register()
