local internalNpcName = "King Kalazur"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = "the wise king"
npcConfig.health = 100
npcConfig.maxHealth = 100
npcConfig.walkInterval = 0
npcConfig.walkRadius = 0

npcConfig.outfit = {
    lookType = 66
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
	local storage = 20000

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local missing, totalBlessPrice = Blessings.getInquisitionPrice(player)

	if MsgContains(message, "torch") or MsgContains(message, "special torch") or MsgContains(message, "help") or MsgContains(message, "mission") and npcHandler:getTopic(playerId) == 0 then
		if player:getStorageValue(storage) == 1 then
			npcHandler:say("Ahh yes, Thasun must have sent you...I will give you a torch but there will be a {price}.", npc, creature)
			npcHandler:setTopic(playerId, 1)
		 else
            npcHandler:say("I have nothing for you.", npc, creature)
        end
		
	elseif MsgContains(message, "price") and npcHandler:getTopic(playerId) == 1  then
		npcHandler:say("The outlaws have taken the dwarven brooch and hidden it in the caves...If you could find it and return it to me I will give you the torch...Are you willing to do this for me?", npc, creature)
		npcHandler:setTopic(playerId, 2)
		
	elseif MsgContains(message, "yes") and npcHandler:getTopic(playerId) == 2 then
		if player:getStorageValue(storage) == 1 then --if quest is done
			npcHandler:say("Well then, good luck in the caves, the outlaws seem to be growing stronger.", npc, creature)
            player:setStorageValue(storage, 2)
			npcHandler:setTopic(playerId, 0)
		end		
	elseif MsgContains(message, "no") and npcHandler:getTopic(playerId) == 2 then
		if player:getStorageValue(storage) == 1 then
			npcHandler:say("Very disappointing...", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
		
	elseif MsgContains(message, "dwarven brooch") or MsgContains(message, "brooch") and player:getStorageValue(storage) == 2 then
		if player:getStorageValue(storage) == 2 then
			npcHandler:say("Did you find the brooch?", npc, creature)
			npcHandler:setTopic(playerId, 3)
        else
			npcHandler:say("I have nothing for you.", npc, creature)
        end
		
	elseif MsgContains(message, "yes") and npcHandler:getTopic(playerId) == 3 then
		 if player:getItemCount(3005) >= 1 then
            player:removeItem(3005, 1)
            local torch = player:addItem(34016, 1)
            if torch then
                torch:setActionId(100)
            end
			npcHandler:say("You are very brave. Thank you so much!. Here is the torch. I bet Thasun will be very pleased.", npc, creature)
            player:setStorageValue(storage, 3)
			npcHandler:setTopic(playerId, 0)
		else
            npc:say("Don't waste my time. Return once you have found the brooch.", TALKTYPE_SAY)
			npcHandler:setTopic(playerId, 0)
        end
    end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Greetings, fellow believer |PLAYERNAME|!, did you need {help} with a {torch} you need bring me a {brooch}?")
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
