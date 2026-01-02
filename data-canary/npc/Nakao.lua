local internalNpcName = "Naoko"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = "una investigadora lunar"

npcConfig.health = 100
npcConfig.maxHealth = 100

npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 140,
	lookHead = 58,
	lookBody = 70,
	lookLegs = 75,
	lookFeet = 2,
	lookAddons = 1
}

Moon = {
		Questline = 73000,
		Mission01 = 73001,
		Mission02 = 73002,
		Mission03 = 73003,
	},
Moon2 = {
	Questline = 73004,
	Mission01 = 73005,
	Mission01Moons = 73006,
	Mission02 = 73007,
	Mission03 = 73008,
	Mission02Crystal = 73009,
},

npcConfig.flags = {
	floorchange = false
}

-- =========================
-- NPC SYSTEM
-- =========================
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

-- 🔥 ESTO ES LO QUE FALTABA
npcHandler:addModule(FocusModule:new())

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
-- CALLBACK DE MENSAJES
-- =========================
local function creatureSayCallback(npc, creature, type, msg)
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local player = creature:getPlayer()
	if not player then
		return false
	end

	msg = msg:lower()

	if msg:find("investigacion") then
		npcHandler:say(
			"Estoy investigando a la luna desde mi telescopio, encuentro algunas anomalias y raras energias en el ambiente, necesito {ayuda} para investgar mas afondo.",
			npc, creature
		)

	elseif msg:find("ayuda") then
		if player:getStorageValue(Moon.Questline) < 1 then
			npcHandler:say(
				"Creo que {Zoltan} podra tener mas informacion sobre el tema, Me podrias ayudar a investigar algo mas?.",
				npc, creature
			)
			npcHandler:setTopic(creature, 1)
		end

	elseif msg:find("mission") or msg:find("mision")
		or msg:find("report") or msg:find("reportar") then

		local questline = player:getStorageValue(Moon.Questline)

		if questline < 1 then
			npcHandler:say(
				"Creo que {Zoltan} podra tener mas informacion sobre el tema, Me podrias ayudar a investigar algo mas?.",
				npc, creature
			)
			npcHandler:setTopic(creature, 1)

		elseif questline == 1 then
			npcHandler:say({
				"Necesito que te dirijas hacia edron y encuentres a {zoltan}...",
				"Preguntale acerca de la {luna}, el podra ayudarnos a resolver este enigma. Cuando regreses a thais no olvides {reportar} conmigo la {mision}."
			}, npc, creature)

			player:setStorageValue(Moon.Questline, 2)
			player:setStorageValue(Moon.Mission01, 1)

		elseif questline == 3 then
			npcHandler:say({
				"Ohh wow no me digas, conozco esa roca ...",
				"Se encuentra al norte de thais, se perfectamente donde esta he estado investigando la caida de un meteorito por esos lugares...",
				"Pondre en tu mapa la ubicacion de la roca, investigala y regresa conmigo para {reportar} la mision."
			}, npc, creature)

			player:setStorageValue(Moon.Questline, 4)
			player:setStorageValue(Moon.Mission01, 3)
			player:setStorageValue(Moon.Mission02, 1)
			player:addMapMark(Position(32333, 32035, 7), MAPMARK_STAR, "The Rock")

		elseif questline == 5 then
			npcHandler:say({
				"Vaya al parecer la roca es algo especial...",
				"Parece ser como un portal pero... creo que necesita cargarlo con algo...",
				"Dentro de mi investigacion y mi busqueda logre conseguir algunos {Moonlight Crystals} creo que deben de servir para algo...",
				"Pero desafortunadamente no me queda ninguno, agradeceria si pudieras conseguir 10 {Moonlight Crystals} para mi, me ayudaria en mi investigacion."
			}, npc, creature)

			player:setStorageValue(Moon.Questline, 6)
			player:setStorageValue(Moon.Mission02, 3)
			player:setStorageValue(Moon.Mission03, 1)

		elseif player:getStorageValue(Moon.Mission03) == 1 then
			if player:getItemCount(24739) >= 10 then
				npcHandler:say({
					"Los haz conseguido? muchisimas gracias, creo que con esto puedo resolver como funciona el portal...",
					"Se necesitan 5 {Moonlight Crystals} para cargar el portal y poder usarlo, pero sinceramente no se cual sea su destino...",
					"Creo que te usare como mi conejillo de indias jaja, toma estos 5 {Moonlight Crystals}, usalos y mucha suerte...",
					"Espero me cuentes todo cuando regreses."
				}, npc, creature)

				player:removeItem(24739, 5)
				player:setStorageValue(Moon.Questline, 7)
				player:setStorageValue(Moon.Mission03, 2)
			else
				npcHandler:say(
					"Aun no haz conseguido las 10 {Moonlight Crystals}.",
					npc, creature
				)
			end
		end

	elseif msg == "yes" or msg == "si" then
		if npcHandler:getTopic(creature) == 1 then
			npcHandler:say(
				"Muchas gracias, preguntame por la primer {mision} que te encomendare.",
				npc, creature
			)
			player:setStorageValue(Moon.Questline, 1)
			npcHandler:setTopic(creature, 0)
		end

	elseif msg == "no" then
		if npcHandler:getTopic(creature) > 0 then
			npcHandler:say("Ok entonces no.", npc, creature)
			npcHandler:setTopic(creature, 0)
		end
	end

	return true
end

-- =========================
-- KEYWORDS
-- =========================
keywordHandler:addKeyword({"zoltan"}, StdModule.say, {
	npcHandler = npcHandler,
	text = "Yo creo que lo puedes encontrar en las torres de edron."
})

keywordHandler:addKeyword({"luna"}, StdModule.say, {
	npcHandler = npcHandler,
	text = "Yo me encargo de investigar la luna"
})

-- =========================
-- MENSAJES BASE
-- =========================
npcHandler:setMessage(
	MESSAGE_GREET,
	"Saludos, companer@ |PLAYERNAME| estoy realizando una {investigacion} sobre la luna!""
)
npcHandler:setMessage(
	MESSAGE_FAREWELL,
	"Cuida tus pasos, |PLAYERNAME|."
)
npcHandler:setMessage(
	MESSAGE_WALKAWAY,
	"Te has alejado demasiado..."
)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcType:register(npcConfig)
