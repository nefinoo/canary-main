--[[
    Tear of Satan (Undead Power)
    RevScript - Compatible con Canary Engine
    Autor: ChatGPT (Nefi Edition)
--]]

local config = {
    outfit = {
        lookType = 248, -- Frost Dragon
        lookHead = 20,
        lookBody = 30,
        lookLegs = 40,
        lookFeet = 50,
        lookAddons = 0
    },

    wastingInterval = 2000,     -- cada 2s
    wastingQuantity = 250000,   -- 25k de oro por tick
    warnOnLowSupply = true,
    lowSupplyMargin = 2000000,  -- advertencia cuando quedan menos de 2kk
    storageActive = 50780,
    storageOutfit = 50781,

    effects = {
        CONST_ME_FIREWORK_RED,
        CONST_ME_MAGIC_GREEN,
        CONST_ME_FIREAREA,
        CONST_ME_HOLYAREA
    }
}

-- 🔥 Condiciones (stats, velocidad, luz)
local conditionStats = Condition(CONDITION_ATTRIBUTES)
conditionStats:setParameter(CONDITION_PARAM_TICKS, -1)
conditionStats:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 120)
conditionStats:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 160)
conditionStats:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 160)

local conditionSpeed = Condition(CONDITION_HASTE)
conditionSpeed:setParameter(CONDITION_PARAM_TICKS, -1)
conditionSpeed:setFormula(2.5, 0, 3.0, 0)

local conditionLight = Condition(CONDITION_LIGHT)
conditionLight:setParameter(CONDITION_PARAM_TICKS, -1)
conditionLight:setParameter(CONDITION_PARAM_LIGHT_LEVEL, 8)
conditionLight:setParameter(CONDITION_PARAM_LIGHT_COLOR, 67)

-- 🧩 Guardar outfit anterior
local function saveOldOutfit(player)
    local outfit = player:getOutfit()
    player:setStorageValue(config.storageOutfit, outfit.lookType)
    player:setStorageValue(config.storageOutfit + 1, outfit.lookHead)
    player:setStorageValue(config.storageOutfit + 2, outfit.lookBody)
    player:setStorageValue(config.storageOutfit + 3, outfit.lookLegs)
    player:setStorageValue(config.storageOutfit + 4, outfit.lookFeet)
end

local function restoreOldOutfit(player)
    local lookType = player:getStorageValue(config.storageOutfit)
    if lookType > 0 then
        player:setOutfit({
            lookType = lookType,
            lookHead = player:getStorageValue(config.storageOutfit + 1),
            lookBody = player:getStorageValue(config.storageOutfit + 2),
            lookLegs = player:getStorageValue(config.storageOutfit + 3),
            lookFeet = player:getStorageValue(config.storageOutfit + 4)
        })
    end
end

-- 💀 Terminar transformación
local function stopSuperForm(player)
    if not player or not player:isPlayer() then return end
    if player:getStorageValue(config.storageActive) == 1 then
        player:setStorageValue(config.storageActive, 0)
        player:removeCondition(CONDITION_OUTFIT)
        player:removeCondition(CONDITION_ATTRIBUTES)
        player:removeCondition(CONDITION_HASTE)
        player:removeCondition(CONDITION_LIGHT)
        restoreOldOutfit(player)
    end
end

-- 💰 Consumo periódico de dinero
local function superForm(playerId)
    local player = Player(playerId)
    if not player then return end

    if player:getStorageValue(config.storageActive) ~= 1 then
        return
    end

    local gold = player:getMoney()
    if gold >= config.wastingQuantity then
        player:removeMoney(config.wastingQuantity)
        local pos = player:getPosition()
        pos:sendMagicEffect(config.effects[math.random(1, #config.effects)])

        if gold <= config.lowSupplyMargin and config.warnOnLowSupply then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your coins are running low! Your Tear of Satan will vanish soon!")
        end

        addEvent(superForm, config.wastingInterval, playerId)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You ran out of money! The Tear of Satan crumbles to dust...")
        player:removeItem(6536, 1)
        stopSuperForm(player)
    end
end

-- ⚙️ EQUIP
local satanTear = MoveEvent()

function satanTear.onEquip(player, item, slot)
    local gold = player:getMoney()
    if gold < config.wastingQuantity then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "You don't have enough money to equip the Tear of Satan!")
        return false
    end

    if player:getStorageValue(config.storageActive) == 1 then
        return true
    end

    saveOldOutfit(player)
    player:setOutfit(config.outfit)
    player:setStorageValue(config.storageActive, 1)

    player:addCondition(conditionStats)
    player:addCondition(conditionSpeed)
    player:addCondition(conditionLight)

    local pos = player:getPosition()
    pos:sendMagicEffect(CONST_ME_HOLYAREA)
    pos:sendMagicEffect(CONST_ME_FIREWORK_RED)
    pos:sendMagicEffect(CONST_ME_MAGIC_GREEN)

    superForm(player:getId())
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel the infernal power of the Tear of Satan consuming your soul...")

    return true
end

satanTear:type("equip")
satanTear:id(6536)
satanTear:slot("ring")
satanTear:register()

-- ⚙️ DEEQUIP
local satanTearDeEquip = MoveEvent()

function satanTearDeEquip.onDeEquip(player, item, slot)
    stopSuperForm(player)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You remove the Tear of Satan. The dark power fades away...")
    return true
end

satanTearDeEquip:type("deequip")
satanTearDeEquip:id(6536)
satanTearDeEquip:slot("ring")
satanTearDeEquip:register()
