local flask = TalkAction("!flask")

local FLASK_STORAGE = 45010

function flask.onSay(player, words, param)
	param = param:lower()

	if param == "on" then
		player:setStorageValue(FLASK_STORAGE, 1)

		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"You will not receive flasks!"
		)

		player:getPosition():sendMagicEffect(CONST_ME_REDSMOKE)

	elseif param == "off" then
		player:setStorageValue(FLASK_STORAGE, 0)

		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"You will receive flasks."
		)

		player:getPosition():sendMagicEffect(CONST_ME_REDSMOKE)

	else
		player:sendCancelMessage("Usage: !flask on/off")
	end

	return true
end

flask:separator(" ")
flask:groupType("normal")
flask:register()