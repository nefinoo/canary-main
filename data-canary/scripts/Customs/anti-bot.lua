local config = {
	minutesToAnswer = 5, -- minutes to answer anti bot system
	delayAntiBot = 60, -- minutes of delay of delayAntiBot
	maxGroupId = 1, -- groupid higher than this don't have antiBotSystem Activated

	-- 10 PRISIONS
	prisionPositions = {
		Position(513, 893, 8),
		Position(518, 893, 8),
		Position(523, 893, 8),
		Position(528, 893, 8),
		Position(533, 893, 8),
		Position(513, 907, 8),
		Position(518, 907, 8),
		Position(523, 907, 8),
		Position(528, 907, 8),
		Position(533, 907, 8),
	},

	prisionMinutes = 60, -- time inside the prision
	antibotChannelId = 15 -- id do channel antibot
}

local antiBotPrisionEvent = {}
local antiBotCheckAnswerEvent = {}
local antiBotEvent = {}

local function getRandomPrisionPosition()
	return config.prisionPositions[math.random(#config.prisionPositions)]
end

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
	if not player then
		return
	end

	if not (player:kv():get("antibot-is-prisioned") or false) then
		return
	end

	local prisionTime = player:kv():get("antibot-prision-time") or 0
	if os.time() >= prisionTime then
		player:openChannel(config.antibotChannelId)
		player:sendChannelMessage(
			player,
			"[Anti-Bot] You had completed your time here in the prision!",
			TALKTYPE_CHANNEL_O,
			config.antibotChannelId
		)

		player:kv():remove("antibot-is-prisioned")
		player:kv():remove("antibot-prision-time")
		player:kv():remove("antibot-prision-position")

		player:teleportTo(player:getTown():getTemplePosition())
	else
		antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, 60 * 1000, playerGuid)
	end
end

local function checkAnswer(playerGuid)
	local player = Player(playerGuid)
	if not player then
		return
	end

	if staminaBonus.eventsTrainer[player:getId()] then
		return
	end

	local tile = Tile(player:getPosition())
	if tile and not (tile:hasFlag(TILESTATE_PROTECTIONZONE) or tile:hasFlag(TILESTATE_NOLOGOUT)) then
		return
	end

	local wrongAnswers = player:kv():get("antibot-wrong-answers") or 0
	local isPrisioned = player:kv():get("antibot-is-prisioned") or false
	local answerPlayer = player:kv():get("antibot-answer-player") or false
	local resultOperation = player:kv():get("antibot-result-operation") or 0

	player:kv():remove("antibot-first-number")
	player:kv():remove("antibot-second-number")
	player:kv():remove("antibot-answer-player")

	player:openChannel(config.antibotChannelId)

	if wrongAnswers > 3 or (not answerPlayer and not isPrisioned and resultOperation > 0) then
		local prisonPos = getRandomPrisionPosition()

		player:teleportTo(prisonPos)
		player:kv():set("antibot-is-prisioned", true)
		player:kv():set("antibot-prision-time", os.time() + (config.prisionMinutes * 60))
		player:kv():set("antibot-prision-position", prisonPos)

		antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, 1000, playerGuid)

		if wrongAnswers > 3 then
			player:sendChannelMessage(
				player,
				"[Anti-Bot] Time limit! You had been prisioned for " .. config.prisionMinutes .. " minute(s) because answered many wrong times.",
				TALKTYPE_CHANNEL_O,
				config.antibotChannelId
			)
		else
			player:sendChannelMessage(
				player,
				"[Anti-Bot] Time limit! You had been prisioned for " .. config.prisionMinutes .. " minute(s).",
				TALKTYPE_CHANNEL_O,
				config.antibotChannelId
			)
		end
	else
		player:sendChannelMessage(
			player,
			"[Anti-Bot] You are ok, but in some minutes you are going to be asked again.",
			TALKTYPE_CHANNEL_O,
			config.antibotChannelId
		)
	end
end

local function antiBot(playerGuid)
	local player = Player(playerGuid)
	if not player then
		return
	end

	if player:kv():get("antibot-is-prisioned") then
		return
	end

	if staminaBonus.eventsTrainer[player:getId()] then
		return
	end

	local tile = Tile(player:getPosition())
	-- if tile and not tile:hasFlag(TILESTATE_PROTECTIONZONE) then
	if tile and not (tile:hasFlag(TILESTATE_PROTECTIONZONE) or tile:hasFlag(TILESTATE_NOLOGOUT)) then
		local firstNumber = math.random(1, 99)
		local secondNumber = math.random(1, 99)
		local resultOperation = firstNumber + secondNumber

		player:kv():set("antibot-first-number", firstNumber)
		player:kv():set("antibot-second-number", secondNumber)
		player:kv():set("antibot-result-operation", resultOperation)

		player:openChannel(config.antibotChannelId)
		player:sendCancelMessage("[Anti-Bot] Check The Anti-Bot Channel")

		player:sendChannelMessage(
			player,
			"[Anti-Bot] Hello, " .. player:getName() .. "! You have " .. config.minutesToAnswer .. " minute(s) to answer how much is " ..
			firstNumber .. " + " .. secondNumber .. ". To answer say: !antibot number",
			TALKTYPE_CHANNEL_O,
			config.antibotChannelId
		)

		antiBotCheckAnswerEvent[playerGuid] = addEvent(
			checkAnswer,
			config.minutesToAnswer * 60 * 1000,
			playerGuid
		)
	end

	antiBotEvent[playerGuid] = addEvent(
		antiBot,
		config.delayAntiBot * 60 * 1000,
		playerGuid
	)
end

-- LOGIN
local playerLogin = CreatureEvent("anti-bot-login")

function playerLogin.onLogin(player)
	local playerGuid = player:getGuid()

	if player:kv():get("antibot-is-prisioned") then
		local prisionTime = player:kv():get("antibot-prision-time") or 0
		if os.time() >= prisionTime then
			player:kv():remove("antibot-is-prisioned")
			player:kv():remove("antibot-prision-time")
			player:kv():remove("antibot-prision-position")
			player:teleportTo(player:getTown():getTemplePosition())
		else
			local prisonPos = player:kv():get("antibot-prision-position") or getRandomPrisionPosition()
			player:teleportTo(prisonPos)
			antiBotPrisionEvent[playerGuid] = addEvent(checkPrisioned, 1000, playerGuid)
		end
	end

	if player:getGroup():getId() > config.maxGroupId then
		return true
	end

	antiBotEvent[playerGuid] = addEvent(antiBot, 1000, playerGuid)
	return true
end

playerLogin:register()

-- LOGOUT
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

-- TALKACTION
local talkaction = TalkAction("!antibot")

function talkaction.onSay(player, words, param)
	local isPrisioned = player:kv():get("antibot-is-prisioned") or false
	local answerPlayer = player:kv():get("antibot-answer-player") or false
	local resultOperation = player:kv():get("antibot-result-operation") or 0

	if isPrisioned or answerPlayer or resultOperation <= 0 then
		return true
	end

	player:openChannel(config.antibotChannelId)

	local wrongAnswers = player:kv():get("antibot-wrong-answers") or 0
	local answer = tonumber(param)

	if answer ~= resultOperation then
		player:kv():set("antibot-wrong-answers", wrongAnswers + 1)
		player:sendChannelMessage(
			player,
			"[Anti-Bot] Wrong answer! You had already got " .. (wrongAnswers + 1) .. " wrong answers! The limit is 3.",
			TALKTYPE_CHANNEL_O,
			config.antibotChannelId
		)
		return true
	end

	player:sendChannelMessage(
		player,
		"[Anti-Bot] Right answer, thank you for answering.",
		TALKTYPE_CHANNEL_O,
		config.antibotChannelId
	)

	player:kv():remove("antibot-wrong-answers")
	player:kv():remove("antibot-first-number")
	player:kv():remove("antibot-second-number")
	player:kv():remove("antibot-result-operation")
	player:kv():set("antibot-answer-player", true)

	return true
end

talkaction:separator(" ")
talkaction:groupType("normal")
talkaction:register()
