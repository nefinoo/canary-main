local upgradeSystem = {
    messageType = MESSAGE_EVENT_ORANGE,
    
    fetishs = {
        [7800] = {chance = 100, amount = 5, stat = "attack", name = "attack"},
        [7801] = {chance = 100, amount = 5, stat = "defense", name = "defense"},
        [7802] = {chance = 100, amount = 5, stat = "armor", name = "armor"},
    },
    
    minmax = {
        min1 = 7801, -- mínimo de los fetishs random para access < 5
        max1 = 7801, -- máximo de los fetishs random para access < 5
        min2 = 7850, -- mínimo de los fetishs random para access >= 5
        max2 = 7852, -- máximo de los fetishs random para access >= 5
    },
    
    maxUpgrades = 10, -- Máximo de mejoras por item
    
    -- Función para obtener el stat del item
    getItemStat = function(item, stat)
        if stat == "attack" then
            return item:getAttack()
        elseif stat == "defense" then
            return item:getDefense()
        elseif stat == "armor" then
            return item:getArmor()
        end
        return 0
    end,
    
    -- Función para establecer el stat del item
    setItemStat = function(item, stat, value)
        if stat == "attack" then
            item:setAttack(value)
        elseif stat == "defense" then
            item:setDefense(value)
        elseif stat == "armor" then
            item:setArmor(value)
        end
    end,
    
    -- Función para revelar el cristal
    revealCrystal = function(player, item)
        local newId = math.random(upgradeSystem.minmax.min1, upgradeSystem.minmax.max1)
        local fetish = upgradeSystem.fetishs[newId]
        
        if fetish then
            local text = "You remove the dust and reveal that it is a "..fetish.chance.."% upgrade crystal for "..fetish.name.." +"..fetish.amount.."."
            if fetish.destroy then
                text = text .. " It has a slight chance of breaking your item."
            end
            
            player:sendTextMessage(upgradeSystem.messageType, text)
            item:setActionId(newId)
            item:setSpecialDescription(text)
            item:setAttribute(ITEM_ATTRIBUTE_NAME, fetish.chance.."% upgrade crystal for "..fetish.name.." +"..fetish.amount)
        end
    end,
    
    -- Función para aplicar upgrade
    applyUpgrade = function(player, crystal, targetItem, position)
        local fetish = upgradeSystem.fetishs[crystal:getActionId()]
        
        if not fetish then
            player:sendCancelMessage("Sorry, not possible.")
            return
        end
        
        -- Verificar si el item puede ser mejorado
        local currentStat = upgradeSystem.getItemStat(targetItem, fetish.stat)
        if currentStat <= 0 then
            player:sendCancelMessage("This item may not be upgraded.")
            return
        end
        
        -- Verificar número de upgrades
        local actionId = targetItem:getActionId()
        local upgradeCount = 0
        
        if actionId >= 100 and actionId < 110 then
            upgradeCount = actionId - 100
        end
        
        if upgradeCount >= upgradeSystem.maxUpgrades then
            player:sendCancelMessage("This weapon has already been upgraded 10 times.")
            return
        end
        
        -- Aplicar upgrade
        local chance = math.random(0, 100)
        local success = chance <= fetish.chance
        
        if success then
            -- Upgrade exitoso
            local newStatValue = currentStat + fetish.amount
            upgradeSystem.setItemStat(targetItem, fetish.stat, newStatValue)
            
            -- Actualizar actionId y nombre
            local newUpgradeCount = upgradeCount + 1
            targetItem:setActionId(100 + newUpgradeCount)
            targetItem:setAttribute(ITEM_ATTRIBUTE_NAME, targetItem:getName() .. " (+" .. newUpgradeCount .. ")")
            
            -- Efectos visuales
            position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
            position:sendAnimatedText("Success!", TEXTCOLOR_WHITE)
            
            player:sendTextMessage(upgradeSystem.messageType, targetItem:getName() .. " " .. fetish.name .. " +" .. fetish.amount .. ".")
            
        else
            -- Upgrade fallido
            if fetish.destroy then
                if math.random(0, 1) == 1 then
                    -- Item destruido
                    targetItem:remove()
                    player:sendTextMessage(upgradeSystem.messageType, targetItem:getName() .. " has been destroyed.")
                    position:sendMagicEffect(CONST_ME_BLOCKHIT)
                    return
                end
            end
            
            -- Solo fallo sin destrucción
            position:sendMagicEffect(CONST_ME_POFF)
            position:sendAnimatedText("Failed!", TEXTCOLOR_RED)
            player:sendTextMessage(upgradeSystem.messageType, fetish.name .. " upgrade on " .. targetItem:getName() .. " failed.")
        end
        
        -- Consumir el cristal
        crystal:remove()
    end
}

local upgradeAction = Action()

function upgradeAction.onUse(player, item, fromPos, target, toPos, isHotkey)
    -- Verificar si el objetivo es un item
    if not target or not target:isItem() then
        player:sendCancelMessage("You must use the crystal on an item.")
        return true
    end
    
    local actionId = item:getActionId()
    
    -- Si el cristal no está revelado (actionId = 0)
    if actionId == 0 then
        upgradeSystem.revealCrystal(player, item)
        return true
    end
    
    -- Si es un cristal de upgrade conocido
    if upgradeSystem.fetishs[actionId] then
        upgradeSystem.applyUpgrade(player, item, target, toPos)
        return true
    end
    
    player:sendCancelMessage("Sorry, not possible.")
    return true
end

-- Registrar los IDs de los cristales (ajusta según necesites)
upgradeAction:id(7242) -- Cristal de attack
upgradeAction:id(7801) -- Cristal de defense  
upgradeAction:id(7802) -- Cristal de armor
-- Agrega más IDs según tu sistema

upgradeAction:register()