local internalNpcName = "Kings Disciple"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = "Kings Disciple"
npcConfig.health = 100
npcConfig.maxHealth = 100
npcConfig.walkInterval = 0
npcConfig.walkRadius = 0

npcConfig.outfit = { lookType = 309 }

npcConfig.flags = { floorchange = false }

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
	local storage = 20008
	local voc = player:getVocation():getId()
	local depot = Position(518, 840, 7)
	
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "leave") then
		if player:getStorageValue(storage) <= 0 then 
			npcHandler:say("Before I send you off, I would like to give you this small {reward} for all of your hard work.", npc, creature)
			npcHandler:setTopic(playerId, 1)
		else
			npcHandler:say("Begone!.", npc, creature)
			player:teleportTo(depot, false)
		end
	elseif MsgContains(message, "reward") and player:getStorageValue(storage) <= 0 then
		player:setStorageValue(storage, 1)
		creature:addOutfit(325)
		creature:addOutfit(324)
		if voc == 1 then
			creature:learnSpell("Magic Potion")
		elseif voc == 2 then
			creature:learnSpell("Paralize Potio")
		elseif voc == 3 then
			creature:learnSpell("Speed Herb")
		elseif voc == 4 then
			creature:learnSpell("Shield of Enforcement")
		end
		npcHandler:say("You have just received a new ability, use it wisely. I also give you my outfit, Ask me to {leave} when you are ready.", npc, creature)
		npcHandler:setTopic(playerId, 0)
		
	elseif MsgContains(message, "reward") and player:getStorageValue(storage) == 1 then
		npcHandler:say("You already get your reward, Ask me to {leave} when you are ready.", npc, creature)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "|PLAYERNAME|!, You passed all the tests in these terrible areas, ask me for your {reward} and to receive your next title. Ask me to {leave} when you are ready.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Always frozen, |PLAYERNAME|!")
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

