local internalNpcName = "Cory"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 332,
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

-- Promotion
local node1 = keywordHandler:addKeyword({ "promot" }, StdModule.say, {
	npcHandler = npcHandler,
	onlyFocus = true,
	text = "I can promote you for 500000 gold coins. Do you want me to promote you?",
})
node1:addChildKeyword({ "yes" }, StdModule.promotePlayer, {
	npcHandler = npcHandler,
	cost = 500000,
	level = 500,
	text = "Congratulations! You are now promoted.",
})
node1:addChildKeyword({ "no" }, StdModule.say, {
	npcHandler = npcHandler,
	onlyFocus = true,
	text = "Alright then, come back when you are ready.",
	reset = true,
})

-- Greeting message
keywordHandler:addGreetKeyword({ "hail king hijodelavrga" }, {
	npcHandler = npcHandler,
	text = "Hello |PLAYERNAME|. I can promote you.",
})
keywordHandler:addGreetKeyword({ "salutations king hijodelavrga" }, {
	npcHandler = npcHandler,
	text = "Hello |PLAYERNAME|. I can promote you.",
})
keywordHandler:addGreetKeyword({ "que viva el rey hijodelavrga" }, {
	npcHandler = npcHandler,
	text = "Hello |PLAYERNAME|. I can promote you.",
})

npcHandler:setMessage(MESSAGE_WALKAWAY, "How rude!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
