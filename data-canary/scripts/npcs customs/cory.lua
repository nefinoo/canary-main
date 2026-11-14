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
    lookType = 133,
    lookHead = 20,
    lookBody = 39,
    lookLegs = 45,
    lookFeet = 7,
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
    --=========================
    -- Professor Quest
    --=========================
    if MsgContains(message, "professor") or MsgContains(message, "fanglethorn") and npcHandler:getTopic(playerId) == 0 then
        if player:getStorageValue(45000) == 7 then
            npcHandler:say({
				"How in the world do you know about him? I can't believe it. That was a secret mission!",
				"No matter, you must be worthy of my resources if you have come this far.",
				"I know only very little about the situation. Professor Fanglethorn died before he was able to complete his research. What\'s more, he was never able to make it back to me with his updated research notes.",
				"Since no one knows the way in, we were not able to retrieve his body.",
				"I can offer you everything I know if you can venture back there, discover his body, and confirm his death. I\'ll need some type of proof.",
				"Are you interested?", 
			}, npc, creature)
            npcHandler:setTopic(playerId, 1)
        else
            npcHandler:say("I have nothing for you.", npc, creature)
        end		
    elseif MsgContains(message, "yes") and npcHandler:getTopic(playerId) == 1 then
            npcHandler:say("Alright then. Please come back to me when you've found sufficient proof of his death.", npc, creature)
            player:setStorageValue(45000, 8)
            npcHandler:setTopic(playerId, 0)
			
    elseif MsgContains(message, "no") and npcHandler:getTopic(playerId) == 1 then
            npcHandler:say("Your choice. You know where to find me if you\'re interested.", npc, creature)
            npcHandler:setTopic(playerId, 0)
			
    elseif MsgContains(message, "watch") and npcHandler:getTopic(playerId) == 0 then
        if player:getStorageValue(45000) == 8 and player:getItemCount(24969) >= 1 then
            local item = player:getItemById(24969, true)
            if item and item:getActionId() == 666 then
                item:remove(1)
                npcHandler:say({
				"Ah yes. That was definitely the professor\'s watch. I\'ll have to notify his family that his death has been confirmed.",
                "Fanglethorn would be honored to have such a courageous warrior by his side.",
                "Anyway, like I said, I don\'t know much. I have been studying the unique ooze sample that Fanglethorn brought me, and my findings are quite interesting.",
                "Apparently, this ooze has some amount of holiness to it. When spread on Satan\'s skin, it completely incinerates him!",
                "Of course, I have only tested this on dead corpses. I do not know the evil enchantments possessed by that evil creature.", 
                "I fear that Satan may not be the strongest creature in our world. Go adventurer, but please be careful. There is no word to define the wickedness that is involved here.", 
				}, npc, creature)
                player:setStorageValue(45000, 9)
            else
                npcHandler:say("This is just a regular watch!", npc, creature)
				npcHandler:setTopic(playerId, 0)
            end
        else
            npcHandler:say("I have nothing for you.", npc, creature)
        end
        return true
    end
    return true
end
npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcType:register(npcConfig)