local fishId = 3578

local function onUse(player, item, fromPos, target, toPos, isHotkey)
    if player:getVocation():getId() == 1 or player:getVocation():getId() == 2 then -- Sorcerer or Druid
        local manaPercent = 50 -- Percentage of mana to heal
        local maxMana = player:getMaxMana()
        local manaToHeal = math.floor(maxMana * (manaPercent / 100))
        
        if player:getMana() == maxMana then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have full mana.")
            return false
        end
        
        player:addMana(manaToHeal)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel refreshed and regain " .. manaToHeal .. " mana points.")
    elseif player:getVocation():getId() == 3 then -- Paladin
        local lifePercent = 30 -- Percentage of life to heal
        local manaPercent = 20 -- Percentage of mana to heal
        local maxHealth = player:getMaxHealth()
        local maxMana = player:getMaxMana()
        local lifeToHeal = math.floor(maxHealth * (lifePercent / 100))
        local manaToHeal = math.floor(maxMana * (manaPercent / 100))
        
        if player:getHealth() == maxHealth and player:getMana() == maxMana then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have full health and mana.")
            return false
        elseif player:getHealth() == maxHealth then
            player:addMana(manaToHeal)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel refreshed and regain " .. manaToHeal .. " mana points.")
        elseif player:getMana() == maxMana then
            player:addHealth(lifeToHeal)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel refreshed and regain " .. lifeToHeal .. " health points.")
        else
            player:addHealth(lifeToHeal)
            player:addMana(manaToHeal)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel refreshed and regain " .. lifeToHeal .. " health points and " .. manaToHeal .. " mana points.")
        end
    elseif player:getVocation():getId() == 4 then -- Knight
        local lifePercent = 40 -- Percentage of life to heal
        local maxHealth = player:getMaxHealth()
        local lifeToHeal = math.floor(maxHealth * (lifePercent / 100))
        
        if player:getHealth() == maxHealth then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have full health.")
            return false
        end
        
        player:addHealth(lifeToHeal)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You feel refreshed and regain " .. lifeToHeal .. " health points.")
    end
    
    player:removeItem(fishId, 1)
    return true
end

local action = Action()
action.onUse = onUse
action:id(fishId)
action:allowFarUse(true)
action:register()