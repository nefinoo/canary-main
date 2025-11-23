local randomOutfit = Action()

local TOKEN_ID = 52583
local TOKEN_COST = 500
local UNIQUE_ID = 1000

-- Función para elegir un outfit válido aleatorio
local function getRandomOutfit()
	local outcome = math.random(2, 351)

	if (outcome > 127 and outcome < 159)
	or (outcome > 160 and outcome < 192)
	or (outcome > 149 and outcome < 153)
	or (outcome > 266 and outcome < 274)
	or (outcome > 277 and outcome < 280)
	or (outcome > 287 and outcome < 290)
	or (outcome > 323 and outcome < 326)
	or (outcome > 326 and outcome < 330)
	or (outcome > 250 and outcome < 253)
	or outcome == 75 or outcome == 266 or outcome == 302 then
		return false
	end

	return outcome
end

function randomOutfit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item:getUniqueId() ~= UNIQUE_ID then
		return false
	end

	if player:getItemCount(TOKEN_ID) < TOKEN_COST then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You do not have enough tokens.")
		return true
	end

	local rand
	repeat
		rand = getRandomOutfit()
	until rand ~= false

	local newOutfit = {
		lookType = rand,
		lookHead = 0,
		lookBody = 0,
		lookLegs = 0,
		lookFeet = 0,
		lookAddons = 0
	}

	player:removeItem(TOKEN_ID, TOKEN_COST)
	player:setOutfit(newOutfit)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Your outfit has been changed to a random one!")

	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	return true
end

randomOutfit:uid(UNIQUE_ID)
randomOutfit:register()
