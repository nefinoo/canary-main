local internalNpcName = "Gustav"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 130,
    lookHead = 39,
    lookBody = 122,
    lookLegs = 125,
    lookFeet = 57,
    lookAddons = 0
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
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
    --------------------------------------------------------------------
    -- Frozen Flask
    --------------------------------------------------------------------
    if MsgContains(message, "frozen flask") then
        if player:getItemCount(12785) >= 1 then
			npcHandler:say( "I can refill this flask for 500 gold bars. Are you interested?", npc, creature )
            npcHandler:setTopic(playerId, 1)
        else
            npcHandler:say("You do not have a frozen flask.", npc, creature)
        end
        return true
    end
    if MsgContains(message, "yes") and npcHandler:getTopic(playerId) == 1 then
        if player:getMoney() < 5000000 then
            npcHandler:say("You do not have enough money!", npc, creature)
            npcHandler:setTopic(playerId, 0)
            return true
        end
        if player:getItemCount(12785) < 1 then
            npcHandler:say("You do not have a frozen flask.", npc, creature)
            npcHandler:setTopic(playerId, 0)
            return true
        end
        player:removeMoney(5000000)
        player:removeItem(12785, 1)
        local reward = player:addItem(14052, 1)
        if reward then
            reward:setActionId(110)
            reward:setAttribute(ITEM_ATTRIBUTE_NAME, "flask of frost water\n(Charges: 10)")
        end
        npcHandler:say("Here you are.", npc, creature)
        npcHandler:setTopic(playerId, 0)
        return true
    end
    --------------------------------------------------------------------
    -- Satan / Tree
    --------------------------------------------------------------------
    if MsgContains(message, "satan") or MsgContains(message, "tree") then
		npcHandler:say( "Ah. You must want to know more about Satan's Den. Well, I can surely {help} you out.", npc, creature )
        npcHandler:setTopic(playerId, 1)
        return true
    elseif MsgContains(message, "help") and npcHandler:getTopic(playerId) == 1 then
        if player:getStorageValue(45000) <= 0 then
			npcHandler:say({
				"I have fought Satan many times with a large group of people. I have always been curious about the tree that blocks the path leading north...",
				"I've inquired about it for many years. It seems to be magically protected against anyone without the proper equipment...", 
				"One day, a wandering stranger came by my shop, and offered his knowledge on the subject. Not for free, of course. For half the price I paid him, I can offer that same knowledge to you. ...", 
				"If you're interested, bring me 5000 {gold bars}.",
			}, npc, creature)
            player:setStorageValue(45000, 1)
			npcHandler:setTopic(playerId, 0)
        else
			npcHandler:say( "I'll need the money up front, please.", npc, creature )
        end
        return true
    elseif MsgContains(message, "gold bars") or MsgContains(message, "gold") then
        if player:getStorageValue(45000) == 1 then
            npcHandler:say("Do you have the gold bars?", npc, creature)
            npcHandler:setTopic(playerId, 2)
        else
            npcHandler:say("I have nothing for you.", npc, creature)
        end
        return true
    elseif MsgContains(message, "yes") and npcHandler:getTopic(playerId) == 2 then
        if player:getItemCount(9058) < 5000 then
			npcHandler:say( "Don't try to scam me. Come back when you actually have the money!", npc, creature )
            npcHandler:setTopic(playerId, 0)
            return true
        else
			player:removeItem(9058, 5000)
			npcHandler:say({ "Oh how I love gold. Anyway, I will keep my end of the bargain.", 
				"This stranger was very blunt and quick. Apparently he was in quite a hurry. He said he had found the way to remove the tree blocking the north path, but it was only temporary...", 
				"He said that all you have to do is use a magical scythe on the tree, and it's gone!...",
				"I can't be positive that this is true because I have not been able to venture back there. But, he did tell me that a local shop keeper, Tiffany, sells the scythe.",
				"Good luck with this knowledge. I hope you will one day find the answer to this mystery.",
				}, npc, creature)
			player:setStorageValue(45000, 2)
			npcHandler:setTopic(playerId, 0)
        return true
		end
    end
    return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcType:register(npcConfig)