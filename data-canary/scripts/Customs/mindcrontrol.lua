local mindcontrol = TalkAction("/mindcontrol")

function mindcontrol.onSay(player, words, param)

	-- Below param parser might not respect talkaction separator
	-- (such as player names with space in them)
	local t = param:split(",")
	local tmp = t[1]
	if t[2] then
		tmp = t[2]
	end
	
	if param == '' then 
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Command param required, example: /mindcontrol Maloka, msg.')
		return true
	end

	local mindControlled = Player(t[1])
	if not mindControlled then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This Player no exist.')
		return true
	else
		mindControlled:say(tmp,TALKTYPE_SAY)
	end
	return true
end

mindcontrol:separator(" ")
mindcontrol:groupType("god")
mindcontrol:register()