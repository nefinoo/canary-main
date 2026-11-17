local internalNpcName = "Tiffany"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 138,
    lookHead = 57,
    lookBody = 59,
    lookLegs = 40,
    lookFeet = 76,
    lookAddons = 2
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()
    if not player then
        return false
    end
    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end
    local state = npcHandler:getTopic(playerId, 0)
	
    if MsgContains(message, "scythe") or MsgContains(message, "secret scythe") and state == 0 then
        if player:getStorageValue(45000) == 2 then
            npcHandler:say({
				"So you're here about the scythe, eh?",
				"I do have one available. They are so darn rare, you will have to give me {something} in return.", 
			},npc, creature)
            npcHandler:setTopic(playerId, 1)
        else
            npcHandler:say("I have nothing for you.", npc, creature)
        end
    elseif message == "something" and npcHandler:getTopic(playerId) == 1 then
        npcHandler:say({
			"Recently, I have become enthused with a species known as the hydra.",
			"I have travelled to the greatest depths of Dickson to study them. But, being a store owner, I cannot venture very far away for fear that my items may be stolen.",
			"A mighty warrior once brought me a hydra tongue. Would you gather me 1000 of them? In return I will give you a special scythe.", 
		}, npc, creature)
        npcHandler:setTopic(playerId, 2)
    elseif message == "yes" and npcHandler:getTopic(playerId) == 2 then
        if player:getStorageValue(45000) == 2 then
            player:setStorageValue(45000, 3)
            npcHandler:say("Great! I will be waiting here for them.", npc, creature)
        end
        npcHandler:setTopic(playerId, 0)
    elseif message == "no" and npcHandler:getTopic(playerId) == 2 then
        npcHandler:say("Fine. I didn't want your hydra tongues anyway!", npc, creature)
        npcHandler:setTopic(playerId, 0)
    elseif (message == "hydra tongue" or message == "tongue" or message == "hydra") and player:getStorageValue(45000) == 3 then
        npcHandler:say("Do you have the hydra tongues I requested?", npc, creature)
        npcHandler:setTopic(playerId, 3)
    elseif message == "yes" and npcHandler:getTopic(playerId) == 3 then
        if player:getItemCount(7250) >= 1000 then
            player:removeItem(7250, 1000)
            local item = player:addItem(3453, 1)
            if item then
                item:setActionId(666)
				item:setAttribute(ITEM_ATTRIBUTE_NAME, "satan's scythe")
            end
            player:setStorageValue(45000, 4)
            npcHandler:say("Thank you so much. Now I can finally study these things in detail. Here is the scythe, as I promised.", npc, creature)
        else
            npcHandler:say("If you have not found the tongues, all I can offer you are my wares.", npc, creature)
        end
        npcHandler:setTopic(playerId, 0)
    end
    return true
end


npcHandler:setMessage(MESSAGE_GREET, "Greetings, fellow {believer} |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Always be on guard, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "This ungraceful haste is most suspicious!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
    { itemName = "machete", clientId = 3308, buy = 100 },
    { itemName = "scythe", clientId = 3453, buy = 100 },
    -- { itemName = "amulet of loss", clientId = 3057, buy = 10000 },
    { itemName = "backpack", clientId = 2854, buy = 1000 },
    { itemName = "pick", clientId = 3456, buy = 10 },
    { itemName = "shovel", clientId = 3457, buy = 20 },
    { itemName = "rope", clientId = 3003, buy = 50 },
    { itemName = "brown mushroom", clientId = 3732, buy = 10 },
    { itemName = "fishing rod", clientId = 3483, buy = 1000000 },
    { itemName = "worm", clientId = 3492, buy = 1000 },
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

-- npcType registering the npcConfig table
npcType:register(npcConfig)
