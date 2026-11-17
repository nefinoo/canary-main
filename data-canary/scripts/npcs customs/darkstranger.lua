local internalNpcName = "Dark Stranger"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 131,
    lookHead = 114,
    lookBody = 114,
    lookLegs = 114,
    lookFeet = 114,
    lookAddons = 3
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

local teleportPos = Position(530, 1824, 6)
local kickPos = Position(518, 840, 7)

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId() 
    if not player then
        return false
    end

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    -- Teleport
    if MsgContains(message, "teleport") then
        if player:getStorageValue(45000) >= 6 then
            npcHandler:say("Would you like a free teleport to the mysterious isle?", npc, creature)
            npcHandler:setTopic(playerId, 1)
        else
            npcHandler:say("You have not proven yourself yet.", npc, creature)
            player:teleportTo(kickPos)
            kickPos:sendMagicEffect(CONST_ME_TELEPORT)
        end
        return true
    elseif MsgContains(message, "yes") and npcHandler:getTopic(playerId) == 1 then
        player:teleportTo(teleportPos)
        teleportPos:sendMagicEffect(CONST_ME_TELEPORT)
        npcHandler:setTopic(playerId, 0)
        return true
    end

    -- Satan / Help
    if MsgContains(message, "satan") or MsgContains(message, "help") then
        if player:getStorageValue(45000) == 4 then
            npcHandler:say({
				"Very well. You have made it here. That is a feat that some have spent a lifetime trying to figure out.",
				"Now, you must prove your strength to me before I will let you continue.",
				"Be ready, and be wise. This is going to be the ultimate test of skill.",
				"When you are ready, please switch the lever. Only one person from your team must switch it.", 
			}, npc, creature)
            player:setStorageValue(45000, 5)
        elseif player:getStorageValue(45000) == 5 then
            npcHandler:say("You must complete the mission before you can advance.", npc, creature)
        elseif player:getStorageValue(45000) >= 6 then
            npcHandler:say("You are done here. Say {teleport} if you would like to be teleported to the mysterious isle.", npc, creature)
        else
            npcHandler:say("You are not allowed here!", npc, creature)
            player:teleportTo(kickPos)
            kickPos:sendMagicEffect(CONST_ME_TELEPORT)
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