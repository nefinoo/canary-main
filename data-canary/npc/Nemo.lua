local internalNpcName = "Nemo"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 3

npcConfig.outfit = {
	lookType = 750,
	lookHead = 67,
	lookBody = 114,
	lookLegs = 78,
	lookFeet = 114,
	lookAddons = 2
}

npcConfig.flags = {
	floorchange = false
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
	return true
end

keywordHandler:addKeyword({ "joba" }, StdModule.say, { npcHandler = npcHandler, text = "I am a travelling trader. I don't buy everything, though. And not from everyone, for that matter." })
keywordHandler:addKeyword({ "namea" }, StdModule.say, { npcHandler = npcHandler, text = "I am Rashid, son of the desert." })

npcHandler:setMessage(MESSAGE_GREET, "Ah, a customer! Be greeted, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|, may the winds guide your way.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back soon!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Take all the time you need to decide what you want!")

local function onTradeRequest(npc, creature)
	-- if Player(creature):getStorageValue(Storage.TravellingTrader.Mission07) ~= 1 then
		-- npcHandler:say('Sorry, but you do not belong to my exclusive customers. I have to make sure that I can trust in the quality of your wares.', npc, creature)
		-- return false
	-- end

	return true
end

npcHandler:setCallback(CALLBACK_ON_TRADE_REQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "tiny bass", clientId = 32045, sell = 100 },
	{ itemName = "small bass", clientId = 32044, sell = 1000 },
	{ itemName = "bass", clientId = 32043, sell = 10000 },
	{ itemName = "fish", clientId = 3578, buy = 200, sell = 10 },
	{ itemName = "northern pike", clientId = 3580, buy = 400, sell = 28 },
	{ itemName = "salmon", clientId = 3579, buy = 650, sell = 45 },
	{ itemName = "worm", clientId = 3492, buy = 1000, sell = 5 },
	{ itemName = "shrim", clientId = 3581, buy = 950, sell = 60 },
	{ itemName = "green perch", clientId = 7159, buy = 1300, sell = 75 },
	{ itemName = "rainbow trout", clientId = 7158, buy = 1750, sell = 100 },
	{ itemName = "fishing rod", clientId = 3483, buy = 10000, sell = 500 },
	{ itemName = "empty goldfish bowl", clientId = 5928, buy = 10000000 },
	-- { itemName = "fishing scroll", clientId = 50843, buy = 10000000 },
	-- { itemName = "mechanical fishing rod", clientId = 9306, buy = 50000000 },
	-- { itemName = "acid fishing rod", clientId = 51825, buy = 100000000 },
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_LOOK, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
