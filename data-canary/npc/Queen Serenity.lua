local internalNpcName = "Queen Serenity"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = "la reina de la luna"

npcConfig.health = 100
npcConfig.maxHealth = 100

npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 852,
	lookHead = 0,
	lookBody = 38,
	lookLegs = 0,
	lookFeet = 38,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

-- =========================
-- NPC SYSTEM
-- =========================
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

npcType.onSay = function(npc, creature, talkType, msg)
	npcHandler:onSay(npc, creature, talkType, msg)
end

-- =========================
-- GREET CALLBACK
-- =========================
local creatures = {
	"Moon2 knight", "Moon2 knight",
	"Moon2 paladin", "Moon2 paladin", "Moon2 paladin",
	"Moon2 mage", "Moon2 mage", "Moon2 mage"
}

local function greetCallback(npc, creature)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getStorageValue(Storage.OrcKingGreeting) ~= 1 then
		player:setStorageValue(Storage.OrcKingGreeting, 1)

		local pos = npc:getPosition()
		for i = 1, #creatures do
			Game.createMonster(creatures[i], pos)
		end

		npcHandler:say("¿Pero que es esto?!", npc, creature)
		return false
	end

	npcHandler:setMessage(
		MESSAGE_GREET,
		"Wow eres muy fuerte, ¿podrias ayudarme? Me vendria bien algo de {ayuda}."
	)
	return true
end

-- =========================
-- MESSAGE CALLBACK
-- =========================
local function creatureSayCallback(npc, creature, type, msg)
	if not npcHandler:isFocused(creature) then
		return false
	end

	local player = creature:getPlayer()
	if not player then
		return false
	end

	msg = msg:lower()

	if msg:find("ayuda") then
		npcHandler:say(
			"Pertenezco a una raza humanoide de la luna, pero mi hermana Queen {Beryl} se ha revelado contra mi.",
			npc, creature
		)

	elseif msg:find("beryl") then
		if player:getStorageValue(Storage.Moon2.Questline) < 1 then
			npcHandler:say(
				"Beryl esta en sus aposentos, pero sus esclavos me tienen encerrada. ¿Podrias ayudarme?",
				npc, creature
			)
			npcHandler:setTopic(creature, 2)
		end

	elseif msg:find("mission") or msg:find("mision")
		or msg:find("report") or msg:find("reportar") then

		local questline = player:getStorageValue(Storage.Moon2.Questline)

		if questline < 1 then
			npcHandler:say(
				"Beryl esta en sus aposentos, pero sus esclavos me tienen encerrada. ¿Podrias ayudarme?",
				npc, creature
			)
			npcHandler:setTopic(creature, 2)

		elseif questline == 1 then
			npcHandler:say({
				"Necesito que bajes a la fortaleza de los Moons.",
				"Debes matar 500 {Moons}.",
				"Cuando termines regresa a {reportar} la {mision}."
			}, npc, creature)

			player:setStorageValue(Storage.Moon2.Mission01Moons, 0)
			player:setStorageValue(Storage.Moon2.Mission01, 1)

		elseif questline == 2 then
			if player:getStorageValue(Storage.Moon2.Mission01Moons) >= 500 then
				npcHandler:say({
					"¡Lo lograste! Has debilitado sus defensas.",
					"Toma este crystal, necesitaras cargarlo.",
					"Debes usarlo 20 veces con los crystales del sotano.",
					"Cuando termines regresa a {reportar}."
				}, npc, creature)

				player:setStorageValue(Storage.Moon2.Questline, 3)
				player:setStorageValue(Storage.Moon2.Mission02, 1)
				player:addItem(18214, 1)
			else
				npcHandler:say(
					"Aun no has derrotado suficientes Moons.",
					npc, creature
				)
			end

		elseif player:getStorageValue(Storage.Moon2.Mission02Crystal) == 20
			and player:getItemCount(9744) >= 1 then

			npcHandler:say({
				"Excelente, el crystal esta completamente cargado.",
				"Ahora debes enfrentarte a mi hermana.",
				"Traeme una prueba de su muerte."
			}, npc, creature)

			player:setStorageValue(Storage.Moon2.Mission02, 22)
			player:setStorageValue(Storage.Moon2.Mission03, 1)
			player:removeItem(9744, 1)

		elseif player:getStorageValue(Storage.Moon2.Mission03) == 2 then
			npcHandler:say({
				"Lo lograste...",
				"Toma esta recompensa.",
				"Espero que regreses con vida."
			}, npc, creature)

			player:setStorageValue(Storage.Moon2.Mission03, 3)
			player:addItem(2160, 1)
		end

	elseif msg == "yes" or msg == "si" then
		if npcHandler:getTopic(creature) == 2 then
			npcHandler:say(
				"Muchas gracias. Preguntame por tu primera {mision}.",
				npc, creature
			)
			player:setStorageValue(Storage.Moon2.Questline, 1)
			npcHandler:setTopic(creature, 0)
		end

	elseif msg == "no" then
		if npcHandler:getTopic(creature) > 0 then
			npcHandler:say("Entiendo...", npc, creature)
			npcHandler:setTopic(creature, 0)
		end
	end

	return true
end

-- =========================
-- CALLBACKS & MODULES
-- =========================
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:setMessage(MESSAGE_FAREWELL, "Siempre mantente alerta, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Te marchaste demasiado rapido...")

npcHandler:setCallback(CALLBACK_GREET, function(npc, creature)
	return true
end)

npcHandler:setCallback(CALLBACK_FAREWELL, function(npc, creature)
	return true
end)

npcType:register(npcConfig)
