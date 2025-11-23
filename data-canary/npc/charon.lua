local internalNpcName = "Charon"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = "the ferryman of the underworld"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 130,
    lookBody = 114,
    lookLegs = 114,
    lookFeet = 132,
    lookCorpse = 6009
}

npcConfig.flags = {
    floorchange = false,
}

npcConfig.voices = {
    interval = 15000,
    chance = 50,
    { text = "You aren't dead yet, are you?", yell = false },
    { text = "I shouldn't have to lead you across the river!", yell = false },
}

--===============================
-- NPC SYSTEM
--===============================
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

--===============================
-- BEHAVIOR
--===============================
local destination = Position(528, 1694, 7)

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	if not player then
		return false
	end

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local msg = message:lower()
	local storage = npc:getId()

	-- Inicio del diálogo
	if msg:find("boat") or msg:find("travel") then
		npcHandler:say("Would you like to travel across this river?", npc, creature)
		player:setStorageValue(storage, 1)
		return true
	end

	-- Si dice "yes"
	if msg == "yes" and player:getStorageValue(storage) == 1 then
		npcHandler:say("Off you go!", npc, creature)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(storage, -1)
		return true
	end

	-- Si dice "no"
	if msg == "no" and player:getStorageValue(storage) == 1 then
		npcHandler:say("Stop wasting my time!", npc, creature)
		player:setStorageValue(storage, -1)
		return true
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|. Would you like to travel on my {boat}?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, mortal.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye, mortal.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

--===============================
-- REGISTER NPC
--===============================
npcType:register(npcConfig)
