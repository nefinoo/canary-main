local internalNpcName = "Thasun the Guard"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = "A loyal guard of King Kalazur."
npcConfig.health = 100
npcConfig.maxHealth = 100
npcConfig.walkInterval = 0
npcConfig.walkRadius = 0

npcConfig.outfit = { lookType = 131, lookHead = 19, lookBody = 19, lookLegs = 19, lookFeet = 19 }

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
	local storage = 20000
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local missing, totalBlessPrice = Blessings.getInquisitionPrice(player)

	if MsgContains(message, "pass") or MsgContains(message, "gate") then
		if player:getStorageValue(storage) <= 0 then 
			npcHandler:say("I will let you pass if you are willing to {help} me.", npc, creature)
			npcHandler:setTopic(playerId, 1)
		elseif player:getStorageValue(storage) <= 4 and npcHandler:getTopic(playerId) == 4 then
			npcHandler:say("You and i are finish... for now.", npc, creature)
		end		
	elseif MsgContains(message, "help") and npcHandler:getTopic(playerId) == 1 then
		if player:getStorageValue(storage) <= 0 then 
			npcHandler:say("I live in these caves and protect the pits in honor of King Kaluzur...It gets very dark in the night and my torch has burnt out...If you would be so kind as to get me a new torch, I will let you pass, but!...I will not accept any old torch, please visit the king and ask him about a {special torch}... he lives on a small island by the outlawed dwarves...He lives on a small island by the outlawed dwarves, bring the {torch} back to me and I will allow you to enter the pits.", npc, creature)
			player:setStorageValue(storage, 1)
			npcHandler:setTopic(playerId, 0)
		else
			npcHandler:say('I need a {torch}.', npc, creature)
			npcHandler:setTopic(playerId, 2)
		end
		
	elseif MsgContains(message, "torch") or MsgContains(message, "special torch") and npcHandler:getTopic(playerId) == 2 then
		if player:getStorageValue(storage) == 3 then 
			npcHandler:say("Do you have the torch?", npc, creature)player:setStorageValue(storage, 1)
			npcHandler:setTopic(playerId, 3)
		else
			npcHandler:say('I have nothing for you.', npc, creature)
		end
		
	elseif MsgContains(message, "yes") and npcHandler:getTopic(playerId) == 3 then
		local itemId = 34016
		local actionId = 100
		if player:getItemCount(itemId) >= 1 then
			local item = player:getItemById(itemId, true)
			if item and item:getActionId() == actionId then			
				player:removeItem(itemId, 1)			
				npcHandler:say("Thank you very much, I will keep my end of the deal, you may pass through the gate whenever you want.", npc, creature)
				player:setStorageValue(storage, 4)
				player:setStorageValue(20001, 1)
				player:setStorageValue(20002, 0)
				player:setStorageValue(20003, 0)
				player:setStorageValue(20004, 0)
				player:setStorageValue(20005, 0)
				player:setStorageValue(20006, 0)
				player:setStorageValue(20007, 0)
				player:setStorageValue(20008, 0)
				npcHandler:setTopic(playerId, 4)
			else
				npcHandler:say("I will not accept a regular torch.", npc, creature)
				npcHandler:setTopic(playerId, 0)
			end
		else
			npcHandler:say("Liar! you don\'t have the torch.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|!, did you wanna {pass} the {gate}?, you need a {torch}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Always be on guard, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "This ungraceful haste is most suspicious!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

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
