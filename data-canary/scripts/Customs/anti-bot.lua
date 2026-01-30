local config = {
	minutesToAnswer = 2, -- minutes to answer anti bot system
	delayAntiBot = 30, -- minutes of delay of delayAntiBot
	maxGroupId = 1, -- groupid higher than this don't have antiBotSystem Activated
	prisionPosition = Position(513, 893, 8), -- if don't answer, go to this pos
	prisionMinutes = 60, -- time inside the prision
	antibotChannelId = 15, -- id do channel antibot
}

local antiBotPrisionEvent = {}
local antiBotCheckAnswerEvent = {}
local antiBotEvent = {}

local function stopAllAntiBotEvent(playerGuid)
	stopEvent(antiBotPrisionEvent[playerGuid])
	stopEvent(antiBotCheckAnswerEvent[playerGuid])
	stopEvent(antiBotEvent[playerGuid])
	antiBotPrisionEvent[playerGuid] = nil
	antiBotCheckAnswerEvent[playerGuid] = nil
	antiBotEvent[playerGuid] = nil
end

local function checkPrisioned(playerGuid)
	local player = Player(playerGuid)
	if player then
		local isPrisioned = player:kv():get("antibot-is-prisioned") or false
		if isPrisioned then
			local prisionTime = player:kv():get("antibot-prision-time") or 0
			if os.time() >= prisionTime then
				player:openChannel(config.antibotChannelId)
				player:sendChannelMessage(player, "[Anti-Bot] You had completed your time here in the prision! You may now relog to go to the city.", TALKTYPE_CHANNEL_O, config.antibotChannelId)

				player:kv():remove("antibot-is-prisioned")
				player:kv():remove("antibot-prision-time")
				player:teleportTo(player:getTown():getTemplePosition())
			else
				antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, (60 * 1000), playerGuid)
			end
		end
	end
end

local function checkAnswer(playerGuid)
	local player = Player(playerGuid)
	if player then
		if not staminaBonus.eventsTrainer[player:getId()] then
			local tile = Tile(player:getPosition())
			if tile then
				if not tile:hasFlag(TILESTATE_PROTECTIONZONE) then
					local wrongAnswers = player:kv():get("antibot-wrong-answers") or 0
					local isPrisioned = player:kv():get("antibot-is-prisioned") or false
					local answerPlayer = player:kv():get("antibot-answer-player") or false
					local resultOperation = player:kv():get("antibot-result-operation") or 0

					player:kv():remove("antibot-first-number")
					player:kv():remove("antibot-second-number")
					player:kv():remove("antibot-wrong-answers")
					player:kv():remove("antibot-answer-player")
					player:kv():remove("antibot-wrong-answers")

					player:openChannel(config.antibotChannelId)

					if wrongAnswers > 3 or (not answerPlayer and not isPrisioned and resultOperation > 0) then
						player:teleportTo(config.prisionPosition)
						player:kv():set("antibot-is-prisioned", true)
						player:kv():set("antibot-prision-time", os.time() + (config.prisionMinutes * 60))
						antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, 1000, playerGuid)
						if wrongAnswers > 3 then
							player:sendChannelMessage(player, "[Anti-Bot] Time limit! You had been prisioned for " .. config.prisionMinutes .. " minute(s) because answered many wrong times.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
						else
							player:sendChannelMessage(player, "[Anti-Bot] Time limit! You had been prisioned for " .. config.prisionMinutes .. " minute(s).", TALKTYPE_CHANNEL_O, config.antibotChannelId)
						end
					else
						player:sendChannelMessage(player, "[Anti-Bot] You are ok, but in some minutes you are going to be asked again.", TALKTYPE_CHANNEL_O, config.antibotChannelId)

						player:kv():remove("antibot-is-prisioned")
						player:kv():remove("antibot-prision-time")
					end
				end
			end
		end
	end
end

local function antiBot(playerGuid)
	local player = Player(playerGuid)
	if player then
		local isPrisioned = player:kv():get("antibot-is-prisioned") or false
		if not isPrisioned and not staminaBonus.eventsTrainer[player:getId()] then
			local tile = Tile(player:getPosition())
			if tile then
				if not tile:hasFlag(TILESTATE_PROTECTIONZONE) then
					local firstNumber = math.random(1, 9)
					local secondNumber = math.random(1, 9)
					local resultOperation = firstNumber + secondNumber

					player:kv():set("antibot-first-number", firstNumber)
					player:kv():set("antibot-second-number", secondNumber )
					player:kv():set("antibot-result-operation", resultOperation)

					player:openChannel(config.antibotChannelId)

					player:sendChannelMessage(player, "[Anti-Bot] Hello, " .. player:getName() .. "! You have " .. config.minutesToAnswer .. " minute(s) to answer how much is " .. firstNumber .. " + " .. secondNumber .. ". To answer say: !antibot 'number'", TALKTYPE_CHANNEL_O, config.antibotChannelId)
					player:sendChannelMessage(player, "[Anti-Bot] Example: 20 + 20 = 40, then you would say !antibot 40", TALKTYPE_CHANNEL_O, config.antibotChannelId)

					antiBotCheckAnswerEvent[playerGuid] = addEvent(checkAnswer, config.minutesToAnswer * 60 * 1000, playerGuid)
				end
			end
		end

		antiBotEvent[playerGuid] = addEvent(antiBot, config.delayAntiBot * 60 * 1000, playerGuid)
	end
end

-- CREATURESCRIPT LOGIN
local playerLogin = CreatureEvent("anti-bot-login")

function playerLogin.onLogin(player)
	local playerGuid = player:getGuid()
	local isPrisioned = player:kv():get("antibot-is-prisioned") or false
	if isPrisioned then
		local prisionTime = player:kv():get("antibot-prision-time") or 0
		if os.time() >= prisionTime then
			player:kv():remove("antibot-prision-time")
			player:kv():remove("antibot-is-prisioned")
			player:teleportTo(player:getTown():getTemplePosition())
		else
			antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, 1000, playerGuid)
			player:teleportTo(config.prisionPosition)
		end
	end

	if config.delayAntiBot <= config.minutesToAnswer then
		logger.error("[Anti-Bot System] variable delayAntiBot need to be higher than minutesToAnswer.")
		return true
	end

	if player:getGroup():getId() > config.maxGroupId then
		player:openChannel(config.antibotChannelId)
		player:sendChannelMessage(player, "[Anti-Bot] Right answer, but you had already answered more than 3 wrong times.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
		return true
	end

	antiBotEvent[playerGuid] = addEvent(antiBot, 1000, playerGuid)

	return true
end

playerLogin:register()

-- CREATURESCRIPT LOGOUT
local playerLogout = CreatureEvent("anti-bot-logout")

function playerLogout.onLogout(player)
	stopAllAntiBotEvent(player:getGuid())

	player:kv():remove("antibot-wrong-answers")
	player:kv():remove("antibot-first-number")
	player:kv():remove("antibot-second-number")
	player:kv():remove("antibot-result-operation")
	player:kv():remove("antibot-answer-player")

	return true
end

playerLogout:register()

-- TALKACTION SAY
local talkaction = TalkAction("!antibot")

function talkaction.onSay(player, words, param)
	local isPrisioned = player:kv():get("antibot-is-prisioned") or false
	local answerPlayer = player:kv():get("antibot-answer-player") or false
	local resultOperation = player:kv():get("antibot-result-operation") or 0

	if not isPrisioned and not answerPlayer and resultOperation > 0 then

		player:openChannel(config.antibotChannelId)
		
		local wrongAnswers = player:kv():get("antibot-wrong-answers") or 0
		if wrongAnswers > 3 then
			player:sendChannelMessage(player, "[Anti-Bot] Right answer, but you had already answered more than 3 wrong times.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
			return true
		end

		local answer = tonumber(param)
		if answer ~= resultOperation then
			player:sendChannelMessage(player, "[Anti-Bot] Wrong answer! You had already got " .. (wrongAnswers + 1) .. " wrong answers! The limit is 3.", TALKTYPE_CHANNEL_O, config.antibotChannelId)
			player:kv():set("antibot-wrong-answers", wrongAnswers + 1)
			return true
		end

		player:sendChannelMessage(player, "[Anti-Bot] Right answer, thank you for answering.", TALKTYPE_CHANNEL_O, config.antibotChannelId)

		player:kv():remove("antibot-wrong-answers")
		player:kv():remove("antibot-first-number")
		player:kv():remove("antibot-second-number")
		player:kv():remove("antibot-result-operation")
		player:kv():set("antibot-answer-player", true)
	end
end

talkaction:separator(" ")
talkaction:groupType("normal")
talkaction:register()
