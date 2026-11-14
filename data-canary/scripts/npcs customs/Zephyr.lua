local internalNpcName = "Zephyr"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookTypeEx = 24432,
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

local QUEST_STORAGE = 45001

local HAMMER_ID = 50739
local HAMMER_ACTION_ID = 666

local EMPTY_MAGNET_ID = 19207
local CHARGED_MAGNET_ID = 19218
local MAGNET_ACTION_ID = 666

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
	if not player then
		return false
	end

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local playerId = player:getId()
	local topic = npcHandler:getTopic(playerId)
	local storage = player:getStorageValue(QUEST_STORAGE)

	local isHelp =
		MsgContains(message, "help")
		or MsgContains(message, "ayuda")
		or MsgContains(message, "mission")
		or MsgContains(message, "quest")

	local isMagic =
		MsgContains(message, "magic")
		or MsgContains(message, "arcane")
		or MsgContains(message, "arcane magic")

	local isCreatures =
		MsgContains(message, "creature")
		or MsgContains(message, "creatures")
		or MsgContains(message, "beast")
		or MsgContains(message, "beasts")

	local isCurse =
		MsgContains(message, "curse")
		or MsgContains(message, "maldicion")

	local isCrystal =
		MsgContains(message, "crystal")
		or MsgContains(message, "crystals")
		or MsgContains(message, "pylon")
		or MsgContains(message, "pylons")

	local isMagnet =
		MsgContains(message, "magnet")
		or MsgContains(message, "iman")

	local isYes =
		MsgContains(message, "yes")
		or MsgContains(message, "si")

	local isNo =
		MsgContains(message, "no")

	-- =====================================================
	-- Introducción de Zephyr
	-- Storage -1 o 0
	-- =====================================================

	if isHelp and storage <= 0 and topic == 0 then
		npcHandler:say({
			"Help...? After all these years, I never thought I would hear that word again.",
			"Forgive me... I almost forgot what kindness feels like.",
			"My name is Zephyr.",
			"Long ago, I devoted my life to studying the balance between nature and {arcane magic}.",
		}, npc, creature)

		npcHandler:setTopic(playerId, 1)
		return true
	end

	if isMagic and storage <= 0 and topic == 1 then
		npcHandler:say({
			"Everything changed during one of my experiments.",
			"A terrible mistake left me trapped inside this fragile body.",
			"I've searched for a cure ever since... but without hands, even the simplest spell has become impossible.",
			"The beasts outside... they weren't always like that.",
			"When the ritual failed, the magic spread across the sanctuary.",
			"The animals were twisted into violent {creatures} beyond recognition.",
		}, npc, creature)

		npcHandler:setTopic(playerId, 2)
		return true
	end

	if isCreatures and storage <= 0 and topic == 2 then
		npcHandler:say({
			"I've spent years watching them destroy everything I once protected.",
			"Powerless...",
			"Unable to stop them.",
			"If you truly wish to help me...",
			"I believe there may still be a way to undo this {curse}.",
		}, npc, creature)

		npcHandler:setTopic(playerId, 3)
		return true
	end

	if isCurse and storage <= 0 and topic == 3 then
		npcHandler:say({
			"The ritual requires several ancient artifacts.",
			"Unfortunately, the creatures roaming these lands now guard them.",
			"I cannot retrieve them myself.",
			"But perhaps... you can.",
			"Help me restore what was lost...",
			"And I shall reward you with knowledge and treasures few mortals have ever witnessed.",
			"Are you interested?",
		}, npc, creature)

		npcHandler:setTopic(playerId, 4)
		return true
	end

	-- =====================================================
	-- Aceptar primera misión
	-- =====================================================

	if isYes and storage <= 0 and topic == 4 then
		local hammer = player:addItem(HAMMER_ID, 1)

		if not hammer then
			npcHandler:say(
				"You do not have enough room to carry Eon. Make some space and speak to me again.",
				npc,
				creature
			)
			return true
		end

		hammer:setActionId(HAMMER_ACTION_ID)
		hammer:setAttribute(ITEM_ATTRIBUTE_NAME, "Eon")
		hammer:setAttribute(
			ITEM_ATTRIBUTE_DESCRIPTION,
			"A mysterious hammer forged to shatter enchanted crystal pylons."
		)

		player:setStorageValue(QUEST_STORAGE, 1)
		npcHandler:setTopic(playerId, 0)

		npcHandler:say({
			"There is something you can do for me.",
			"Throughout the sanctuary stand five ancient crystal pylons, each hidden within one of its towers.",
			"Ever since the accident, those crystals have been radiating unstable arcane energy.",
			"I believe they are feeding the corruption that twisted the wildlife into the savage creatures you fought on your way here.",
			"If we are to restore this place... those crystals must be destroyed.",
			"Please, travel to each tower and shatter all five crystal pylons.",
			"Normal weapons cannot harm them, so take this hammer. Its name is Eon.",
			"Be careful. The beasts instinctively protect the pylons, as if they know their purpose.",
			"Return to me once every crystal has been reduced to dust.",
		}, npc, creature)

		return true
	end

	if isNo and storage <= 0 and topic == 4 then
		npcHandler:say(
			"I understand. But should you reconsider, ask me for {help}.",
			npc,
			creature
		)

		npcHandler:setTopic(playerId, 0)
		return true
	end

	-- =====================================================
	-- Storage 1: destruyendo los cinco cristales
	-- =====================================================

	if storage == 1 then
		if isHelp or isCrystal then
			local hammer = player:getItemById(HAMMER_ID, true)

			if not hammer or hammer:getActionId() ~= HAMMER_ACTION_ID then
				npcHandler:say({
					"You have not yet destroyed all five crystal pylons.",
					"But I also cannot sense Eon in your possession.",
					"You will need the hammer to shatter the remaining crystals.",
				}, npc, creature)
			else
				npcHandler:say({
					"You have not yet destroyed all five crystal pylons.",
					"Search the sanctuary towers and use Eon on each intact crystal.",
					"Return to me after all five have been shattered.",
				}, npc, creature)
			end

			return true
		end

		if isYes then
			npcHandler:say(
				"Not yet. I can still feel the five pylons channeling their energy. Destroy them all and then return to me.",
				npc,
				creature
			)
			return true
		end
	end

	-- =====================================================
	-- Storage 2: cristales destruidos, entregar martillo
	-- =====================================================

	if storage == 2 then
		if isHelp or isCrystal or isYes then
			local hammer = player:getItemById(HAMMER_ID, true)

			if not hammer then
				npcHandler:say({
					"I can feel that the five crystals have been destroyed.",
					"However, you must return Eon to me before we continue.",
				}, npc, creature)

				return true
			end

			if hammer:getActionId() ~= HAMMER_ACTION_ID then
				npcHandler:say(
					"That is not Eon. Return the enchanted hammer I entrusted to you.",
					npc,
					creature
				)
				return true
			end

			hammer:remove(1)
			player:setStorageValue(QUEST_STORAGE, 3)
			npcHandler:setTopic(playerId, 0)

			npcHandler:say({
				"Excellent...",
				"You actually managed to destroy every crystal.",
				"I can already feel the magical currents changing.",
				"You have done more for me than anyone else in decades.",
				"I believe we are one step closer to breaking my curse.",
				"Are you ready for your next task?",
			}, npc, creature)

			return true
		end
	end

	-- =====================================================
	-- Storage 3: esperando que acepte la misión del imán
	-- =====================================================

	if storage == 3 then
		if isHelp then
			npcHandler:say({
				"The destruction of the crystal pylons revealed another source of arcane energy.",
				"I need you to collect that energy using a special magnet.",
				"Are you ready for your next task?",
			}, npc, creature)

			return true
		end

		if isYes then
			local magnet = player:addItem(EMPTY_MAGNET_ID, 1)

			if not magnet then
				npcHandler:say(
					"You do not have enough room to carry the enchanted magnet. Make some space and speak to me again.",
					npc,
					creature
				)
				return true
			end

			magnet:setActionId(MAGNET_ACTION_ID)
			magnet:setAttribute(ITEM_ATTRIBUTE_NAME, "Enchanted Magnet")
			magnet:setAttribute(
				ITEM_ATTRIBUTE_DESCRIPTION,
				"An enchanted magnet. Its magical essence has long since faded."
			)

			player:setStorageValue(QUEST_STORAGE, 4)
			npcHandler:setTopic(playerId, 0)

			npcHandler:say({
				"Take this enchanted magnet.",
				"Its magical charge has completely faded.",
				"Across the sanctuary are ten deposits of sparkling arcane energy.",
				"Use the magnet on each one so it can absorb their power.",
				"Once the magnet is fully charged, return it to me.",
			}, npc, creature)

			return true
		end

		if isNo then
			npcHandler:say(
				"Very well. Speak to me again when you are ready to continue.",
				npc,
				creature
			)
			return true
		end
	end

	-- =====================================================
	-- Storage 4: cargando el imán
	-- =====================================================

	if storage == 4 then
		if isHelp or isMagnet then
			local emptyMagnet = player:getItemById(EMPTY_MAGNET_ID, true)
			local chargedMagnet = player:getItemById(CHARGED_MAGNET_ID, true)

			if chargedMagnet and chargedMagnet:getActionId() == MAGNET_ACTION_ID then
				npcHandler:say({
					"The magnet appears to be fully charged.",
					"Bring it to me and tell me {yes} when you are ready to hand it over.",
				}, npc, creature)
			elseif emptyMagnet and emptyMagnet:getActionId() == MAGNET_ACTION_ID then
				npcHandler:say({
					"The enchanted magnet still needs more energy.",
					"Use it on all ten sparkling deposits scattered throughout the sanctuary.",
					"Return once its charge is complete.",
				}, npc, creature)
			else
				npcHandler:say({
					"I cannot sense the enchanted magnet in your possession.",
					"You need it to absorb the energy from the ten sparkling deposits.",
				}, npc, creature)
			end

			return true
		end

		if isYes then
			local chargedMagnet = player:getItemById(CHARGED_MAGNET_ID, true)

			if chargedMagnet and chargedMagnet:getActionId() == MAGNET_ACTION_ID then
				npcHandler:say(
					"The magnet is fully charged, but its energy has not stabilized yet. Try speaking to me again in a moment.",
					npc,
					creature
				)
			else
				npcHandler:say(
					"Not yet. The magnet must absorb energy from all ten sparkling deposits before you can return it.",
					npc,
					creature
				)
			end

			return true
		end
	end

	-- =====================================================
	-- Storage 5: imán cargado, entregarlo
	-- =====================================================

	if storage == 5 then
		if isHelp or isMagnet or isYes then
			local magnet = player:getItemById(CHARGED_MAGNET_ID, true)

			if not magnet then
				npcHandler:say({
					"I can sense that the magnet has been fully charged.",
					"But you do not appear to have it with you.",
					"Bring me the charged magnet so we can continue.",
				}, npc, creature)

				return true
			end

			if magnet:getActionId() ~= MAGNET_ACTION_ID then
				npcHandler:say(
					"That is not the enchanted magnet I gave you.",
					npc,
					creature
				)
				return true
			end

			magnet:remove(1)
			player:setStorageValue(QUEST_STORAGE, 6)
			npcHandler:setTopic(playerId, 0)
			player:setStorageValue(45002, 1)

			npcHandler:say({
				"Wonderful...",
				"The magnet is overflowing with arcane energy.",
				"This power will be invaluable to the ritual.",
				"You have once again exceeded my expectations.",
				"The energy you gathered has awakened the magical seal protecting my laboratory.",
				"You may now enter the laboratory.",
				"Find the sealed door beyond the sanctuary. It will recognize the arcane energy now bound to your spirit.",
				"Enter carefully... there are things inside that have remained undisturbed for many years.",
			}, npc, creature)

			return true
		end
	end

	-- =====================================================
	-- Storage 6: etapa completada
	-- =====================================================

	if storage == 6 then
		if isHelp or isCrystal or isMagnet or isYes then
			npcHandler:say({
				"The entrance to my laboratory is now open to you.",
				"Search for the magical sealed door beyond the sanctuary.",
				"The seal will only allow passage to someone carrying the arcane mark you obtained from the charged magnet.",
				"Enter the laboratory and search for anything that may help us complete the ritual.",
			}, npc, creature)

			return true
		end
	end

	-- =====================================================
	-- Respuestas para palabras correctas en orden incorrecto
	-- =====================================================

	if isMagic and topic ~= 1 then
		npcHandler:say(
			"My knowledge of arcane magic is extensive, but first ask me for {help} so I know where to begin.",
			npc,
			creature
		)
		return true
	end

	if isCreatures and topic ~= 2 then
		npcHandler:say(
			"The creatures are connected to my unfortunate condition. Ask me for {help}, and I will explain everything in order.",
			npc,
			creature
		)
		return true
	end

	if isCurse and topic ~= 3 then
		npcHandler:say(
			"My curse is not easily explained. Ask me for {help}, and listen carefully to my story.",
			npc,
			creature
		)
		return true
	end

	if isNo then
		npcHandler:say(
			"Very well. Speak to me again whenever you are ready.",
			npc,
			creature
		)
		npcHandler:setTopic(playerId, 0)
		return true
	end

	-- Zephyr nunca se queda callado
	npcHandler:say(
		"I'm afraid I don't understand. Ask me about your {mission} if you need guidance.",
		npc,
		creature
	)

	return true
end

npcHandler:setMessage(
	MESSAGE_GREET,
	"Welcome, brave traveler. Forgive my appearance... I was not always a simple parrot."
)

npcHandler:setMessage(
	MESSAGE_FAREWELL,
	"May fortune guide your path, |PLAYERNAME|."
)

npcHandler:setMessage(
	MESSAGE_WALKAWAY,
	"Please... don't take too long. Time is not on my side."
)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcType:register(npcConfig)